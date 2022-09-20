#--------------------------------------------------------------#
##          RESIZE                                            ##
#--------------------------------------------------------------#

is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"

bind-key -T RESIZE 'h' if-shell "$is_vim" "send-keys M-h" "resize-pane -L 2" \; switch-client -T RESIZE
bind-key -T RESIZE 'j' if-shell "$is_vim" "send-keys M-j" "resize-pane -D 2" \; switch-client -T RESIZE
bind-key -T RESIZE 'k' if-shell "$is_vim" "send-keys M-k" "resize-pane -U 2" \; switch-client -T RESIZE
bind-key -T RESIZE 'l' if-shell "$is_vim" "send-keys M-l" "resize-pane -R 2" \; switch-client -T RESIZE
