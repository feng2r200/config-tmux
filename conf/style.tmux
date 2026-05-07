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
set -g status-justify right
set -g status-left-length 80
set -g status-right-length 120

wg_is_zoomed="#[fg=$color_dark,bg=$color_purple]#{?window_zoomed_flag,[Z],}#[default]"

# Left: Session + 当前窗口
set -g status-left "$wg_is_zoomed #[fg=$color_blue] #S #I:#W"

# Right: Zoom + Key Table
set -g status-right "$wg_is_zoomed #[fg=$color_dark,bg=$color_green]#{s/root//:client_key_table}#[default]"

