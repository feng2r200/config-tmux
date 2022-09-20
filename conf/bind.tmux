#--------------------------------------------------------------#
##          Key Bind                                          ##
#--------------------------------------------------------------#

set -g prefix C-a
unbind C-b
bind-key C-a send-prefix

bind-key C-l send-keys 'C-l' \; run 'sleep 0.1' \; clear-history

bind-key \\ split-window -h -c "#{pane_current_path}"
bind-key - split-window -v -c "#{pane_current_path}"

# Prompt to rename window right after it's created
set-hook -g after-new-window 'command-prompt -I "#{window_name}" "rename-window '%%'"'

is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
# navigate
bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h' { if -F '#{pane_at_left}' '' 'select-pane -L' }
bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j' { if -F '#{pane_at_bottom}' '' 'select-pane -D' }
bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k' { if -F '#{pane_at_top}' '' 'select-pane -U' }
bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l' { if -F '#{pane_at_right}' '' 'select-pane -R' }

bind-key -T copy-mode-vi 'C-h' if -F '#{pane_at_left}' '' 'select-pane -L'
bind-key -T copy-mode-vi 'C-j' if -F '#{pane_at_bottom}' '' 'select-pane -D'
bind-key -T copy-mode-vi 'C-k' if -F '#{pane_at_top}' '' 'select-pane -U'
bind-key -T copy-mode-vi 'C-l' if -F '#{pane_at_right}' '' 'select-pane -R'

# resize
bind-key -n 'M-h' if-shell "$is_vim" "send-keys M-h" "resize-pane -L 2"
bind-key -n 'M-j' if-shell "$is_vim" "send-keys M-j" "resize-pane -D 2"
bind-key -n 'M-k' if-shell "$is_vim" "send-keys M-k" "resize-pane -U 2"
bind-key -n 'M-l' if-shell "$is_vim" "send-keys M-l" "resize-pane -R 2"

bind-key -T copy-mode-vi M-h resize-pane -L 2
bind-key -T copy-mode-vi M-j resize-pane -D 2
bind-key -T copy-mode-vi M-k resize-pane -U 2
bind-key -T copy-mode-vi M-l resize-pane -R 2

# copy-mode-vi
bind-key -T copy-mode-vi v send -X begin-selection
bind-key -T copy-mode-vi y send -X copy-selection
bind-key -T copy-mode-vi Escape send -X cancel

# Kill window/session shortcuts
bind-key X confirm-before -p "kill-window #W? (y/n)" kill-window
bind-key Q confirm-before -p "kill other windows? (y/n)" "kill-window -a"

# Link window
bind-key W command-prompt -p "Link window from (session:window): " "link-window -s %% -a"

# A key to toggle between smallest and largest sizes if a window is visible in
# multiple places
bind F set -w window-size

# Keys to toggle monitoring activity in a window and the synchronize-panes option
bind M set monitor-activity
bind Y set synchronize-panes\; display 'synchronize-panes #{?synchronize-panes,on,off}'

# join pane
bind-key j command-prompt -p "join pane from: " "join-pane -h -s '%%'"
# Merge session with another one (e.g. move all windows)
# If you use adhoc 1-window sessions, and you want to preserve session upon exit
# but don't want to create a lot of small unnamed 1-window sessions around
# move all windows from current session to main named one (dev, work, etc)
bind-key J command-prompt -p "Session to merge with: " \
   "run-shell 'yes | head -n #{session_windows} | xargs -I {} -n 1 tmux movew -t %%'"

bind-key D if -F '#{session_many_attached}' \
    'confirm-before -p "Detach other clients? (y/n)" "detach -a"' \
    'display "Session has only 1 client attached"'

# pop tmux
bind-key t run-shell "$XDG_CONFIG_HOME/tmux/conf/scripts/popuptmux.sh"

# reload
bind-key R source-file "$XDG_CONFIG_HOME/tmux/tmux.conf" \; display "Reloaded!"

