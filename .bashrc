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

# Path
export PATH="~/tools:$PATH"

# set gcc env
export GCC_PATH=/usr/bin/gcc-4.7.2
export LD_LIBRARY_PATH=$GCC_PATH/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/
export C_INCLUDE_PATH=/usr/include/x86_64-linux-gnu
export CPLUS_INCLUDE_PATH=/usr/include/x86_64-linux-gnu
export PATH=$GCC_PATH/bin:$PATH
export LD_LIBRARY_PATH=$GCC_PATH/lib:GCC_PATH/lib64:$LD_LIBRARY_PATH

# tools
# autojump ( sudo apt-get install autojump )
. /usr/share/autojump/autojump.sh

