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
bind-key v split-window -h -c "#{pane_current_path}"
bind-key s split-window -v -c "#{pane_current_path}"

# navigate
bind-key -T prefix j next-window
bind-key -T prefix k previous-window
bind-key -T prefix \; last-window

bind-key -T prefix h switch-client -p
bind-key -T prefix l switch-client -n

is_vim="#{||:#{==:#{pane_current_command},vim},#{==:#{pane_current_command},nvim}}"

bind-key -n C-h     if-shell -F "$is_vim" 'send-keys C-h' { if -F '#{pane_at_left}'   '' 'select-pane -L' }
bind-key -n C-j     if-shell -F "$is_vim" 'send-keys C-j' { if -F '#{pane_at_bottom}' '' 'select-pane -D' }
bind-key -n C-k     if-shell -F "$is_vim" 'send-keys C-k' { if -F '#{pane_at_top}'    '' 'select-pane -U' }
bind-key -n C-l     if-shell -F "$is_vim" 'send-keys C-l' { if -F '#{pane_at_right}'  '' 'select-pane -R' }

bind-key -n C-Up    if-shell -F "$is_vim" 'send-keys C-Up'    'resize-pane -U 5'
bind-key -n C-Down  if-shell -F "$is_vim" 'send-keys C-Down'  'resize-pane -D 5'
bind-key -n C-Left  if-shell -F "$is_vim" 'send-keys C-Left'  'resize-pane -L 5'
bind-key -n C-Right if-shell -F "$is_vim" 'send-keys C-Right' 'resize-pane -R 5'

# copy-mode-vi
source-file "$XDG_CONFIG_HOME/tmux/conf/copymodevi.tmux"

# Kill window/session shortcuts
bind-key q confirm-before -p "kill other panes? (y/n)" "kill-pane -a"
bind-key X confirm-before -p "kill-window #W? (y/n)" kill-window
bind-key Q confirm-before -p "kill other windows? (y/n)" "kill-window -a"

# pop tmux
bind-key t run-shell "$XDG_CONFIG_HOME/tmux/conf/scripts/popuptmux.sh"
bind-key '-' run-shell "$XDG_CONFIG_HOME/tmux/conf/scripts/popuptmux.sh"

# pane picker (fzf popup)
bind-key g run-shell "$XDG_CONFIG_HOME/tmux/conf/scripts/pane-tree-fzf.sh"

# ACTION
bind-key A switch-client -T ACTION

# swap window
bind-key -T ACTION '>' swap-window -d -t :+1 \; switch-client -T ACTION
bind-key -T ACTION '<' swap-window -d -t :-1 \; switch-client -T ACTION

# Keys to toggle the synchronize-panes option
bind-key -T ACTION 'y' set synchronize-panes\; display 'synchronize-panes #{?synchronize-panes,on,off}'

# reload
bind-key -T ACTION 'r' source-file "$XDG_CONFIG_HOME/tmux/tmux.conf" \; display "Reloaded!"

# help
bind-key -T ACTION 'c' customize-mode -Z

