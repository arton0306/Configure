# set a little configuration
git config --global user.name "Arton Chang"
git config --global user.email arton0306@gmail.com
git config --global color.ui true
git config --global core.editor "vim"
git config --global alias.tree "log --graph --decorate --pretty=oneline --abbrev-commit --all"

# terminal tools ( the alias are set in ~/.bashrc )
update
install -y vim
install -y tcsh
install -y autojump
install -y aptitude # a text apt-get tool
install -y screen
install -y mosh     # a remote terminal application ( http://mosh.mit.edu/ )
install -y openssh-server
install -y procps   # for top
install -y htop     # a tool more convenient than top
install -y ruby

# gui tools
install -y synaptic # a gui apt-get tool
install -y meld # a diff tool ( http://meldmerge.org/ )
install -y gitg # git gui client tool
install -y git-gui
install -y cgdb
