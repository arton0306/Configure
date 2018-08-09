# ----------------------------
# install homebrew
# ----------------------------

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# brew install
brew install git
brew install wget
brew install tmux

# ----------------------------
# backup&copy config files 
# ----------------------------

# bash
mv ~/.bash_profile ~/.bash_profile.orig
ln -s ~/Configure/.bashrc ~/.bash_profile

# tmux
mv ~/.tmux.conf ~/.tmux.conf.orig
ln -s ~/Configure/.tmux.conf ~/.tmux.conf

# vim
mv ~/.vimrc ~/.vimrc.orig
ln -s ~/Configure/vim/.vimrc ~/.vimrc
ln -s ~/Configure/vim ~/.vim

# ----------------------------
# git
# ----------------------------

source ~/Configure/git_conf/gitconf.sh

cd ~/Configure
git submodule init
git submodule update
cd -
