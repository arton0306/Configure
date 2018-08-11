source ~/Configure/git_conf/gitconf.sh

# ----------------------------
# backup&copy config files 
# ----------------------------

# bash
mv ~/.bashrc ~/.bashrc.orig
ln -s ~/Configure/.bashrc ~/.bashrc

# tmux
mv ~/.tmux.conf ~/.tmux.conf.orig
ln -s ~/Configure/.tmux.conf ~/.tmux.conf

# vim
mv ~/.vimrc ~/.vimrc.orig
ln -s ~/Configure/vim/.vimrc ~/.vimrc
ln -s ~/Configure/vim ~/.vim
