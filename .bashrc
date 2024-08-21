#! /bin/bash

#-------------------------------------------
# Locale
# http://moto.debian.tw/viewtopic.php?t=6213
# http://unix.stackexchange.com/questions/87745/what-does-lc-all-c-do
#-------------------------------------------
export LANG=zh_TW.UTF-8
export LC_ALL="en_US.UTF-8"
export BASH_SILENCE_DEPRECATION_WARNING=1 # used by macos catalina to disable the warning of def zsh
# export LC_ALL="C"

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

# ref: https://superuser.com/questions/301353/escape-non-printing-characters-in-a-function-for-a-bash-prompt/301355#301355
get_rc_str() {
    local rc="$?"
    if [[ "$rc" == 0 ]]; then
        printf "\001${GREEN}\002[rc:$rc]\001${END}\002"
    else
        printf "\001${RED}\002[rc:$rc]\001${END}\002"
    fi
}
echo_git_ps1_if_exists() {
    if [ ! -z "`type -t __git_ps1`" ]; then
        echo "`__git_ps1`"
    fi
}
# PS1="\$(get_rc_str) ${yellow}\t ${white}\u${red}@${white}\h ${blue}\w${red}\$(__git_ps1) > ${end}"
PS1="\$(get_rc_str) ${yellow}\t ${white}\u${red}@${white}\h ${blue}\w${red}\$(echo_git_ps1_if_exists) > ${end}"

# ref: https://stackoverflow.com/questions/16715103/bash-prompt-with-last-exit-code
# show_rc='$(code=${?##0};echo ${code:+[rc: ${code}]\ })'
# PS1="${red}$show_rc${end}${yellow}\t ${white}\u${red}@${white}\h ${blue}\w ${red}> ${end}"

#-------------------------------------------
# Bash Command Configure
#-------------------------------------------
set filec     # enable tab filename completion
set autolist  # enable tab filename list

export HISTTIMEFORMAT=' %F %T ' # show date time in history
set history=2000
set savehist=2000
shopt -s histappend # append to the history file, don't overwrite it
HISTSIZE=1000 # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTFILESIZE=2000

if ((BASH_VERSINFO[0] >= 4)); then
    # enable globstar **
    shopt -s globstar
fi

# force BASH to check the size of the window after the completion of every command
# ref: http://forums.gentoo.org/viewtopic-t-112348-highlight-bash+wrap.html
shopt -s checkwinsize

# less ( make less more friendly for non-text input files, see lesspipe(1) )
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# ref https://raam.org/2007/recovering-from-ctrls-in-putty/
# prevent ctrl + s to sending xoff
stty ixany
stty ixoff -ixon

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#-------------------------------------------
# Alias
# ref http://superuser.com/questions/373504/get-value-of-an-alias-in-bash
# http://en.wikipedia.org/wiki/Alias_%28command%29 Chaining
# http://stackoverflow.com/questions/7715939/linux-alias-chain-commands-can-recursion-be-avoided
#-------------------------------------------
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi
alias ls='ls --color=auto' # GNU coreutils ls
alias ll='ls -alF'
alias gocd='go_file_dir'
alias g='grep --color=auto'
alias gi='grep -i --color=auto'
alias rm='rm -i'
alias jobs='jobs -l'
alias dirs='dirs -v'
alias vim='TERM=xterm vim'
alias vims='TERM=screen-256color \vim'
alias vimx='TERM=xterm-256color \vim'
alias vimcron='VISUAL="/usr/bin/vim" VIMINIT="au VimEnter * set syntax=text" crontab -e'
alias pstree='ps xjf '
alias psid='ps xao pid,ppid,pgid,sid,cmd '

alias makecscope='findcode > cscope.files; cscope -bqu;'

alias update='sudo apt-get update'
alias install='sudo apt-get install'
alias gt='git tree' # tree is a git alias of 'git log --graph --decorate --pretty=oneline --abbrev-commit --all'
alias gs='git status'
alias gpush='git push origin master'
alias gls='git ls-files --others --exclude-standard'
# alias tmux='TERM=screen-256color tmux'

if [[ `uname` != 'Darwin' ]]; then
    alias open='xdg-open'
fi

alias note='vim ~/note'
alias ..='cd ..'
alias ...='cd ../..'
alias x='dtrx'
alias ctar='tar -cvf '
alias ctargz='tar -zcvf '
alias ctarbz2='tar -jcvf '
alias xtar='tar -xvf '
alias xtargz='tar -zxvf '
alias xtarbz2='tar -jxvf '

alias ptt='ssh bbsu@ptt.cc'

# desktop
alias o='nautilus'

alias py3='python3'

# network (ubuntu)
alias net_interfaces='sudo vim /etc/network/interfaces'

#-------------------------------------------
# Path
# I put 3rd party sources       at ~/sources
#                 build         at ~/build
#                 exe soft link at ~/.local/bin
#-------------------------------------------
# ref - http://superuser.com/questions/39751/add-directory-to-path-if-its-not-already-there
add_path_head() {
    if [[ -z $PATH ]]; then
        PATH="$1"
    elif [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="$1:$PATH"
    fi
}
add_path_tail() {
    if [[ -z $PATH ]]; then
        PATH="$1"
    elif [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="$PATH:$1"
    fi
}
# ref - http://alistapart.com/article/the-path-to-enlightenment
alias listpath="echo \$PATH | tr ':' '\n'"

PATH=""
add_path_tail ~/.local/bin
add_path_tail /usr/local/bin
add_path_tail /usr/bin
add_path_tail /usr/sbin
add_path_tail /bin
add_path_tail /sbin
add_path_tail ~/Configure/util

#-------------------------------------------
# Custom Functions
#-------------------------------------------
rwhich() {
    python3 -c "import os; import subprocess; pos = subprocess.run(['which', '$1'], capture_output=True).stdout.decode('utf-8').strip(); print(os.path.realpath(pos))"
}

rcd() {
    cd $(dirname $(rwhich "$1"))
}

canon() {
    python -c "import os; print(os.path.realpath('$1'))"
}

rcd_old() {
    cd `canon "$1"`
}

mkfile() {
    for file_name in "$@"; do
        mkdir -p $(dirname "$file_name") && touch "$file_name" 
    done
}

add_auth() {
    user="arton"
    hostname="$1"
    cat ~/.ssh/id_rsa.pub | ssh "$user@$hostname" 'cat >> .ssh/authorized_keys'
}

add_ssh_agent() {
    eval $(ssh-agent)
    ssh-add
}

cp_and_mkdir() {
    # usage cp_and_mkdir a/b/c/d/my.txt dest_path
    new_dir="$2/`dirname $1`"
    echo "create dir: $new_dir"
    mkdir -p $new_dir
    echo "copy $1 to $new_dir/"
    cp $1 "$new_dir"
}

waitfor_pid() {
    # https://stackoverflow.com/questions/1058047/wait-for-a-process-to-finish
    tail --pid=$1 -f /dev/null
}

push_personal_env_config() {
    host="$1"
    if [ ! -z $host ]; then
        my_target_folder="personal_env_config/arton"
        ssh $host mkdir -p $my_target_folder
        rsync -av ~/Configure/simple.bashrc $host:$my_target_folder
        rsync -av ~/Configure/simple.vimrc $host:$my_target_folder
    else
        echo "usage: push_personal_env_config <host>"
    fi
}

# example
# add_line_numbers yourfile.txt
# add_line_numbers yourfile.txt 4
add_line_numbers() {
    if [ $# -lt 1 ]; then
        echo "Usage: add_line_numbers file_path [num_zeros]"
        return 1
    fi

    local file_path="$1"
    local num_zeros="${2:-0}"
    local line_count=$(wc -l < "$file_path")
    local max_zeros=7

    if [ $# -gt 1 ]; then
        if ! [[ "$num_zeros" =~ ^[0-9]+$ ]] || [ "$num_zeros" -lt 1 ] || [ "$num_zeros" -gt $max_zeros ]; then
            echo "The second parameter (num_zeros) must be a number between 1 and $max_zeros."
            return 1
        fi
    else
        while [ $line_count -gt 0 ]; do
            ((num_zeros++))
            line_count=$((line_count / 10))
        done
    fi

    awk -v zeros="$num_zeros" '{printf("%0" zeros "d %s\n", NR, $0)}' "$file_path"
}

print_files_with_names() {
    for file in "$@"; do
        if [ -f "$file" ]; then
            echo "===== $file ====="
            cat "$file"
            echo ""
        else
            echo "File $file does not exist."
        fi
    done
}

#-------------------------------------------
# Favorite Tools
#-------------------------------------------
#virtual env
export PIP_REQUIRE_VIRTUALENV=true
alias syspipon='export PIP_REQUIRE_VIRTUALENV=true'
alias syspipoff='export PIP_REQUIRE_VIRTUALENV=false'

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
if [ -f /usr/share/autojump/autojump.sh ]; then
    . /usr/share/autojump/autojump.sh
fi
if [[ -f /usr/share/autojump/autojump.sh ]] && [[ `type -t j` != "function" ]]; then
    source /home/arton/.autojump/etc/profile.d/autojump.sh
fi

#-------------------------------------------
# FreeBSD
#-------------------------------------------
if [[ `uname` == 'FreeBSD' ]] || [[ `uname` == 'Darwin' ]]; then
    alias ls='ls -G'
    # refs:http://blog.longwin.com.tw/2006/07/color_ls_in_bash_2006/
    export LSCOLORS=gxfxcxdxbxegedabagacad
fi

#-------------------------------------------
# Load Local Setting (External Source)
# .sh extension is for coloring in vim as a script
#-------------------------------------------
if [ -f $HOME/.local_bashrc.sh ]; then
    . $HOME/.local_bashrc.sh
else
    touch $HOME/.local_bashrc.sh
fi

#-------------------------------------------
# Python Virtual Env
#-------------------------------------------
pyenv() {
    if [ -z "$1" ]; then
        ls ~/.virtualenvs
    else
        source ~/.virtualenvs/$1/bin/activate
    fi
}

#-------------------------------------------
# For old system
#-------------------------------------------
alias rmcvstmp='rm -f $(find . | grep \.#)'
# alias rmcvstmp="rm -f **/.#*"
alias ddd="ddd -background BLACK -foreground GRAY --fontsize 140 "

#-------------------------------------------
# Code template
#-------------------------------------------
# (empty)

# Setting PATH for Python 3.8
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
export PATH
