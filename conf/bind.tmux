#--------------------------------------------------------------#
##          Key Bind                                          ##
#--------------------------------------------------------------#

# Prompt to rename window right after it's created
# set-hook -g after-new-window 'command-prompt -I "#{window_name}" "rename-window '%%'"'

# prefix-key
set -g prefix C-a
unbind C-b

# send-prefix
bind-key C-a send-prefix

# clear-history
bind-key C-l send-keys 'C-l' \; run 'sleep 0.1' \; clear-history

# split pane
bind-key \\ split-window -h -c "#{pane_current_path}"
bind-key - split-window -v -c "#{pane_current_path}"

# navigate
is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h' { if -F '#{pane_at_left}' '' 'select-pane -L' }
bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j' { if -F '#{pane_at_bottom}' '' 'select-pane -D' }
bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k' { if -F '#{pane_at_top}' '' 'select-pane -U' }
bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l' { if -F '#{pane_at_right}' '' 'select-pane -R' }

bind-key -n 'C-Left' if-shell "$is_vim" "send-keys C-Left" "resize-pane -L 2"
bind-key -n 'C-Down' if-shell "$is_vim" "send-keys C-Down" "resize-pane -D 2"
bind-key -n 'C-Up' if-shell "$is_vim" "send-keys C-Up" "resize-pane -U 2"
bind-key -n 'C-Right' if-shell "$is_vim" "send-keys C-Right" "resize-pane -R 2"

# copy-mode-vi
source-file "$XDG_CONFIG_HOME/tmux/conf/keytable/copymodevi.tmux"

# Kill window/session shortcuts
bind-key q confirm-before -p "kill other panes? (y/n)" "kill-pane -a"
bind-key X confirm-before -p "kill-window #W? (y/n)" kill-window
bind-key Q confirm-before -p "kill other windows? (y/n)" "kill-window -a"

# pop tmux
bind-key t run-shell "$XDG_CONFIG_HOME/tmux/conf/scripts/popuptmux.sh"

# ACTION
bind-key A switch-client -T ACTION
source-file "$XDG_CONFIG_HOME/tmux/conf/keytable/action.tmux"

# choose
bind-key -T prefix s choose-tree -Zw
bind-key -T prefix S choose-tree -Zs

bind-key -T prefix \; last-window

bind-key -T prefix j next-window
bind-key -T prefix k previous-window

bind-key -T prefix h switch-client -p
bind-key -T prefix l switch-client -n

