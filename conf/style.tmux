#--------------------------------------------------------------#
##          Style                                             ##
#--------------------------------------------------------------#

#--------------------------------------------------------------#
##          Colors                                             #
#--------------------------------------------------------------#
color_orange="colour166" # 208, 166
color_purple="colour134" # 135, 134
color_green="colour076" # 070
color_blue="colour39"
color_yellow="colour220"
color_red="colour160"
color_black="colour232"
color_white="white" # 015

# This is a theme CONTRACT, you are required to define variables below
# Change values, but not remove/rename variables itself
color_dark="$color_black"
color_light="$color_white"
color_session_text="$color_blue"
color_status_text="colour245"
color_main="$color_orange"
color_secondary="$color_purple"
color_level_ok="$color_green"
color_level_warn="$color_yellow"
color_level_stress="$color_red"
color_window_off_indicator="colour088"
color_window_off_status_bg="colour238"
color_window_off_status_current_bg="colour254"

#--------------------------------------------------------------#
##          Appearence and status bar                          #
#--------------------------------------------------------------#

set -g status on

set -g mode-style "fg=default,bg=$color_main"

# command line style
set -g message-style "fg=$color_blue,bg=$color_dark"

# status line style
set -g status-style "fg=$color_status_text,bg=$color_dark"

# window segments in status line
set -g window-status-separator ""
separator_powerline_right=""

setw -g window-status-format " #I:#W "
setw -g window-status-current-style "fg=$color_light,bold,bg=$color_main"
setw -g window-status-current-format "#[fg=$color_dark,bg=$color_main]$separator_powerline_right#[default] #I:#W #[fg=$color_main,bg=$color_dark]$separator_powerline_right#[default]"

# when window has monitoring notification
setw -g window-status-activity-style "fg=$color_main"

# outline for active pane
setw -g pane-active-border-style "fg=$color_green"

# general status bar settings
set -g status-position bottom
# set -g status-justify centre
set -g status-justify right
set -g status-right-length 100

# status bar config
wg_session="#[fg=$color_session_text] #S #[default]"
wg_date="#[fg=$color_secondary]%H:%M %a %y-%m-%d#[default]"
key_table="#[fg=$color_dark,bg=$color_yellow]#{s/root//:client_key_table}#[default]"
wg_is_zoomed="#[fg=$color_dark,bg=$color_secondary]#{?window_zoomed_flag,[Z],}#[default]"

set -g status-left "$wg_session"
set -g status-right "$wg_is_zoomed $key_table"

