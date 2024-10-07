#--------------------------------------------------------------#
##          Base                                              ##
#--------------------------------------------------------------#
set-option -g default-shell $SHELL

set-option -g default-terminal "tmux-256color"
# set-option -ag terminal-overrides ',xterm-256color:RGB'
set-option -ag terminal-overrides ',*:RGB'

set-option -wg xterm-keys on

set-option -sg repeat-time 0

set-option -q -wg utf8 on
set-option -g bell-action none
set-option -g remain-on-exit off

set-option -g base-index 1
set-option -g pane-base-index 1

set-option -wg automatic-rename off
set-option -g renumber-windows on

set-option -g set-titles on
set-option -g set-titles-string "#S:#I:#W"

set-option -g display-panes-time 800

set-option -g mouse on
set-option -g status-keys emacs
set-option -g mode-keys vi

set-option -g display-time 1000
set-option -g clock-mode-style 24

set-option -g history-limit 50000
set-option -s escape-time 0
set-option -s editor "/opt/homebrew/bin/nvim"
set-option -s history-file "$XDG_CACHE_HOME/tmux/history"
set-option -g status-interval 5
set-option -g visual-activity off
set-option -g visual-bell off
set-option -g visual-silence on
set-option -g synchronize-panes off
set-option -g focus-events on

set -gq allow-passthrough on

set-option -g word-separators " -_()@,[]{}:=/"

set-option -wg monitor-activity on
set-option -wg aggressive-resize off

