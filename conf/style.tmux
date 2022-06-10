#--------------------------------------------------------------#
##          Style                                             ##
#--------------------------------------------------------------#

set -g status-position top

set -g status-left-length 100
set -g status-right-length 100

set -g pane-active-border-style "fg=#bd93f9"
set -g pane-border-style "fg=#44475a"

set -g message-style "bg=#44475a,fg=#f8f8f2"

set -g status-style "bg=#161616,fg=#f8f8f2"
set -g status-left "#[bg=#44475a,fg=#282a36]#{?client_prefix,#[bg=#f1fa8c],} #S "
set -g status-right ""

setw -g window-status-current-format "#[fg=#f8f8f2,bg=#6272a4] #I #W${current_flags} "

setw -g window-status-format "#[fg=#f8f8f2]#[bg=#44475a] #I #W${flags}"
setw -g window-status-activity-style "bold"
setw -g window-status-bell-style "bold"


