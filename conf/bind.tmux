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

unbind-key -T copy-mode-vi Space # begin-selection

unbind-key -T prefix /
unbind-key -T prefix ?

unbind-key -T prefix n # next-window
unbind-key -T prefix p # previous-window
unbind-key -T prefix m # select-pane -m
unbind-key -T prefix M # select-pane -M
unbind-key -T prefix q # display-panes

unbind-key -T prefix C-z # suspend-client
unbind-key -T prefix \# # list-buffers
unbind-key -T prefix ( # switch-client -p
unbind-key -T prefix ) # switch-client -n
unbind-key -T prefix r # refresh-client
unbind-key -T prefix DC
unbind-key -T prefix PPage

unbind-key -T prefix E
unbind-key -T prefix M-1
unbind-key -T prefix M-2
unbind-key -T prefix M-3
unbind-key -T prefix M-4
unbind-key -T prefix M-5
unbind-key -T prefix D # choose-client -Z
unbind-key -T prefix L # switch-client -l
unbind-key -T prefix &

unbind-key -T prefix S-Up     # refresh-client -U 10
unbind-key -T prefix S-Down   # refresh-client -D 10
unbind-key -T prefix S-Left   # refresh-client -L 10
unbind-key -T prefix S-Right  # refresh-client -R 10

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

unbind-key -T root MouseDown1Pane
unbind-key -T root MouseDown1Status
unbind-key -T root MouseDown2Pane
unbind-key -T root MouseDown3Pane
unbind-key -T root MouseDown3Status
unbind-key -T root MouseDown3StatusLeft
unbind-key -T root MouseDrag1Pane
unbind-key -T root MouseDrag1Border
unbind-key -T root WheelUpPane
unbind-key -T root WheelUpStatus
unbind-key -T root WheelDownStatus
unbind-key -T root DoubleClick1Pane
unbind-key -T root TripleClick1Pane
unbind-key -T root M-MouseDown3Pane

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

bind-key -T prefix C-n next-window
bind-key -T prefix C-p previous-window

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
bind-key L command-prompt -p "Link window from (session:window): " "link-window -s %% -a"

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

