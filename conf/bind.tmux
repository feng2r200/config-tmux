#--------------------------------------------------------------#
##          UnBind                                            ##
#--------------------------------------------------------------#
unbind-key -T prefix /   # command-prompt -k -p key { list-keys -1N "%%" }
unbind-key -T prefix ?   # list-keys -N

unbind-key -T prefix q   # display-panes

unbind-key -T prefix C-o # rotate-window
unbind-key -T prefix C-z # suspend-client
unbind-key -T prefix \#  # list-buffers
unbind-key -T prefix .   # command-prompt -T target { move-window -t "%%" }
unbind-key -T prefix DC
unbind-key -T prefix PPage
unbind-key -T prefix <
unbind-key -T prefix >

unbind-key -T prefix -   # split-window -v -c "#{pane_current_path}"
unbind-key -T prefix \\  # split-window -h -c "#{pane_current_path}"
unbind-key -T prefix 0   # select-window -t :=0
unbind-key -T prefix 1   # select-window -t :=1
unbind-key -T prefix 2   # select-window -t :=2
unbind-key -T prefix 3   # select-window -t :=3
unbind-key -T prefix 4   # select-window -t :=4
unbind-key -T prefix 5   # select-window -t :=5
unbind-key -T prefix 6   # select-window -t :=6
unbind-key -T prefix 7   # select-window -t :=7
unbind-key -T prefix 8   # select-window -t :=8
unbind-key -T prefix 9   # select-window -t :=9

unbind-key -T prefix & # confirm-before -p "kill-window #W? (y/n)" kill-window
unbind-key -T prefix f # command-prompt { find-window -Z "%%" }
unbind-key -T prefix C # customize-mode -Z
unbind-key -T prefix D # choose-client -Z
unbind-key -T prefix E # select-layout -E
unbind-key -T prefix M # select-pane -M
unbind-key -T prefix i # display-message
unbind-key -T prefix m # select-pane -m
unbind-key -T prefix o # select-pane -t :.+
unbind-key -T prefix r # refresh-client
unbind-key -T prefix n # next-window
unbind-key -T prefix p # previous-window
unbind-key -T prefix ( # switch-client -p
unbind-key -T prefix ) # switch-client -n

unbind-key -T prefix \$ # command-prompt -I "#S" { rename-session "%%" }
unbind-key -T prefix ,  # command-prompt -I "#W" { rename-window "%%" }

unbind-key -T prefix M-1
unbind-key -T prefix M-2
unbind-key -T prefix M-3
unbind-key -T prefix M-4
unbind-key -T prefix M-5

unbind-key -T prefix S-Up     # refresh-client -U 10
unbind-key -T prefix S-Down   # refresh-client -D 10
unbind-key -T prefix S-Left   # refresh-client -L 10
unbind-key -T prefix S-Right  # refresh-client -R 10

unbind-key -T prefix Up       # select-pane -U
unbind-key -T prefix Down     # select-pane -D
unbind-key -T prefix Left     # select-pane -L
unbind-key -T prefix Right    # select-pane -R

unbind-key -T prefix \~       # show-messages

unbind-key -T prefix M-n      # next-window -a
unbind-key -T prefix M-o      # rotate-window -D
unbind-key -T prefix M-p      # previous-window -a
unbind-key -T prefix M-Up     # resize-pane -U 5
unbind-key -T prefix M-Down   # resize-pane -D 5
unbind-key -T prefix M-Left   # resize-pane -L 5
unbind-key -T prefix M-Right  # resize-pane -R 5
unbind-key -T prefix C-Up     # resize-pane -U
unbind-key -T prefix C-Down   # resize-pane -D
unbind-key -T prefix C-Left   # resize-pane -L
unbind-key -T prefix C-Right  # resize-pane -R

unbind-key -T root M-MouseDown3Pane

unbind-key '"'
unbind-key %

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

unbind-key -T copy-mode-vi Space # begin-selection

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
is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h' { if -F '#{pane_at_left}'   '' 'select-pane -L' }
bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j' { if -F '#{pane_at_bottom}' '' 'select-pane -D' }
bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k' { if -F '#{pane_at_top}'    '' 'select-pane -U' }
bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l' { if -F '#{pane_at_right}'  '' 'select-pane -R' }

# bind-key -n 'C-Up'    if-shell "$is_vim" "send-keys C-Up"     "resize-pane -U 5"
# bind-key -n 'C-Down'  if-shell "$is_vim" "send-keys C-Down"   "resize-pane -D 5"
# bind-key -n 'C-Left'  if-shell "$is_vim" "send-keys C-Left"   "resize-pane -L 5"
# bind-key -n 'C-Right' if-shell "$is_vim" "send-keys C-Right"  "resize-pane -R 5"
bind-key -n C-Up    if-shell -F '#{||:#{==:#{pane_current_command},vim},#{==:#{pane_current_command},nvim}}' 'send-keys C-Up'    'resize-pane -U 5'
bind-key -n C-Down  if-shell -F '#{||:#{==:#{pane_current_command},vim},#{==:#{pane_current_command},nvim}}' 'send-keys C-Down'  'resize-pane -D 5'
bind-key -n C-Left  if-shell -F '#{||:#{==:#{pane_current_command},vim},#{==:#{pane_current_command},nvim}}' 'send-keys C-Left'  'resize-pane -L 5'
bind-key -n C-Right if-shell -F '#{||:#{==:#{pane_current_command},vim},#{==:#{pane_current_command},nvim}}' 'send-keys C-Right' 'resize-pane -R 5'

# copy-mode-vi
source-file "$XDG_CONFIG_HOME/tmux/conf/keytable/copymodevi.tmux"

# Kill window/session shortcuts
bind-key q confirm-before -p "kill other panes? (y/n)" "kill-pane -a"
bind-key X confirm-before -p "kill-window #W? (y/n)" kill-window
bind-key Q confirm-before -p "kill other windows? (y/n)" "kill-window -a"

# pop tmux
bind-key t run-shell "$XDG_CONFIG_HOME/tmux/conf/scripts/popuptmux.sh"
bind-key '-' run-shell "$XDG_CONFIG_HOME/tmux/conf/scripts/popuptmux.sh"

# ACTION
bind-key A switch-client -T ACTION
source-file "$XDG_CONFIG_HOME/tmux/conf/keytable/action.tmux"

bind-key -T prefix \; last-window

bind-key -T prefix j next-window
bind-key -T prefix k previous-window

bind-key -T prefix h switch-client -p
bind-key -T prefix l switch-client -n

