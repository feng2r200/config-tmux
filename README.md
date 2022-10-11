# config-tmux

## key map

| keytable | key | description |
| :-- | :-- | :-- |
| ACTION       | L      | Link window from (session:window) |
| ACTION       | c      | show tmux config |
| ACTION       | h      | move pane left |
| ACTION       | j      | move pane down |
| ACTION       | k      | move pane up |
| ACTION       | l      | move pane right |
| ACTION       | n      | swap window to next |
| ACTION       | p      | swap window to previous |
| ACTION       | r      | source config file |
| ACTION       | t      | session merge to |
| ACTION       | y      | synchronize panes |
| copy-mode-vi | C-b    | send-keys -X page-up |
| copy-mode-vi | C-c    | send-keys -X cancel |
| copy-mode-vi | C-d    | send-keys -X halfpage-down |
| copy-mode-vi | C-e    | send-keys -X scroll-down |
| copy-mode-vi | C-f    | send-keys -X page-down |
| copy-mode-vi | C-h    | if-shell -F "#{pane_at_left}" '' "select-pane -L" |
| copy-mode-vi | C-j    | if-shell -F "#{pane_at_bottom}" '' "select-pane -D" |
| copy-mode-vi | C-k    | if-shell -F "#{pane_at_top}" '' "select-pane -U" |
| copy-mode-vi | C-l    | if-shell -F "#{pane_at_right}" '' "select-pane -R" |
| copy-mode-vi | Enter  | send-keys -X copy-pipe-and-cancel |
| copy-mode-vi | C-u    | send-keys -X halfpage-up |
| copy-mode-vi | C-v    | send-keys -X rectangle-toggle |
| copy-mode-vi | C-y    | send-keys -X scroll-up |
| copy-mode-vi | Escape | send-keys -X cancel |
| copy-mode-vi | \#     | send-keys -FX search-backward "#{copy_cursor_word}" |
| copy-mode-vi | \$     | send-keys -X end-of-line |
| copy-mode-vi | \%     | send-keys -X next-matching-bracket |
| copy-mode-vi | *      | send-keys -FX search-forward "#{copy_cursor_word}" |
| copy-mode-vi | ,      | send-keys -X jump-reverse |
| copy-mode-vi | /      | command-prompt -T search -p "(search down)" { send-keys -X search-forward "%%" } |
| copy-mode-vi | 0      | send-keys -X start-of-line |
| copy-mode-vi | 1      | command-prompt -N -I 1 -p (repeat) { send-keys -N "%%" } |
| copy-mode-vi | 2      | command-prompt -N -I 2 -p (repeat) { send-keys -N "%%" } |
| copy-mode-vi | 3      | command-prompt -N -I 3 -p (repeat) { send-keys -N "%%" } |
| copy-mode-vi | 4      | command-prompt -N -I 4 -p (repeat) { send-keys -N "%%" } |
| copy-mode-vi | 5      | command-prompt -N -I 5 -p (repeat) { send-keys -N "%%" } |
| copy-mode-vi | 6      | command-prompt -N -I 6 -p (repeat) { send-keys -N "%%" } |
| copy-mode-vi | 7      | command-prompt -N -I 7 -p (repeat) { send-keys -N "%%" } |
| copy-mode-vi | 8      | command-prompt -N -I 8 -p (repeat) { send-keys -N "%%" } |
| copy-mode-vi | 9      | command-prompt -N -I 9 -p (repeat) { send-keys -N "%%" } |
| copy-mode-vi | :      | command-prompt -p "(goto line)" { send-keys -X goto-line "%%" } |
| copy-mode-vi | \;     | send-keys -X jump-again |
| copy-mode-vi | ?      | command-prompt -T search -p "(search up)" { send-keys -X search-backward "%%" } |
| copy-mode-vi | A      | send-keys -X append-selection-and-cancel |
| copy-mode-vi | B      | send-keys -X previous-space |
| copy-mode-vi | D      | send-keys -X copy-pipe-end-of-line-and-cancel |
| copy-mode-vi | E      | send-keys -X next-space-end |
| copy-mode-vi | F      | command-prompt -1 -p "(jump backward)" { send-keys -X jump-backward "%%" } |
| copy-mode-vi | G      | send-keys -X history-bottom |
| copy-mode-vi | H      | send-keys -X top-line |
| copy-mode-vi | J      | send-keys -X scroll-down |
| copy-mode-vi | K      | send-keys -X scroll-up |
| copy-mode-vi | L      | send-keys -X bottom-line |
| copy-mode-vi | M      | send-keys -X middle-line |
| copy-mode-vi | N      | send-keys -X search-reverse |
| copy-mode-vi | P      | send-keys -X toggle-position |
| copy-mode-vi | T      | command-prompt -1 -p "(jump to backward)" { send-keys -X jump-to-backward "%%" } |
| copy-mode-vi | V      | send-keys -X select-line |
| copy-mode-vi | W      | send-keys -X next-space |
| copy-mode-vi | X      | send-keys -X set-mark |
| copy-mode-vi | ^      | send-keys -X back-to-indentation |
| copy-mode-vi | b      | send-keys -X previous-word |
| copy-mode-vi | e      | send-keys -X next-word-end |
| copy-mode-vi | f      | command-prompt -1 -p "(jump forward)" { send-keys -X jump-forward "%%" } |
| copy-mode-vi | g      | send-keys -X history-top |
| copy-mode-vi | h      | send-keys -X cursor-left |
| copy-mode-vi | j      | send-keys -X cursor-down |
| copy-mode-vi | k      | send-keys -X cursor-up |
| copy-mode-vi | l      | send-keys -X cursor-right |
| copy-mode-vi | n      | send-keys -X search-again |
| copy-mode-vi | o      | send-keys -X other-end |
| copy-mode-vi | q      | send-keys -X cancel |
| copy-mode-vi | r      | send-keys -X refresh-from-pane |
| copy-mode-vi | t      | command-prompt -1 -p "(jump to forward)" { send-keys -X jump-to-forward "%%" } |
| copy-mode-vi | v      | send-keys -X begin-selection |
| copy-mode-vi | w      | send-keys -X next-word |
| copy-mode-vi | y      | send-keys -X copy-selection |
| copy-mode-vi | \{     | send-keys -X previous-paragraph |
| copy-mode-vi | \}     | send-keys -X next-paragraph |
| copy-mode-vi | M-x    | send-keys -X jump-to-mark |
| copy-mode-vi | C-Up   | send-keys -X scroll-up |
| copy-mode-vi | C-Down | send-keys -X scroll-down |
| prefix       | C-a    | send-prefix |
| prefix       | C-l    | clear-history |
| prefix       | Space  | next-layout |
| prefix       | !      | break-pane |
| prefix       | \$     | rename-session |
| prefix       | \'     | command-prompt -T window-target -p index { select-window -t ":%%" } |
| prefix       | (      | switch-client -p |
| prefix       | )      | switch-client -n |
| prefix       | ,      | command-prompt -I "#W" { rename-window "%%" } |
| prefix       | -      | split-window -v -c "#{pane_current_path}" |
| prefix       | :      | command-prompt |
| prefix       | \;     | last-pane |
| prefix       | =      | choose-buffer -Z |
| prefix       | A      | switch-client -T ACTION |
| prefix       | L      | switch-client -l |
| prefix       | M      | select-pane -M |
| prefix       | Q      | confirm-before -p "kill other windows? (y/n)" "kill-window -a" |
| prefix       | S      | choose-tree -Zs |
| prefix       | X      | confirm-before -p "kill-window #W? (y/n)" kill-window |
| prefix       | [      | copy-mode |
| prefix       | \\     | split-window -h -c "#{pane_current_path}" |
| prefix       | ]      | paste-buffer -p |
| prefix       | c      | new-window |
| prefix       | d      | detach-client |
| prefix       | f      | command-prompt { find-window -Z "%%" } |
| prefix       | j      | command-prompt -p "join pane from: " "join-pane -h -s '%%'" |
| prefix       | l      | last-window |
| prefix       | m      | select-pane -m |
| prefix       | n      | next-window |
| prefix       | p      | previous-window |
| prefix       | q      | confirm-before -p "kill other panes? (y/n)" "kill-pane -a" |
| prefix       | s      | choose-tree -Zw |
| prefix       | t      | show pop session |
| prefix       | x      | confirm-before -p "kill-pane #P? (y/n)" kill-pane |
| prefix       | z      | resize-pane -Z |
| prefix       | \{     | swap-pane -U |
| prefix       | \}     | swap-pane -D |
| root         | C-h    | move to left pane (even if vim or tmux) |
| root         | C-j    | move to down pane (even if vim or tmux) |
| root         | C-k    | move to up pane (even if vim or tmux) |
| root         | C-l    | move to right pane (even if vim or tmux) |

