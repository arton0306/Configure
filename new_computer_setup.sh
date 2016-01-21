sudo apt-get install -y git
sudo apt-get install -y autojump
sudo apt-get install -y tmux
sudo apt-get install -y vim

if [ -f $HOME/.bashrc ]; then
    mv $HOME/.bashrc $HOME/.bashrc.orig
fi
source ~/Configure/create_conf_file_link.sh
source ~/Configure/git_conf/gitconf.sh
