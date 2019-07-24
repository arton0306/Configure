#========================================
# Gerneral settings
#========================================

set history=200
set savehist=2000
set filec
set cdpath=(~)
set autolist
setenv LS_COLORS 'di=01;32:ln=01;33:or=91:ex=91'
    # == Details about LS_COLORS ==
    # http://linux-sxs.org/housekeeping/lscolors.html

# TimeStamp settings
set year=`date +%Y`
set month=`date +%m`
set day=`date +%d`

# Editor
setenv EDITOR vim

#========================================
# Prompt Settings
#========================================

# Colors!
set     red="%{\033[0;31m%}"
set   green="%{\033[0;32m%}"
set  yellow="%{\033[1;33m%}"
set    blue="%{\033[1;34m%}"
set magenta="%{\033[1;35m%}"
set    cyan="%{\033[1;36m%}"
set   white="%{\033[0;37m%}"
set     end="%{\033[0m%}" # This is needed at the end... :(

if ($?tcsh) then
    set prompt="${magenta}%n@${white}%B%m${blue}[ ! ] ${red}%~ ${end}> "
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
# Old
#========================================
# Prompt
