#--------------------------------------------------------------#
##          Key Bind                                          ##
#--------------------------------------------------------------#

# Prompt to rename window right after it's created
set-hook -g after-new-window 'command-prompt -I "#{window_name}" "rename-window '%%'"'

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

# copy-mode-vi
source-file "$XDG_CONFIG_HOME/tmux/conf/keytable/copymodevi.tmux"

# Kill window/session shortcuts
bind-key X confirm-before -p "kill-window #W? (y/n)" kill-window
bind-key Q confirm-before -p "kill other windows? (y/n)" "kill-window -a"

# Link window
bind-key W command-prompt -p "Link window from (session:window): " "link-window -s %% -a"

# A key to toggle between smallest and largest sizes if a window is visible in
# multiple places
bind F set -w window-size

# Keys to toggle the synchronize-panes option
bind Y set synchronize-panes\; display 'synchronize-panes #{?synchronize-panes,on,off}'

# join pane
bind-key j command-prompt -p "join pane from: " "join-pane -h -s '%%'"
# Merge session with another one (e.g. move all windows)
# If you use adhoc 1-window sessions, and you want to preserve session upon exit
# but don't want to create a lot of small unnamed 1-window sessions around
# move all windows from current session to main named one (dev, work, etc)
bind-key J command-prompt -p "Session to merge with: " \
   "run-shell 'yes | head -n #{session_windows} | xargs -I {} -n 1 tmux move-window -t %%'"

# pop tmux
bind-key t run-shell "$XDG_CONFIG_HOME/tmux/conf/scripts/popuptmux.sh"

# reload
bind-key R source-file "$XDG_CONFIG_HOME/tmux/tmux.conf" \; display "Reloaded!"

# RESIZE
bind-key Z switch-client -T RESIZE
source-file "$XDG_CONFIG_HOME/tmux/conf/keytable/resize.tmux"

# MENU
source-file "$XDG_CONFIG_HOME/tmux/conf/keytable/menu.tmux"
