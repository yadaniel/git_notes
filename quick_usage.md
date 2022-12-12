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
 
## correct last commit, add file 
git add somefile 
git state 
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

## show commits for the branch
git log <branch>
  
## revert modified but not staged files back to original state  
git checkout <file>  
git checkout -- <file>  
  
## revert all modified but not staged files back to original state  
git checkout -- .  
  
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
  
## show difference between two commits on the same branch
git diff                    # compare HEAD with current unstaged (tracked) files  
git diff <hash>             # compare HEAD and commit with hash, HEAD is implicit  
git diff <hash1> <hash2>    # compare two commits, additions/deletions from hash1 to hash2 are shown as +/- (time axis)  
git diff HEAD^              # compare commit before HEAD and HEAD  
git diff HEAD^^             # compare commit 2 commits before HAD and HEAD  
git diff <hash> <samehash>^ # compare commit with given hash and its predecessor commit  
git show <hash>             # compare commit with given hash and its predecessor commit  
git show <hash>^            # compare predecessor commit of given hash and its predecitor commit  
git show <hash>^^           # compare pre(pre(commit with given hash)) and  pre(pre(pre(commit)))  

## show difference between file on different branches
git diff <branch1> <branch2> -- <file>      # temporary files are opened
git diff <hash> -- <file>                   # temporary file from <hash> opened, file on current branch opened => vimdiff diffget diffput
  
## show difference between last commit ...  
git diff            # and current changes that are not staged    
git diff --cached   # and current changes that are staged    
note: from git 1.6 --cached and --staged are equivalent  
  
## show which files has changed between commits  
git diff HEAD^ --name-only      # show the changed files between HEAD and current commit  
git diff HEAD^ --name-status    # show the status of files between HEAD and current commit  
Possible status letters are:  
    A: addition of a file  
    C: copy of a file into a new one  
    D: deletion of a file  
    M: modification of the contents or mode of a file  
    R: renaming of a file  
    T: change in the type of the file  
    U: file is unmerged (you must complete the merge before it can be committed)  
    X: "unknown" change type (most probably a bug, please report it)  
  
## show difference one a file between last commit and current modified unstaged file  
git diff HEAD <file>  
  
# howto fetch and merge  
git fetch  
remote: Counting objects: 42, done.  
remote: Compressing objects: 100% (42/42), done.  
remote: Total 42 (delta 31), reused 0 (delta 0)  
Entpacke Objekte: 100% (42/42), Fertig.  
Von ssh://git.foobar.net/home/git/repo  
   e13f669a4..5a79bd57d  master        -> origin/master  
   0321d08cb..6789f9f1f  branchBugfix -> origin/branchBugfix  
   2f1a4c6ff..9b0fde4b2  branchFeature  -> origin/branchFeature  
  
  
## try 1  
git merge (incorrect)  
fatal: Kein Remote-Repository für den aktuellen Branch.  
  
## try 2 (incorrect)  
git merge master    # from some other branch will not work  
Bereits aktuell.  
  
## try 3 (correct)  
git checkout master  
git merge  
Aktualisiere a345aebe5..5a79bd57d  
Fast-forward  
 foo/common/xyz.cpp     | 2 +-  
 foo/bar/abc.cpp | 4 ++++  
 2 files changed, 5 insertions(+), 1 deletion(-)  
  
***git merge must be called from the corresponding branch***  
  
## delete branch  
git branch --delete <name>  // delete  
git branch -D <name>        // force delete  
  
## clean  
git clean -Xdf  // -Xd files and directories listed in .gitignore  
git clean -xdf  // -xd files and directories which are not tracked  
git clean --dry-run -X  // do not delete, just show  
  
## list all files under control  
git ls-tree -r <branch>  
  
## add ignored file  
git add -f <file>  
  
## add all traced files  
git add --update  
 
## rename branch local and then on remote repository 
git branch <old_name> --move <new_name> 
git push origin --delete <old_name> 
git push origin <new_name> 
 
## copy one tracked file from other branch 
git checkout <branch> <file> 
 
## find out the url of cloned remote repository when in working in local repository 
git remote get-url origin 
 
# alias set, unset and list 
git config --global alias.st status     //  ~/.gitconfig 
git config --local alias.st status      // .git/config of the current repository 
git config --system alias.st status     // /etc/gitconfig 
git config --global --unset alias.st status     //  ~/.gitconfig  
git config --global --list  
git config --list  

# revert 
git commit -m "some commit usefull 1" 
git commit -m "some commit 2 with error" 
git commit -m "some commit usefull 3" 
git revert <hash-of-commit2> 
git revert --continue 
git revert --abort 
git revert --skip 
if changes are in same file, manual resolution is needed  

  
