# config-tmux

一套偏“高频操作优先”的 tmux 配置（基于 XDG 路径），包含：

- `C-a` 作为 prefix（替代默认 `C-b`）
- 方向键/分屏/清屏等常用键位重映射
- `fzf` 弹窗 pane picker：跨 session/跨 window 合并、移动 pane，以及 window link/unlink
- 简单的 `ACTION` key table（用于少量“动作型”操作）

本仓库默认按 `tmux.conf` 入口加载 `conf/*.tmux`。

## 依赖

- `tmux`（本配置在 `tmux 3.6a` 下验证过）
- `fzf`（pane picker 需要）
- `zsh`（`conf/scripts/pane-tree-fzf.sh`）
- `bash`（`conf/scripts/popuptmux.sh`）

## 安装

将本仓库放到 `$XDG_CONFIG_HOME/tmux`（常见是 `~/.config/tmux`），确保入口文件为：

- `tmux.conf`（会 `source-file` 加载 `conf/base.tmux`、`conf/style.tmux`、`conf/unbind.tmux`、`conf/bind.tmux`）

## 快捷键（核心）

说明：以下 `prefix` 默认为 `C-a`。

- `prefix C-a`：发送 prefix（相当于原生 `C-b`）
- `prefix C-l`：清屏并 `clear-history`
- `prefix v`：左右分屏（在当前路径）
- `prefix s`：上下分屏（在当前路径）
- `C-h/j/k/l`：在 pane 间移动（若当前 pane 在跑 `vim/nvim` 则把按键交给 vim）
- `C-Up/Down/Left/Right`：调整 pane 大小（同样会避开 vim/nvim）
- `prefix j` / `prefix k`：下一个/上一个 window
- `prefix ;`：上一个 window（last-window）
- `prefix h` / `prefix l`：上一个/下一个 session（switch-client -p/-n）
- `prefix q`：确认后 kill 其它 panes（保留当前）
- `prefix X`：确认后 kill 当前 window
- `prefix Q`：确认后 kill 其它 windows（保留当前）
- `prefix t` / `prefix -`：打开/关闭一个名为 `popup` 的临时 session（popup 模式）
- `prefix g`：打开 pane picker（fzf 弹窗）

## ACTION（key table）

进入：`prefix A`

- `<` / `>`：与前/后一个 window 交换位置（执行后仍停留在 `ACTION`）
- `y`：切换 `synchronize-panes` 并提示状态
- `r`：重载配置（`source-file "$XDG_CONFIG_HOME/tmux/tmux.conf"`）
- `c`：进入 `customize-mode -Z`

状态栏会显示当前 key table（例如 `ACTION`）。

## Pane Picker（`prefix g`）

文件：`conf/scripts/pane-tree-fzf.sh`

- `Enter` / `Ctrl-j`：把“光标所在 pane”加入当前 window；若同时 `Tab` 标记了更多 panes，会一起 join
- `Tab`：多选标记 panes
- `Ctrl-o`：把“已标记 panes”移动到“光标所在 pane 的 window”（用于快速把一组 panes 聚合到同一个 window）
- `Ctrl-l` / `Alt-Enter`：对“光标所在 window”做 link/unlink 切换（是否链接到当前 session）

可选环境变量：

- `TMUX_PANE_PICKER_WIDTH` / `TMUX_PANE_PICKER_HEIGHT`
- `TMUX_PANE_PICKER_PREVIEW_LINES`
- `TMUX_PANE_PICKER_PREVIEW_WINDOW`（为空时自动选择 preview 位置）

## copy-mode-vi

文件：`conf/copymodevi.tmux`

- `v` 开始选择，`y` 复制，`Esc` 取消
- `C-h/j/k/l`：在 copy-mode 里也能切换 pane
- `M-h/j/k/l`：在 copy-mode 里微调 pane 大小

