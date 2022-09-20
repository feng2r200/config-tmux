#--------------------------------------------------------------#
##          Action                                            ##
#--------------------------------------------------------------#

# resize
is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"

bind-key -T ACTION 'h' if-shell "$is_vim" "send-keys M-h" "resize-pane -L 2" \; switch-client -T ACTION
bind-key -T ACTION 'j' if-shell "$is_vim" "send-keys M-j" "resize-pane -D 2" \; switch-client -T ACTION
bind-key -T ACTION 'k' if-shell "$is_vim" "send-keys M-k" "resize-pane -U 2" \; switch-client -T ACTION
bind-key -T ACTION 'l' if-shell "$is_vim" "send-keys M-l" "resize-pane -R 2" \; switch-client -T ACTION

# swap window
bind-key -T ACTION 'n' swap-window -t :+1 \; switch-client -T ACTION
bind-key -T ACTION 'p' swap-window -t :-1 \; switch-client -T ACTION

# Keys to toggle the synchronize-panes option
bind-key -T ACTION 'y' set synchronize-panes\; display 'synchronize-panes #{?synchronize-panes,on,off}'

# Merge session with another one (e.g. move all windows)
# If you use adhoc 1-window sessions, and you want to preserve session upon exit
# but don't want to create a lot of small unnamed 1-window sessions around
# move all windows from current session to main named one (dev, work, etc)
bind-key -T ACTION 't' command-prompt -p "Session merge to: " \
   "run-shell 'yes | head -n #{session_windows} | xargs -I {} -n 1 tmux move-window -t %%'"

# help
bind-key -T ACTION 'c' customize-mode -Z

# Link window
bind-key -T ACTION 'L' command-prompt -p "Link window from (session:window): " "link-window -s %% -a"

# reload
bind-key -T ACTION 'r' source-file "$XDG_CONFIG_HOME/tmux/tmux.conf" \; display "Reloaded!"

