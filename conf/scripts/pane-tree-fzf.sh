#!/usr/bin/env zsh

emulate -L zsh
setopt errexit nounset pipefail

script_path=${0:A}

: "${TMUX_PANE_PICKER_WIDTH:=90%}"
: "${TMUX_PANE_PICKER_HEIGHT:=80%}"
: "${TMUX_PANE_PICKER_PREVIEW_LINES:=30}"
: "${TMUX_PANE_PICKER_PREVIEW_WINDOW:=}" # 为空则自动选择：默认下方，空间不足用右侧
: "${TMUX_PANE_PICKER_SPLIT:=h}" # 兼容旧配置；实际 join 方向默认按 pane 数量奇偶自动选择

die() {
  print -r -- "$*" >&2
  exit 1
}

require_cmd() {
  command -v "$1" >/dev/null 2>&1 || die "missing command: $1"
}

preview() {
  local typ=${1-} id=${2-}
  [[ -n "${typ}" && -n "${id}" ]] || return 0

  case "$typ" in
    P)
      tmux capture-pane -p -t "$id" -S 0 -E "#{e|-:#{pane_height},1}" 2>/dev/null \
        | awk -v n="${TMUX_PANE_PICKER_PREVIEW_LINES}" '
            { lines[NR] = $0 }
            END {
              last = 0
              for (i = NR; i >= 1; i--) {
                if (lines[i] ~ /[^[:space:]]/) { last = i; break }
              }
              if (last == 0) exit 0
              start = last - n + 1
              if (start < 1) start = 1
              for (i = start; i <= last; i++) print lines[i]
            }
          ' || true
      ;;
  esac
}

inside_popup() {
  require_cmd tmux
  require_cmd fzf

  local dst_pane=${TMUX_PANE_PICKER_DST_PANE-}
  local dst_win=${TMUX_PANE_PICKER_DST_WIN-}
  [[ -n "$dst_pane" && -n "$dst_win" ]] || die "missing TMUX_PANE_PICKER_DST_* env"

  local resolve_join_target_pane
  resolve_join_target_pane() {
    tmux list-panes -t "$dst_win" -F "#{pane_id}|#{pane_left}|#{pane_top}|#{pane_width}|#{pane_height}" 2>/dev/null \
      | awk -F '|' '
          BEGIN { best=""; best_b=-1; best_r=-1 }
          {
            pid=$1; l=$2+0; t=$3+0; w=$4+0; h=$5+0;
            r=l+w; b=t+h;
            if (b > best_b || (b == best_b && r > best_r)) {
              best=pid; best_b=b; best_r=r;
            }
          }
          END { if (best != "") print best }
        '
  }

  local preview_window lines
  preview_window="${TMUX_PANE_PICKER_PREVIEW_WINDOW}"
  if [[ -z "$preview_window" ]]; then
    lines="${LINES:-0}"
    if [[ "$lines" =~ '^[0-9]+$' ]] && (( lines > 0 && lines < 24 )); then
      preview_window='right,70%,nowrap'
    else
      preview_window='down,60%,nowrap'
    fi
  fi
  if [[ "$preview_window" != *",wrap"* && "$preview_window" != *",nowrap"* ]]; then
    preview_window="${preview_window},nowrap"
  fi

  local chosen typ id _
  chosen="$(
    tmux list-panes -a -F "#{pane_id}|#{pane_active}|#{session_name}|#{window_id}|#{window_index}|#{window_name}|#{pane_index}|#{pane_title}|#{pane_current_command}|#{pane_current_path}" \
      | awk -F '|' -v dst_pane="$dst_pane" -v dst_win="$dst_win" '
          {
            pid=$1; pactive=$2; sname=$3; wid=$4; widx=$5; wname=$6; pidx=$7; ptitle=$8; pcmd=$9; ppath=$10;
            gsub(/\|/, "¦", sname); gsub(/\|/, "¦", wname); gsub(/\|/, "¦", ptitle); gsub(/\|/, "¦", pcmd); gsub(/\|/, "¦", ppath);
            if (ptitle == "") ptitle = "(no title)"
            if (pcmd == "") pcmd = "?"
            if (ppath == "") ppath = "?"
            inwin = (wid == dst_win) ? "@" : " "
            here = (pid == dst_pane) ? ">" : " "
            act = (pactive == "1") ? "*" : " "
            rank = (pid == dst_pane) ? 0 : 1
            display = "[" inwin here act "] " sname " " widx ":" wname " " pidx " " ptitle " · " pcmd " · " ppath
            print rank "|P|" pid "|" display "|" sname "|" widx "|" pidx
          }
        ' \
      | sort -t '|' -k1,1n -k5,5 -k6,6n -k7,7n \
      | awk -F '|' 'BEGIN { OFS="|" } { print $2, $3, $4 }' \
      | fzf --height=100% --no-multi --delimiter='|' --with-nth=3 \
          --prompt='pane> ' \
          --header='[@]=当前window内  [>]=当前pane  [*]=该window活动pane' \
          --preview-window="$preview_window" \
          --preview="${script_path} --preview {1} {2}"
  )" || exit 0

  IFS='|' read -r typ id _ <<< "$chosen"
  [[ "$typ" == "P" && -n "$id" ]] || exit 0

  local sel_win zoomed split_flag
  sel_win="$(tmux display-message -p -t "$id" "#{window_id}")"
  [[ "$sel_win" == "$dst_win" ]] && exit 0

  local join_target
  join_target="$(resolve_join_target_pane)"
  [[ -n "$join_target" ]] || die "failed to resolve join target pane"

  zoomed="$(tmux display-message -p -t "$join_target" "#{window_zoomed_flag}")"
  [[ "$zoomed" == "1" ]] && tmux resize-pane -Z -t "$join_target"

  local pane_count
  pane_count="$(tmux list-panes -t "$dst_win" -F "#{pane_id}" 2>/dev/null | wc -l | tr -d ' ')"
  if [[ "$pane_count" =~ '^[0-9]+$' ]] && (( pane_count % 2 == 1 )); then
    split_flag="-h"
  else
    split_flag="-v"
  fi

  tmux join-pane $split_flag -s "$id" -t "$join_target"
  tmux select-pane -t "$id"
}

main() {
  case "${1-}" in
    --preview) preview "${2-}" "${3-}" ;;
    --inside) inside_popup ;;
    *)
      require_cmd tmux
      local dst_pane dst_win dst_path
      dst_pane="${TMUX_PANE-}"
      [[ -n "$dst_pane" ]] || dst_pane="$(tmux display-message -p "#{pane_id}")"
      dst_win="$(tmux display-message -p -t "$dst_pane" "#{window_id}")"
      dst_path="$(tmux display-message -p -t "$dst_pane" "#{pane_current_path}")"
      tmux popup -E -d "$dst_path" -xC -yC -w "${TMUX_PANE_PICKER_WIDTH}" -h "${TMUX_PANE_PICKER_HEIGHT}" \
        -T "pane picker" \
        -e "TMUX_PANE_PICKER_DST_PANE=${dst_pane}" \
        -e "TMUX_PANE_PICKER_DST_WIN=${dst_win}" \
        -e "TMUX_PANE_PICKER_WIDTH=${TMUX_PANE_PICKER_WIDTH}" \
        -e "TMUX_PANE_PICKER_HEIGHT=${TMUX_PANE_PICKER_HEIGHT}" \
        -e "TMUX_PANE_PICKER_PREVIEW_LINES=${TMUX_PANE_PICKER_PREVIEW_LINES}" \
        -e "TMUX_PANE_PICKER_SPLIT=${TMUX_PANE_PICKER_SPLIT}" \
        "$script_path" --inside
      ;;
  esac
}

main "$@"
