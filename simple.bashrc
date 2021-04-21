#-------------------------------------------
# Prompt
#-------------------------------------------
[ -z "$PS1" ] && return        # If not running interactively, don't do anything
# color
# PS1="\[\033[35m\]\t\[\033[m\] \[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h \[\033[33;1m\]\w\[\033[m\] > "
# non-color
# PS1="\t-\u@\h:\w\$ "

red="\[\033[0;31m\]"
green="\[\033[0;32m\]"
yellow="\[\033[0;33m\]"
blue="\[\033[1;34m\]"
magenta="\[\033[1;35m\]"
cyan="\[\033[1;36m\]"
white="\[\033[0;37m\]"
end="\[\033[0m\]"

GREEN="\033[0;32m"
RED="\033[0;31m"
END="\033[0m"

rc_tick="\u2714"
rc_cross="\u274c"

# ref: https://superuser.com/questions/301353/escape-non-printing-characters-in-a-function-for-a-bash-prompt/301355#301355
get_rc_str() {
    local rc="$?"
    if [[ "$rc" == 0 ]]; then
        printf "\001${GREEN}\002[rc:$rc]\001${END}\002"
    else
        printf "\001${RED}\002[rc:$rc]\001${END}\002"
    fi
}
my_git_ps1() {
    if [ ! -z "`type -t __git_ps1`" ]; then
        echo "`__git_ps1`"
    fi
}
# PS1="\$(get_rc_str) ${yellow}\t ${white}\u${red}@${white}\h ${blue}\w${red}\$(__git_ps1) > ${end}"
PS1="\$(get_rc_str) ${yellow}\t ${white}\u${red}@${white}\h ${blue}\w${red}\$(my_git_ps1) > ${end}"

#-------------------------------------------
# Alias
#-------------------------------------------
alias ls='ls --color=auto'
alias ll='ls -alF'
alias ..='cd ..'
alias ...='cd ../..'
alias vim='vim -S ~/personal_env_config/arton/simple.vimrc '
alias gs='git status'
alias gt='git log --graph --decorate --pretty=oneline --abbrev-commit --all'

#-------------------------------------------
# Git
#-------------------------------------------
if [ ! -z "`type -t git`" ]; then
    git config --global color.ui true
fi
