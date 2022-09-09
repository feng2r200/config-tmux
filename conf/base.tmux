#--------------------------------------------------------------#
##          Base                                              ##
#--------------------------------------------------------------#
set-option -g default-shell $SHELL

set-option -s default-terminal "xterm-256color"
set-option -gas terminal-features ',xterm-256color:Tc'

set-window-option -g xterm-keys on

set-option -sg repeat-time 0

set-window-option -q -g utf8 on
set-option -g bell-action none
set-option -g remain-on-exit off

set-option -g base-index 1
set-option -g pane-base-index 1

set-window-option -g automatic-rename off
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
set-option -g status-interval 5
set-option -g visual-activity off
set-option -g visual-bell off
set-option -g synchronize-panes off
set-option -g focus-events on

set-option -g word-separators " -_()@,[]{}:=/"

set-window-option -g monitor-activity on
set-window-option -g aggressive-resize on

