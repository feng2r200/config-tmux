#--------------------------------------------------------------#
##          Style                                             ##
#--------------------------------------------------------------#

# ==================== 颜色定义 ====================
color_orange="colour166"
color_purple="colour134"
color_green="colour076"
color_blue="colour39"
color_yellow="colour220"
color_red="colour160"
color_dark="colour232"
color_light="white"
color_gray="colour245"

color_main="$color_orange"

# ==================== 通用样式 ====================
set -g status on
set -g mode-style "fg=default,bg=$color_main"
set -g message-style "fg=$color_blue,bg=$color_dark"
set -g status-style "fg=$color_gray,bg=$color_dark"

set -g pane-border-style "fg=colour237"
set -g pane-active-border-style "fg=$color_red"

# ==================== 窗口样式 ====================
setw -g window-status-separator " "
setw -g window-status-format " #I:#W "
setw -g window-status-current-style "fg=$color_light,bg=$color_main,bold"
setw -g window-status-activity-style "fg=$color_main,bold"
# setw -g window-status-current-format "#[fg=$color_dark,bg=$color_main]#[default] #I:#W #[fg=$color_main,bg=$color_dark]#[default]"
setw -g window-status-current-format " #I:#W #[default]"

# ==================== 状态栏布局 ====================
set -g status-position bottom
set -g status-left-length 80
set -g status-right-length 120

wg_is_zoomed="#[fg=$color_dark,bg=$color_purple]#{?window_zoomed_flag,[Z],}#[default]"

# Left: Session + 当前窗口
set -g status-left "$wg_is_zoomed #[fg=colour250,bg=colour238] #S #I:#W #[default]"

# Right: Zoom + Key Table
set -g status-right "$wg_is_zoomed #[fg=$color_dark,bg=$color_green]#{s/root//:client_key_table}#[default]"

# Center: 当前活动 pane
set -g @active_pane_info "#[fg=colour250,bg=$color_dark] P#P #{pane_current_command} #[fg=colour245,bg=$color_dark]#{b:pane_current_path} #[default]"

status_left_segment="#[align=left range=left #{E:status-left-style}]#[push-default]#{T;=/#{status-left-length}:status-left}#[pop-default]#[norange default]"
status_center_segment="#[align=centre]#{E:@active_pane_info}#[default]"
status_window_list_segment="#[list=on align=right]#[list=left-marker]<#[list=right-marker]>#[list=on]#{W:#[range=window|#{window_index} #{E:window-status-style}#{?#{&&:#{window_last_flag},#{!=:#{E:window-status-last-style},default}}, #{E:window-status-last-style},}#{?#{&&:#{window_bell_flag},#{!=:#{E:window-status-bell-style},default}}, #{E:window-status-bell-style},#{?#{&&:#{||:#{window_activity_flag},#{window_silence_flag}},#{!=:#{E:window-status-activity-style},default}}, #{E:window-status-activity-style},}}]#[push-default]#{T:window-status-format}#[pop-default]#[norange default]#{?loop_last_flag,,#{window-status-separator}},#[range=window|#{window_index} list=focus #{?#{!=:#{E:window-status-current-style},default},#{E:window-status-current-style},#{E:window-status-style}}#{?#{&&:#{window_last_flag},#{!=:#{E:window-status-last-style},default}}, #{E:window-status-last-style},}#{?#{&&:#{window_bell_flag},#{!=:#{E:window-status-bell-style},default}}, #{E:window-status-bell-style},#{?#{&&:#{||:#{window_activity_flag},#{window_silence_flag}},#{!=:#{E:window-status-activity-style},default}}, #{E:window-status-activity-style},}}]#[push-default]#{T:window-status-current-format}#[pop-default]#[norange list=on default]#{?loop_last_flag,,#{window-status-separator}}}"
status_right_segment="#[nolist align=right range=right #{E:status-right-style}]#[push-default]#{T;=/#{status-right-length}:status-right}#[pop-default]#[norange default]"

set -g status-format[0] "$status_left_segment$status_center_segment$status_window_list_segment$status_right_segment"
