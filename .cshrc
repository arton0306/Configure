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
alias setdisplay source ~/script/setdisplay
alias setversion source ~/script/setversion
alias openvuedebug setenv VUE_PRINT_DEBUG_MESSAGE
alias OPTM p4sb -t OPTM -b exec/vue
alias DBXM p4sb -t DBXM -b exec/vue
alias editall 'p4 edit * ; p4 edit core/* ; p4 edit gui/*'
alias findcode 'find . ! -name "*~" | grep ".cpp\|\.h"'
alias makecscope 'findcode > cscope.files; cscope -bqu;'
alias grep='grep --color=auto'

# setenv
if ( ! $?USER ) then
        setenv USER `whoami`
endif
if ( ! $?HOST ) then
        setenv HOST `hostname`
endif
if ( ! $?DOMAIN ) then
        setenv DOMAIN `domainname`
endif
if ( ! $?UNAME ) then
    setenv UNAME  `uname`
endif

# Path
setenv PATH "~/script/:${PATH}"

