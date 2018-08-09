sudo apt-get update
sudo apt-get dist-upgrade -y

sudo apt-get install -y git
sudo apt-get install -y htop
sudo apt-get install -y autojump
sudo apt-get install -y tmux
sudo apt-get install -y vim
sudo apt-get install -y dtrx
sudo apt-get install -y apt-file
sudo apt-file update

if [ -f $HOME/.bashrc ]; then
    mv $HOME/.bashrc $HOME/.bashrc.orig
fi
source ~/Configure/new_computer/create_conf_file_link.sh
source ~/Configure/git_conf/gitconf.sh

cd ~/Configure
git submodule init
git submodule update
