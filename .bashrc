###################################
#   My Prefer Environment
###################################

# Prompt
export PS1="\[\033[35m\]\t\[\033[m\]-\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "

# Environment
set history=2000
set savehist=2000
set filec
set autolist

# Aliases
alias virc='vim -p ~/.*shrc'
alias sorc='source ~/.bashrc'
alias vi='vim'
alias findcode='find . ! -name "*~" | grep ".cpp\|\.h"'
alias makecscope='findcode > cscope.files; cscope -bqu;'
alias grep='grep --color=auto'
alias artongrep='grep -s -r -n -l'
alias ll='ls -al'
alias ls='ls --color'
alias update='sudo apt-get update'
alias install='sudo apt-get install'

# tools
# autojump ( sudo apt-get install autojump )
. /usr/share/autojump/autojump.sh

# setenv

# Path
export PATH="~/tools:$PATH"
