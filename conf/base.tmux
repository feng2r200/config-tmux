#--------------------------------------------------------------#
##          Base                                              ##
#--------------------------------------------------------------#

# Base Config {

# option config {
set -g default-shell $SHELL
set -s default-terminal "xterm-256color"

set -as terminal-features ',xterm-256color:RGB'
setw -g xterm-keys on

set -sg repeat-time 0 # increase repeat timeout

setw -q -g utf8 on
set -g bell-action none
set -g remain-on-exit off

set -g base-index 1 # start windows numbering at 1
set -g pane-base-index 1 # make pane numbering consistent with windows

setw -g automatic-rename off # rename window to reflect current program
set -g renumber-windows on # renumber windows when a window is closed

set -g set-titles on # set terminal title

set -g display-panes-time 800 # slightly longer pane indicators display time

set -g mouse on
set -g mode-keys vi

set-option -g display-time 700
set-option -g clock-mode-style 24
# }}

# Keymapping {
# navigation {
set -g prefix C-a
bind C-l send-keys 'C-l' \; run 'sleep 0.1' \; clear-history

bind \\ split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"
unbind '"'
unbind %

# Smart pane switching with awareness of Vim splits.
# See: https://github.com/christoomey/vim-tmux-navigator
is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'

bind-key -T copy-mode-vi 'C-h' select-pane -L
bind-key -T copy-mode-vi 'C-j' select-pane -D
bind-key -T copy-mode-vi 'C-k' select-pane -U
bind-key -T copy-mode-vi 'C-l' select-pane -R

bind-key -n 'A-Left' if-shell "$is_vim" "send-keys A-Left"  "resize-pane -L 1"
bind-key -n 'A-Down' if-shell "$is_vim" "send-keys A-Down"  "resize-pane -D 1"
bind-key -n 'A-Up' if-shell "$is_vim" "send-keys A-Up"  "resize-pane -U 1"
bind-key -n 'A-Right' if-shell "$is_vim" "send-keys A-Right"  "resize-pane -R 1"

bind-key -T copy-mode-vi C-Left resize-pane -L 1
bind-key -T copy-mode-vi C-Down resize-pane -D 1
bind-key -T copy-mode-vi C-Up resize-pane -U 1
bind-key -T copy-mode-vi C-Right resize-pane -R 1

# }

# copy mode {
bind -T copy-mode-vi v send -X begin-selection
bind -T copy-mode-vi y send -X copy-selection
bind -T copy-mode-vi Escape send -X cancel

# join pane
bind-key J command-prompt -p "join pane from: " "join-pane -h -s '%%'"

unbind l

# open a popup scratchpad
bind t display-popup -E "tmux new-session -A -s scratch"
# }}

# Plugin Manager {
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

# restore tmux {
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @resurrect-dir '$HOME/.cache/tmux/resurrect'
set -g @resurrect-capture-pane-contents 'on'

set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @continuum-save-interval '10'
# }

# theme {
set -g @plugin 'tmux-plugins/tmux-theme'
# }

# }

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.config/tmux/plugins/tpm/tpm'