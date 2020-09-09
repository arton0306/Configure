
# config file read order
# 1. /etc/gitconfig : for all system
# 2. ~/.gitconfig : for the user
# 3. .git/config : for one repo

if ! [ -f $HOME/.gitignore_global ]; then
    ln -s ~/Configure/git_conf/.gitignore_global ~/.gitignore_global
fi

git config --global user.name "Arton Chang"
git config --global user.email arton0306@gmail.com
git config --global color.ui true
git config --global core.editor "vim"
git config --global core.excludesfile ~/.gitignore_global
git config --global core.autocrlf false
git config --global pull.ff only
git config --global alias.tree "log --graph --decorate --pretty=oneline --abbrev-commit --all"
git config --global diff.tool tkdiff
