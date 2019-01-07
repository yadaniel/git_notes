# git command line help
general hint to find out the commands and command options 
    type git and hit <TAB><TAB>
    type git command and hit <TAB><TAB>
    type git command -- and hit <TAB><TAB>

general help for subcommands
    type git command --help

# usefull commands

## show all branches
git branch --all

## unstage all files
git reset HEAD --

## correct last commit message
git commit --amend

## find out all commits from $user
git log --author=$user

## find out commit when the file was added
git log --diff-filter=A filename
    git log --help | grep -A5 diff-filter
    --diff-filter=[(A|C|D|M|R|T|U|X|B)…[*]]
    Select only files that are Added (A), Copied (C), Deleted (D), Modified (M), Renamed (R) ...

## grep through commit messages
git log --grep=foo

## change branches with modified tracked files
git stash       # at master branch
git stash list  # show stash stack
git checkout <otherbranch>
# do work and go back to master branch and replay the changes
git checkout master
git stash apply
git stash drop  # take it from stack

## show what files were changed
git log --stat

## revert modified but not staged files back to original state
git checkout <file>

## print the list of all tracked files
git --ls-tree --full-tree -r --name-only HEAD
git --ls-tree --full-tree -r --name-only <hash>

## add a file to current commit
touch newfile
git add newfile
git commit --amend -m "change or leave the commit message"

## move changes between branches (e.g. commit done on wrong branch)
git checkout <newbranch>
git cherry-pick <hash>
git checkout <oldbranch>
### options to remove changes on oldbranch
git reset --soft    // modified tracked files are now in the staging area
git reset           // modified tracked files kept, but not staged
git reset --hard    // modified tracked files deleted, untracked files kept unstaged

## undo changes done by the last commit
git revert      # removes the changes from the last commit but adds new commit on top

## show difference between two commits
git diff <hash1> <hash2>
git diff <hash> # HEAD is implicit

## show difference between last commit ...
git diff            # and current changes that are not staged
git diff --cached   # and current changes that are staged
note: from git 1.6 --cached option equals --staged

## show difference one a file between last commit and current modified unstaged file
git diff HEAD <file>

