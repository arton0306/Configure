# set a little configuration
git config --global user.name "Arton Chang"
git config --global user.email arton0306@gmail.com
git config --global color.ui true
git config --global core.editor "vim"

# tools ( the alias are set in ~/.bashrc )
update
install -y vim
install -y autojump
install -y aptitude
install -y screen
install -y meld # a diff tool ( http://meldmerge.org/ )
install -y gitg # git gui client tool
