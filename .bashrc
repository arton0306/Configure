###################################
#   My Prefer Environment
###################################

# Prompt
PS1="\[\033[35m\]\t\[\033[m\]-\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ " # color
### PS1="\t-\u@\h:\w\$ " # nocolor

# History
set history=2000
set savehist=2000
export HISTTIMEFORMAT=' %F %T ' # show date time in history
shopt -s histappend # append to the history file, don't overwrite it
HISTSIZE=1000 # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTFILESIZE=2000

# less ( make less more friendly for non-text input files, see lesspipe(1) )
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Shell command completion
set filec
set autolist
### enable programmable completion features (you don't need to enable
### this, if it's already enabled in /etc/bash.bashrc and /etc/profile
### sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Aliases
alias virc='vim -p ~/.*shrc'
alias sorc='source ~/.bashrc'
alias findcode='find . ! -name "*~" | grep ".cpp\|\.h"'
alias makecscope='findcode > cscope.files; cscope -bqu;'
alias grep='grep --color=auto'
alias artongrep='grep -s -r -n -l'
alias ll='ls -al'
alias ls='ls --color'
alias update='sudo apt-get update'
alias install='sudo apt-get install'
alias rm='rm -i'
HISTORY_BAK_FOLDER=$HOME/history_bak
alias history="history > $HISTORY_BAK_FOLDER/\$(date '+%y_%m_%d-%T'); vim $HISTORY_BAK_FOLDER/\$(ls $HISTORY_BAK_FOLDER -t | head -n 1)" # save history to a file with timestamp named and vim it
alias allgit='repo forall -c git'

# Path

# tools
# autojump ( sudo apt-get install autojump )
. /usr/share/autojump/autojump.sh

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
