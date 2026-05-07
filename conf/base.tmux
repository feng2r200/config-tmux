#--------------------------------------------------------------#
##          Base                                              ##
#--------------------------------------------------------------#

# ==================== 核心 & Shell ====================
set -g default-shell $SHELL
set -g default-terminal "tmux-256color"

# ==================== 终端颜色 & 协议 ====================
# 真彩色支持
set -ga terminal-features ",xterm-256color:RGB"

# 图片协议 / OSC 支持（chafa、OSC-52 剪贴板必须）
set -gq allow-passthrough on

# ==================== 性能 & 响应速度 ====================
set -s escape-time 0
set -sg repeat-time 0
set -g focus-events on

# ==================== 窗口 & 窗格管理 ====================
set -g base-index 1
set -g pane-base-index 1
set -g renumber-windows on
setw -g automatic-rename off

# ==================== 剪贴板 & 标题 ====================
set -g set-clipboard on
set -g set-titles on
set -g set-titles-string "#S:#I:#W"

# ==================== 鼠标 & 按键 ====================
set -g mouse on
setw -g xterm-keys on
set -g status-keys emacs
set -g mode-keys vi

# ==================== 显示 & 视觉 ====================
set -g display-panes-time 800
set -g display-time 1000
set -g clock-mode-style 24

set -g bell-action none
set -g visual-bell off
set -g visual-activity off
set -g visual-silence on
setw -g monitor-activity on

# ==================== 其他行为 ====================
set -g remain-on-exit off
set -g synchronize-panes off
setw -g aggressive-resize off

# ==================== 历史 & 编辑器 ====================
set -g history-limit 50000
set -s history-file "$XDG_CACHE_HOME/tmux/history"
set -s editor "nvim"

# ==================== 其他优化 ====================
set -g word-separators " -_()@,[]{}:=/"
set -g status-interval 5

# ==================== tpack 插件管理 ====================
set -g @plugin 'tmux-plugins/tmux-sensible'      # 基础优化插件

# 会话持久化
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'

# ==================== resurrect 配置 ====================
set -g @resurrect-capture-pane-contents 'on'
set -g @resurrect-strategy-nvim 'session'
set -g @resurrect-strategy-vim 'session'

# 自动重启的常用进程
set -g @resurrect-processes '\
  nvim vim \
  lazygit \
  btop htop ncdu \
  python node go cargo \
  opencode codex \
  ssh psql mysql \
'

# 额外保存选项
set -g @resurrect-save-command-history 'on'       # 保存命令历史
set -g @resurrect-save-shell-history 'on'
set -g @resurrect-restore-shell-history 'on'

set -g @resurrect-dir "$XDG_CACHE_HOME/tmux/resurrect"
set -g @resurrect-save 'S'      # 大写 S 保存
set -g @resurrect-restore 'R'   # 大写 R 恢复


# ==================== continuum 配置 ====================
set -g @continuum-restore 'on'
set -g @continuum-save-interval '20'              # 分钟

# 启动时不立即恢复
set -g @continuum-boot 'off'

# ==================== 初始化 tpack ====================
run 'tpack'
