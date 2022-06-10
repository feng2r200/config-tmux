#--------------------------------------------------------------#
##          Plugins                                           ##
#--------------------------------------------------------------#

set -g @plugin "tmux-plugins/tpm"
set -g @plugin "tmux-plugins/tmux-resurrect"
set -g @plugin "tmux-plugins/tmux-continuum"

#--------------------------------------------------------------#
##          Plugins Config                                    ##
#--------------------------------------------------------------#

set -g @resurrect-dir '$HOME/.cache/tmux/resurrect'
set -g @resurrect-capture-pane-contents 'on'

set -g @continuum-save-interval '10'

#--------------------------------------------------------------#
##          Install/Execute tpm                               ##
#--------------------------------------------------------------#

run-shell '~/.config/tmux/plugins/tpm/tpm'
