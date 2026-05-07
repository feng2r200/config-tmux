# ================================================
# Unbind - 清理默认按键
# ================================================

# ==================== Prefix 键清理 ====================
unbind-key -T prefix C-b # 原默认 prefix
unbind-key -T prefix /   # list-keys
unbind-key -T prefix ?   # list-keys
unbind-key -T prefix q   # display-panes
unbind-key -T prefix C-o # rotate-window
unbind-key -T prefix C-z # suspend-client
unbind-key -T prefix \#  # list-buffers
unbind-key -T prefix .   # move-window
unbind-key -T prefix DC
unbind-key -T prefix PPage

# 默认分割窗口
unbind-key -T prefix -
unbind-key -T prefix \\
unbind-key -T prefix '"'
unbind-key -T prefix %

# 默认窗口切换
unbind-key -T prefix n
unbind-key -T prefix p
unbind-key -T prefix 0
unbind-key -T prefix 1
unbind-key -T prefix 2
unbind-key -T prefix 3
unbind-key -T prefix 4
unbind-key -T prefix 5
unbind-key -T prefix 6
unbind-key -T prefix 7
unbind-key -T prefix 8
unbind-key -T prefix 9

unbind-key -T prefix M-6
unbind-key -T prefix M-7

# 默认窗口/会话操作
unbind-key -T prefix &        # kill-window
unbind-key -T prefix f        # find-window
unbind-key -T prefix C        # customize-mode
unbind-key -T prefix D        # choose-client
unbind-key -T prefix E        # select-layout
unbind-key -T prefix i        # display-message
unbind-key -T prefix o        # select-pane
unbind-key -T prefix r        # refresh-client
unbind-key -T prefix \$       # rename-session
unbind-key -T prefix ,        # rename-window

# 默认窗格导航和调整
unbind-key -T prefix Up
unbind-key -T prefix Down
unbind-key -T prefix Left
unbind-key -T prefix Right
unbind-key -T prefix M-Up
unbind-key -T prefix M-Down
unbind-key -T prefix M-Left
unbind-key -T prefix M-Right
unbind-key -T prefix C-Up
unbind-key -T prefix C-Down
unbind-key -T prefix C-Left
unbind-key -T prefix C-Right
unbind-key -T prefix S-Up
unbind-key -T prefix S-Down
unbind-key -T prefix S-Left
unbind-key -T prefix S-Right

# 其他不常用键
unbind-key -T prefix m # select-pane -m
unbind-key -T prefix M # select-pane -M
unbind-key -T prefix <
unbind-key -T prefix >
unbind-key -T prefix ( # switch-client -p
unbind-key -T prefix ) # switch-client -n

unbind-key -T prefix M-1
unbind-key -T prefix M-2
unbind-key -T prefix M-3
unbind-key -T prefix M-4
unbind-key -T prefix M-5
unbind-key -T prefix M-n
unbind-key -T prefix M-o
unbind-key -T prefix M-p
unbind-key -T prefix M-MouseDown3Pane
unbind-key -T prefix \~

# ==================== Copy Mode 清理 ====================
unbind-key -T copy-mode-vi Space
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
