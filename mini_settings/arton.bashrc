red="\[\033[0;31m\]"
green="\[\033[0;32m\]"
yellow="\[\033[0;33m\]"
blue="\[\033[1;34m\]"
magenta="\[\033[1;35m\]"
cyan="\[\033[1;36m\]"
white="\[\033[0;37m\]"
end="\[\033[0m\]" # This is needed at the end... :(

PS1="${yellow}\t ${white}\u${red}@${white}\h ${blue}\w ${red}> ${end}"

alias ls='ls --color=auto'
alias ll='ls -alF'

alias ..='cd ..'
alias ...='cd ../..'

alias vim='vim -S ~/personal_utils/arton.vimrc '
