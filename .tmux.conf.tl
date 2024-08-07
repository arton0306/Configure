#----------------------------------------- 
# Set Control Key to Ctrl+w
#----------------------------------------- 
set -g prefix C-w
unbind C-b
bind C-w send-prefix

#----------------------------------------- 
# Reload config without killing server
#----------------------------------------- 
bind b source-file ~/.tmux.conf \; display-message "Config reloaded..."

#-----------------------------------------
# Options
#-----------------------------------------
set -g mode-keys vi                        # enable vi keys in copy-mode
# bind-key -t vi-copy 'v' begin-selection    # ..
# bind-key -t vi-copy 'y' copy-selection     # ..
set -g history-limit 100000                # set scrollback buffer size
set -g allow-rename off                    # don't rename window automatically
set -g repeat-time 300                     # bind-key -r repeat time
set -g display-time 2000                   # status bar msg display time
setw -g xterm-keys on

#-----------------------------------------
# claude recommanded OSC 52 for copy/paste forward
#-----------------------------------------
set -g set-clipboard on
set -ga terminal-overrides ',xterm:XT:Ms=\E]52;%p1%s;%p2%s\007'
set -ga terminal-overrides ',screen:XT:Ms=\E]52;%p1%s;%p2%s\007'

#-----------------------------------------
# Repeat time switcher
#-----------------------------------------
bind t \
    set -g repeat-time 0 \;\
    display 'repeat-time 0'
bind T \
    set -g repeat-time 300 \;\
    display 'repeat-time 300'

#----------------------------------------- 
# Hot Key - Window Control
#----------------------------------------- 
bind -n F5 new-window
bind -n F6 command-prompt "rename-window '%%'"
bind -n F7 previous-window
bind -n F8 next-window

#----------------------------------------- 
# Hot Key - Panel Control
#----------------------------------------- 
bind | split-window -h
bind - split-window -v
bind K confirm-before -p "kill-pane? (y/n)" kill-pane

bind -r h select-pane -R
bind -r l select-pane -L
bind -r j select-pane -D
bind -r k select-pane -U

#----------------------------------------- 
# Alias
# (ref: https://stackoverflow.com/questions/18115663/is-there-a-way-to-alias-tmux-commands) 
#----------------------------------------- 
set -s command-alias[10] mb='swap-window -t -1'
set -s command-alias[11] mf='swap-window -t +1'

#----------------------------------------- 
# Status Bar
#----------------------------------------- 
# set-option -g status-utf8 on
# set-option -g status-justify right
# set-option -g status-bg black # colour213 # pink
# set-option -g status-fg cyan
# set-option -g status-interval 30
# set-option -g status-left-length 60
# set-option -g status-left '#[fg=green,reverse]#W.#P: #[fg=cyan,default] #T #[default]'

# set-option -g visual-activity on
# set-option -g visual-bell off
# set-option -g visual-content off
# set-option -g vISUal-silence off
# set -g status-keys vi
set -g status-bg colour8
set -g status-fg colour254
set -g status-justify left
set -g status-interval 1
set -g status-left-length 25
set -g status-right-length 70
# set -g status-left '#[fg=colour15,bg=green,bold] #S #[fg=colour252,bg=colour238,nobold] '
set -g status-left '#[fg=colour15,bg=green,bold] #S #[fg=colour252,bg=colour238,nobold] '
# set -g status-left "#[fg=white,bright,bg=blue] Session #[fg=yellow,bright,bg=blue]#S #[default] |" # session-name
# set -g status-right "#[fg=white,bright]#(uptime | tr -s ' ' | rev | cut -d ' ' -f -3 | rev) #[fg=yellow,bright] %Y-%m-%d #[fg=green]%H:%M:%S"
set -g status-right "#[fg=white] #[fg=yellow] %Y-%m-%d #[fg=green]%H:%M:%S"

#----------------------------------------- 
# Mouse setting
# ref http://floriancrouzat.net/2010/07/run-tmux-with-mouse-support-in-mac-os-x-terminal-app/
# using tmux -V to check the version, after version 2.1, the mouse related commands are changed
# https://stackoverflow.com/questions/11832199/tmux-set-g-mouse-mode-on-doesnt-work
# You might try to press Alt(or Shift) to select when mouse mode is on
#----------------------------------------- 

set -g mouse on

### after version 2.1
# Toggle mouse on
bind m set-option -g -q mouse on
# Toggle mouse off
bind M set-option -g -q mouse off

### before version 2.1
# set -g mouse-resize-pane on
# set -g mouse-select-window on
# set -g mouse-select-pane on
# set -g terminal-overrides 'xterm*:XT:smcup@:rmcup@'
# set -ga terminal-overrides ',rxvt*:XT'
## Mouse mode
# set -g mode-mouse off
# set -g mouse-resize-pane off
# set -g mouse-select-pane off
# set -g mouse-select-window off
#
## Toggle mouse on
# bind m \
#     set -g mode-mouse on\;\
#     set -g mouse-resize-pane on \;\
#     set -g mouse-select-pane on \;\
#     set -g mouse-select-window on \;\
#     display 'Mouse: ON'
# # Toggle mouse off
# bind M \
#     set -g mode-mouse off\;\
#     set -g mouse-resize-pane off \;\
#     set -g mouse-select-pane off \;\
#     set -g mouse-select-window off \;\
#     display 'Mouse: OFF

#-----------------------------------------
# Plugin 
#-----------------------------------------

# resurrect: can save tmux state to a file and restore after reboot
# `prefix ctrl+s` for save (in ~/.tmux/resurrect)
# `prefix ctrl+r` for restore
run-shell ~/Configure/tmux/tmux-resurrect/resurrect.tmux

#-----------------------------------------
# Usage Note
#-----------------------------------------
# To solve panel size after re-attch:
# https://stackoverflow.com/questions/7814612/is-there-any-way-to-redraw-tmux-window-when-switching-smaller-monitor-to-bigger
# <prefix> + D
# It lists multiple windows with (height, width) info for the session, choose the wrong size one.
#
# T○ resize panel:
# <prefix> + Alt Up / Alt Down
#
# Show Panel Number:
# <prefix> + q (and then press the number to switch to it)
#
# <prefix> + {  move the current pane to the previous position
# <prefix> + }  move the current pane to the next position
# <prefix> + !  move the current pane into a new separate
#               window (‘break pane’)
#
# Switch between 2 sessions:
# <prefix> + L
#
# Cheat Sheet:
# https://gist.github.com/andreyvit/2921703

