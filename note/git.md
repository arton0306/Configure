## cookbook
* print tree: `git config --global alias.tree "log --graph --decorate --pretty=oneline --abbrev-commit --all"`
* list untracked files: `git ls-files --others --exclude-standard`
* use difftool: `git difftool myfile`

## submodule refs

### for creater
* git submodule add git@github.com:josephj/javascript-platform-yui.git static/platform
* git submodule init ( register submodule into .git/config )

### for others
* after git clone...
* git submodule init
* git submodule update
* git submodule update --init --recursive