# tcsh
ln -s ~/Configure/.cshrc ~/.cshrc.ongit

# bash
ln -s ~/Configure/.bashrc ~/.bashrc

# tmux
ln -s ~/Configure/.tmux.conf ~/.tmux.conf

# screen
# ln -s ~/Configure/.screenrc ~/.screenrc

# vim
ln -s ~/Configure/vim/.vimrc ~/.vimrc
ln -s ~/Configure/vim ~/.vim

# for mac
platform='unknown'
unamestr=$(uname)
if [[ "$unamestr" == 'Darwin' ]]; then
    platform='freebsd'
    if [ -f $HOME/.bash_profile ]; then
        echo ".bash_profile exists"
    else
        ln -s ~/.bashrc ~/.bash_profile
    fi
fi
