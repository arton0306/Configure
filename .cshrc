#========================================
# Gerneral settings
#========================================

set history=200
set savehist=2000
set filec
set cdpath=(~)
set autolist
set listjobs=long # show more info when ctrl+z to suspend job

# http://linux-sxs.org/housekeeping/lscolors.html
setenv LS_COLORS 'di=01;32:ln=01;33:or=91:ex=91'

# TimeStamp settings
set year=`date +%Y`
set month=`date +%m`
set day=`date +%d`

# Editor
setenv EDITOR vim

# disable ctrl+s/q
# ref: https://unix.stackexchange.com/questions/137842/what-is-the-point-of-ctrl-s
# https://unix.stackexchange.com/questions/26676/how-to-check-if-a-shell-is-login-interactive-batch
if($?prompt) then 
    stty stop ''
    stty start ''
endif

#========================================
# Prompt Settings
#========================================

# Colors!
set     red="%{\033[0;31m%}"
set   green="%{\033[0;32m%}"
set  yellow="%{\033[0;33m%}"
set    blue="%{\033[1;34m%}"
set magenta="%{\033[1;35m%}"
set    cyan="%{\033[1;36m%}"
set   white="%{\033[0;37m%}"
set     end="%{\033[0m%}" # This is needed at the end... :(

if ($?tcsh) then
    # set prompt="${magenta}%n@${white}%B%m${blue}[ ! ] ${red}%~ ${end}> "
    # arton@arton-pc[ 123 ] ~/sources/src >
    set prompt="${yellow}%P ${white}%n${red}@${white}%m${blue} %~ ${end}> "
    set padhour
else
    set prompt="`hostname`:! `dirs` > "
endif

#========================================
# Alias
#========================================
alias g grep
alias cp 'cp -i'
alias ls 'ls -F --color=auto'
alias ll 'ls -al'
alias mv 'mv -i'
alias rm 'rm -i'
alias so source
alias .. 'cd ..'
alias ... 'cd ../..'

#========================================
# Local
#========================================
if ( -f ~/.local_csh_set_alias.sh ) then
    alias localsa 'vi ~/.local_csh_set_alias.sh'
    source ~/.local_csh_set_alias.sh
endif

