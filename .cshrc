###################################
#   My Prefer Environment
###################################

# Prompt
#set prompt="%B%n@%m [%/] (\!) # "
set prompt="%{\033]0;%n@%m: %~\007%}%{^[[0;1;35m%}[%{^[[0;1;33m%}%n%{^[[0;1;35m%}@%{^[[0;1;33m%}%m %{^[[36m%}%~%{^[[35m%}]%{^[[36m%}%{^[[0m%}# "

# Environment
set history=2000
set savehist=2000
set filec
set autolist
eval `dircolors ~/.dir_colors`

# Aliases
alias vi 'vim'
alias findcode 'find . ! -name "*~" | grep ".cpp\|\.h"'
alias makecscope 'findcode > cscope.files; cscope -bqu;'
alias grep='grep --color=auto'
alias ll 'ls -al'

# setenv

# Path

