if ! [ -f $HOME/.gitignore_global ]; then
    cp .gitignore_global ~
fi

# set a little configuration
git config --global user.name "Arton Chang"
git config --global user.email arton0306@gmail.com
git config --global color.ui true
git config --global core.editor "vim"
git config --global alias.tree "log --graph --decorate --pretty=oneline --abbrev-commit --all"
git config --global core.excludesfile ~/.gitignore_global
