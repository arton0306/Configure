## cookbook
* print tree: `git config --global alias.tree "log --graph --decorate --pretty=oneline --abbrev-commit --all"`
* list untracked files: `git ls-files --others --exclude-standard`
* use difftool: `git difftool myfile`

## submodule
the concept of submodule is that the main repo just store the hash of submodule's head

### for creater
* `git clone --recurse` to clone the main repo and all submodules
* `git submodule update --init`
* `git submodule add <repo url> <folder>`
* `git submodule init` to register submodule into .git/config from .gitmodules, usually we just use `git submodule update --init`, except you want to change the folder of submodule

## misc
* git status -uno: only show staged files (https://stackoverflow.com/questions/10018533/is-it-possible-to-git-status-only-modified-files/10018728)
