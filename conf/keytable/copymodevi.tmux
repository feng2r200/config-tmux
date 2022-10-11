#--------------------------------------------------------------#
##          copy-mode-vi                                      ##
#--------------------------------------------------------------#

bind-key -T copy-mode-vi 'C-h' if -F '#{pane_at_left}' '' 'select-pane -L'
bind-key -T copy-mode-vi 'C-j' if -F '#{pane_at_bottom}' '' 'select-pane -D'
bind-key -T copy-mode-vi 'C-k' if -F '#{pane_at_top}' '' 'select-pane -U'
bind-key -T copy-mode-vi 'C-l' if -F '#{pane_at_right}' '' 'select-pane -R'

bind-key -T copy-mode-vi 'M-h' resize-pane -L 2
bind-key -T copy-mode-vi 'M-j' resize-pane -D 2
bind-key -T copy-mode-vi 'M-k' resize-pane -U 2
bind-key -T copy-mode-vi 'M-l' resize-pane -R 2

# copy-mode-vi
bind-key -T copy-mode-vi v send -X begin-selection
bind-key -T copy-mode-vi y send -X copy-selection
bind-key -T copy-mode-vi Escape send -X cancel
