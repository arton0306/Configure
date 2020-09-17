## cookbook
* print tree: `git config --global alias.tree "log --graph --decorate --pretty=oneline --abbrev-commit --all"`
* list untracked files: `git ls-files --others --exclude-standard`
* use difftool: `git difftool myfile`
* check current config: `git config --list`

## submodule
the concept of submodule is that the main repo just store the hash of submodule's head

### commands
* `git clone --recurse` to clone the main repo and all submodules
* `git submodule update --init`
* `git submodule add <repo url> <folder>`
* `git submodule init` to register submodule into .git/config from .gitmodules, usually we just use `git submodule update --init`, except you want to change the folder of submodule

If the content of submodule changes while the submodule's head is pointing to the same commit, there will be a `dirty` mark for the submodule from the view of main repo. For example,

    -Subproject commit 4152b5c0fda2fa0de467956ed691982a8189953b
    +Subproject commit 4152b5c0fda2fa0de467956ed691982a8189953b-dirty

## misc
* `git status -uno`: only show staged files (https://stackoverflow.com/questions/10018533/is-it-possible-to-git-status-only-modified-files/10018728)
* `git merge branch_A`: merge `branch_A` into current branch. After merging, current branch has the information of all changes. Usually, current branch is the main branch, and `branch_A` is to implement/fix something.
