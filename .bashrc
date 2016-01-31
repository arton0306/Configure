#-------------------------------------------
# Locale
# http://moto.debian.tw/viewtopic.php?t=6213
# http://unix.stackexchange.com/questions/87745/what-does-lc-all-c-do
#-------------------------------------------
export LANG=zh_TW.UTF-8
# export LC_ALL="en_US.UTF-8"
export LC_ALL="C"

#-------------------------------------------
# Prompt
#-------------------------------------------
[ -z "$PS1" ] && return        # If not running interactively, don't do anything
# color
PS1="\[\033[35m\]\t\[\033[m\]-\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
# non-color
# PS1="\t-\u@\h:\w\$ "

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
#-------------------------------------------
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi
alias ls='ls --color=auto' # GNU coreutils ls
alias ll='ls -alF'
alias grep='grep --color=auto'
alias rm='rm -i'
alias jobs='jobs -l'
alias dirs='dirs -v'

alias arggdb='gdb --args '
alias findcode='find . ! -name "*~" | grep ".cpp\|\.h"'
alias makecscope='findcode > cscope.files; cscope -bqu;'

alias update='sudo apt-get update'
alias install='sudo apt-get install'
alias gt='git tree'
alias gs='git status'
#alias tmux='TERM=xterm-256color tmux'
alias open='xdg-open'

alias testc='cp ~/Configure/code_template/test.c ./test.c -i && vim test.c'
alias testcpp='cp ~/Configure/code_template/test.cpp ./test.cpp -i && vim test.cpp'
alias usage='cat ~/Configure/note/command_note'
alias reg='cat ~/Configure/note/reg'
alias usage2='cat ~/Configure/note/seldom_command_note'
alias local_note='cat ~/Configure/note/local_note'
alias path='cat ~/Configure/note/path_note'
alias note='vim ~/Configure/note/note'
alias x='dtrx'
alias ..='cd ..'
alias ...='cd ../..'

#-------------------------------------------
# Path
# I put 3rd party sources       at ~/sources
#                 build         at ~/build
#                 exe soft link at ~/.local/bin
#-------------------------------------------
PATH=/usr/bin:/usr/sbin:/bin:/sbin:/usr/local/bin:~/.local/bin
# ref - http://superuser.com/questions/39751/add-directory-to-path-if-its-not-already-there
pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="$PATH:$1"
    fi
}
# ref - http://alistapart.com/article/the-path-to-enlightenment
alias listpath="echo \$PATH | tr ':' '\n'"

#-------------------------------------------
# Favorite Tools
#-------------------------------------------
#virtual env
export PIP_REQUIRE_VIRTUALENV=true

# autojump
if [ -f /usr/share/autojump/autojump.sh ]; then
    . /usr/share/autojump/autojump.sh
fi
if [[ `type -t j` != "function" ]]; then
    source /home/arton/.autojump/etc/profile.d/autojump.sh
fi

#-------------------------------------------
# FreeBSD
#-------------------------------------------
if [[ ${uname} == 'FreeBSD' ]]; then
    alias ls='ls -G'
    # refs:http://blog.longwin.com.tw/2006/07/color_ls_in_bash_2006/
    export LSCOLORS=gxfxcxdxbxegedabagacad
fi

#-------------------------------------------
# Load Local Setting (External Source)
#-------------------------------------------
if [ -f $HOME/.local_bashrc.sh ]; then
    . $HOME/.local_bashrc.sh
else
    touch $HOME/.local_bashrc.sh
fi
