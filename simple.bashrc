# this is the simplest setting for bash on some hosts that I can not use complicated settings

red="\[\033[0;31m\]"
green="\[\033[0;32m\]"
yellow="\[\033[0;33m\]"
blue="\[\033[1;34m\]"
magenta="\[\033[1;35m\]"
cyan="\[\033[1;36m\]"
white="\[\033[0;37m\]"
end="\[\033[0m\]" # This is needed at the end... :(

PS1="${yellow}\t ${red}\u${cyan}@${red}\h ${yellow}\w ${red}> ${end}"

alias ls='ls --color=auto'
alias ll='ls -alF'

alias ..='cd ..'
alias ...='cd ../..'

alias vim='vim -S ~/personal_utils/arton.vimrc '
