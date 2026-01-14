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
  local dst_sess=${TMUX_PANE_PICKER_DST_SESSION-}
  [[ -n "$dst_pane" && -n "$dst_win" ]] || die "missing TMUX_PANE_PICKER_DST_* env"
  [[ -n "$dst_sess" ]] || dst_sess="$(tmux display-message -p -t "$dst_pane" "#{session_id}")"

  local cursor_file
  cursor_file="$(mktemp -t tmux-pane-picker.cursor.XXXXXX)"
  rm -f -- "$cursor_file" 2>/dev/null || true

  local resolve_join_target_pane
  resolve_join_target_pane() {
    local win_id=${1:?window_id required}
    tmux list-panes -t "$win_id" -F "#{pane_id}|#{pane_left}|#{pane_top}|#{pane_width}|#{pane_height}" 2>/dev/null \
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

  local out action_line
  local fzf_status=0
  out="$(
    tmux list-panes -a -F "#{pane_id}|#{pane_active}|#{session_name}|#{window_id}|#{window_index}|#{window_name}|#{window_linked}|#{pane_index}|#{pane_title}|#{pane_current_command}|#{pane_current_path}" \
      | awk -F '|' -v dst_pane="$dst_pane" -v dst_win="$dst_win" '
          {
            pid=$1; pactive=$2; sname=$3; wid=$4; widx=$5; wname=$6; wlinked=$7; pidx=$8; ptitle=$9; pcmd=$10; ppath=$11;
            gsub(/\|/, "¦", sname); gsub(/\|/, "¦", wname); gsub(/\|/, "¦", ptitle); gsub(/\|/, "¦", pcmd); gsub(/\|/, "¦", ppath);
            if (ptitle == "") ptitle = "(no title)"
            if (pcmd == "") pcmd = "?"
            if (ppath == "") ppath = "?"
            inwin = (wid == dst_win) ? "@" : " "
            here = (pid == dst_pane) ? ">" : " "
            act = (pactive == "1") ? "*" : " "
            lnk = (wlinked == "1") ? "L" : " "
            rank = (pid == dst_pane) ? 0 : 1
            display = "[" inwin here act lnk "] " sname " " widx ":" wname " " pidx " " ptitle " · " pcmd " · " ppath
            print rank "|P|" pid "|" display "|" sname "|" widx "|" pidx
          }
        ' \
      | sort -t '|' -k1,1n -k5,5 -k6,6n -k7,7n \
      | awk -F '|' 'BEGIN { OFS="|" } { print $2, $3, $4 }' \
      | fzf --height=100% --multi --delimiter='|' --with-nth=3 \
          --prompt='pane> ' \
          --header='Tab=标记  Enter/Ctrl-j=join  Ctrl-o=move  Ctrl-l/Alt-Enter=link/unlink  [@]=当前window内  [>]=当前pane  [*]=该window活动pane  [L]=该window被link到多个session' \
          --preview-window="$preview_window" \
          --bind "enter:print(ACTION|join)+execute-silent(echo {2} > ${(qqq)cursor_file})+accept" \
          --bind "ctrl-j:print(ACTION|join)+execute-silent(echo {2} > ${(qqq)cursor_file})+accept" \
          --bind "ctrl-o:print(ACTION|move)+execute-silent(echo {2} > ${(qqq)cursor_file})+accept-non-empty" \
          --bind "ctrl-l:clear-multi+print(ACTION|link)+execute-silent(echo {2} > ${(qqq)cursor_file})+accept" \
          --bind "alt-enter:clear-multi+print(ACTION|link)+execute-silent(echo {2} > ${(qqq)cursor_file})+accept" \
          --preview="${script_path} --preview {1} {2}"
  )" || fzf_status=$?
  if (( fzf_status != 0 )); then
    rm -f -- "$cursor_file" 2>/dev/null || true
    exit 0
  fi

  local -a lines
  lines=("${(@f)out}")
  (( ${#lines} >= 2 )) || { rm -f -- "$cursor_file" 2>/dev/null || true; exit 0 }
  action_line="${lines[1]}"

  local _prefix action
  IFS='|' read -r _prefix action <<< "$action_line"
  [[ "$_prefix" == "ACTION" ]] || { rm -f -- "$cursor_file" 2>/dev/null || true; exit 0 }

  local cursor_pid=""
  if [[ -f "$cursor_file" ]]; then
    cursor_pid="$(<"$cursor_file" 2>/dev/null || true)"
    cursor_pid="${cursor_pid//$'\r'/}"
    cursor_pid="${cursor_pid//$'\n'/}"
  fi
  rm -f -- "$cursor_file" 2>/dev/null || true
  [[ -n "$cursor_pid" ]] || exit 0

  local -a selected_pane_ids
  local line typ pid
  for line in "${lines[@]:1}"; do
    IFS='|' read -r typ pid _ <<< "$line"
    [[ "$typ" == "P" && -n "${pid:-}" ]] || continue
    selected_pane_ids+=("$pid")
  done

  case "$action" in
    join)
      # Unzoom destination window once if needed.
      if [[ "$(tmux display-message -p -t "$dst_pane" "#{window_zoomed_flag}" 2>/dev/null || echo 0)" == "1" ]]; then
        tmux resize-pane -Z -t "$dst_pane" 2>/dev/null || true
      fi

      local last_moved=""
      local -a src_panes
      src_panes=("$cursor_pid" "${selected_pane_ids[@]}")
      # fzf 在未多选时 accept 会输出当前行，可能与 cursor 重复；这里去重。
      src_panes=("${(@u)src_panes}")

      local src src_win join_target split_flag pane_count
      for src in "${src_panes[@]}"; do
        src_win="$(tmux display-message -p -t "$src" "#{window_id}" 2>/dev/null || true)"
        [[ -n "$src_win" ]] || continue
        [[ "$src_win" == "$dst_win" ]] && continue

        join_target="$(resolve_join_target_pane "$dst_win")"
        [[ -n "$join_target" ]] || die "failed to resolve join target pane"

        pane_count="$(tmux list-panes -t "$dst_win" -F "#{pane_id}" 2>/dev/null | wc -l | tr -d ' ')"
        if [[ "$pane_count" =~ '^[0-9]+$' ]] && (( pane_count % 2 == 1 )); then
          split_flag="-h"
        else
          split_flag="-v"
        fi

        tmux join-pane $split_flag -s "$src" -t "$join_target"
        last_moved="$src"
      done
      [[ -n "$last_moved" ]] && tmux select-pane -t "$last_moved"
      ;;
    move)
      local target_pane="$cursor_pid"

      local target_win
      target_win="$(tmux display-message -p -t "$target_pane" "#{window_id}" 2>/dev/null || true)"
      [[ -n "$target_win" ]] || exit 0

      if [[ "$(tmux display-message -p -t "$target_pane" "#{window_zoomed_flag}" 2>/dev/null || echo 0)" == "1" ]]; then
        tmux resize-pane -Z -t "$target_pane" 2>/dev/null || true
      fi

      (( ${#selected_pane_ids} > 0 )) || exit 0

      local last_moved=""
      local src join_target split_flag pane_count
      for src in "${selected_pane_ids[@]}"; do
        join_target="$(resolve_join_target_pane "$target_win")"
        [[ -n "$join_target" ]] || die "failed to resolve join target pane"

        pane_count="$(tmux list-panes -t "$target_win" -F "#{pane_id}" 2>/dev/null | wc -l | tr -d ' ')"
        if [[ "$pane_count" =~ '^[0-9]+$' ]] && (( pane_count % 2 == 1 )); then
          split_flag="-h"
        else
          split_flag="-v"
        fi

        tmux move-pane $split_flag -s "$src" -t "$join_target"
        last_moved="$src"
      done
      [[ -n "$last_moved" ]] && tmux select-pane -t "$last_moved"
      ;;
    link)
      local target_pane="$cursor_pid"

      local sel_win wlinked
      IFS='|' read -r sel_win wlinked <<< "$(tmux display-message -p -t "$target_pane" "#{window_id}|#{window_linked}" 2>/dev/null || echo '|0')"
      [[ -n "$sel_win" ]] || exit 0

      # Toggle link into current session: if already present and window is
      # linked to multiple sessions, unlink it; otherwise link it.
      if tmux list-windows -t "$dst_sess" -F "#{window_id}" 2>/dev/null | grep -Fqx "$sel_win"; then
        if [[ "${wlinked:-0}" == "1" ]]; then
          local sel_idx
          sel_idx="$(tmux list-windows -t "$dst_sess" -F "#{window_id}|#{window_index}" 2>/dev/null \
            | awk -F '|' -v id="$sel_win" '$1 == id { print $2; exit }')"
          if [[ -n "${sel_idx:-}" ]]; then
            tmux unlink-window -t "${dst_sess}:${sel_idx}" 2>/dev/null || true
          else
            tmux unlink-window -t "${dst_sess}:${sel_win}" 2>/dev/null || true
          fi
        fi
      else
        tmux link-window -s "$sel_win" -t "$dst_win" -a 2>/dev/null || true
        tmux select-window -t "$sel_win" 2>/dev/null || true
      fi
      ;;
    *)
      ;;
  esac
}

main() {
  case "${1-}" in
    --preview) preview "${2-}" "${3-}" ;;
    --inside) inside_popup ;;
    *)
      require_cmd tmux
      local dst_pane dst_win dst_path
      local dst_sess
      dst_pane="${TMUX_PANE-}"
      [[ -n "$dst_pane" ]] || dst_pane="$(tmux display-message -p "#{pane_id}")"
      dst_win="$(tmux display-message -p -t "$dst_pane" "#{window_id}")"
      dst_sess="$(tmux display-message -p -t "$dst_pane" "#{session_id}")"
      dst_path="$(tmux display-message -p -t "$dst_pane" "#{pane_current_path}")"
      tmux popup -E -d "$dst_path" -xC -yC -w "${TMUX_PANE_PICKER_WIDTH}" -h "${TMUX_PANE_PICKER_HEIGHT}" \
        -T "pane picker" \
        -e "TMUX_PANE_PICKER_DST_PANE=${dst_pane}" \
        -e "TMUX_PANE_PICKER_DST_WIN=${dst_win}" \
        -e "TMUX_PANE_PICKER_DST_SESSION=${dst_sess}" \
        -e "TMUX_PANE_PICKER_WIDTH=${TMUX_PANE_PICKER_WIDTH}" \
        -e "TMUX_PANE_PICKER_HEIGHT=${TMUX_PANE_PICKER_HEIGHT}" \
        -e "TMUX_PANE_PICKER_PREVIEW_LINES=${TMUX_PANE_PICKER_PREVIEW_LINES}" \
        -e "TMUX_PANE_PICKER_SPLIT=${TMUX_PANE_PICKER_SPLIT}" \
        "$script_path" --inside
      ;;
  esac
}

main "$@"
