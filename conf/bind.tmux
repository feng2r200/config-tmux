#--------------------------------------------------------------#
##          Key Bind                                          ##
#--------------------------------------------------------------#

set -g prefix C-a
unbind C-b
bind-key C-a send-prefix

bind-key C-l send-keys 'C-l' \; run 'sleep 0.1' \; clear-history

bind-key \\ split-window -h -c "#{pane_current_path}"
bind-key - split-window -v -c "#{pane_current_path}"
unbind-key '"'
unbind-key %

is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'

bind-key -T copy-mode-vi 'C-h' select-pane -L
bind-key -T copy-mode-vi 'C-j' select-pane -D
bind-key -T copy-mode-vi 'C-k' select-pane -U
bind-key -T copy-mode-vi 'C-l' select-pane -R

bind-key -n 'C-Left'  if-shell "$is_vim" "send-keys C-Left"  "resize-pane -L 2"
bind-key -n 'C-Down'  if-shell "$is_vim" "send-keys C-Down"  "resize-pane -D 2"
bind-key -n 'C-Up'    if-shell "$is_vim" "send-keys C-Up"    "resize-pane -U 2"
bind-key -n 'C-Right' if-shell "$is_vim" "send-keys C-Right" "resize-pane -R 2"

bind-key -T copy-mode-vi C-Left  resize-pane -L 1
bind-key -T copy-mode-vi C-Down  resize-pane -D 1
bind-key -T copy-mode-vi C-Up    resize-pane -U 1
bind-key -T copy-mode-vi C-Right resize-pane -R 1

bind-key -T copy-mode-vi v send -X begin-selection
bind-key -T copy-mode-vi y send -X copy-selection
bind-key -T copy-mode-vi Escape send -X cancel

bind-key J command-prompt -p "join pane from: " "join-pane -h -s '%%'"

bind-key t run-shell "~/.config/tmux/conf/scripts/popuptmux.sh"

bind-key R source-file "~/.config/tmux/tmux.conf" \; display "Reloaded!"

#--------------------------------------------------------------#
##          UnBind                                            ##
#--------------------------------------------------------------#
unbind-key -T copy-mode C-Space
unbind-key -T copy-mode C-a
unbind-key -T copy-mode C-b
unbind-key -T copy-mode C-c
unbind-key -T copy-mode C-e
unbind-key -T copy-mode C-f
unbind-key -T copy-mode C-g
unbind-key -T copy-mode C-k
unbind-key -T copy-mode C-n
unbind-key -T copy-mode C-p
unbind-key -T copy-mode C-r
unbind-key -T copy-mode C-s
unbind-key -T copy-mode C-v
unbind-key -T copy-mode C-w
unbind-key -T copy-mode Escape
unbind-key -T copy-mode Space
unbind-key -T copy-mode ,
unbind-key -T copy-mode ";"
unbind-key -T copy-mode F
unbind-key -T copy-mode N
unbind-key -T copy-mode P
unbind-key -T copy-mode R
unbind-key -T copy-mode T
unbind-key -T copy-mode X
unbind-key -T copy-mode f
unbind-key -T copy-mode g
unbind-key -T copy-mode n
unbind-key -T copy-mode q
unbind-key -T copy-mode r
unbind-key -T copy-mode t
unbind-key -T copy-mode MouseDown1Pane
unbind-key -T copy-mode MouseDrag1Pane
unbind-key -T copy-mode MouseDragEnd1Pane
unbind-key -T copy-mode WheelUpPane
unbind-key -T copy-mode WheelDownPane
unbind-key -T copy-mode DoubleClick1Pane
unbind-key -T copy-mode TripleClick1Pane
unbind-key -T copy-mode Home
unbind-key -T copy-mode End
unbind-key -T copy-mode NPage
unbind-key -T copy-mode PPage
unbind-key -T copy-mode Up
unbind-key -T copy-mode Down
unbind-key -T copy-mode Left
unbind-key -T copy-mode Right
unbind-key -T copy-mode M-C-b
unbind-key -T copy-mode M-C-f
unbind-key -T copy-mode M-1
unbind-key -T copy-mode M-2
unbind-key -T copy-mode M-3
unbind-key -T copy-mode M-4
unbind-key -T copy-mode M-5
unbind-key -T copy-mode M-6
unbind-key -T copy-mode M-7
unbind-key -T copy-mode M-8
unbind-key -T copy-mode M-9
unbind-key -T copy-mode M-<
unbind-key -T copy-mode M->
unbind-key -T copy-mode M-R
unbind-key -T copy-mode M-b
unbind-key -T copy-mode M-f
unbind-key -T copy-mode M-m
unbind-key -T copy-mode M-r
unbind-key -T copy-mode M-v
unbind-key -T copy-mode M-w
unbind-key -T copy-mode M-x
unbind-key -T copy-mode "M-{"
unbind-key -T copy-mode "M-}"
unbind-key -T copy-mode M-Up
unbind-key -T copy-mode M-Down
unbind-key -T copy-mode C-Up
unbind-key -T copy-mode C-Down

unbind-key -T copy-mode-vi Space

unbind-key -T prefix /
unbind-key -T prefix ?

unbind-key -T prefix E
unbind-key -T prefix M-1
unbind-key -T prefix M-2
unbind-key -T prefix M-3
unbind-key -T prefix M-4
unbind-key -T prefix M-5
