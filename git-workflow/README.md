# Webstreak Git WorkFlow

## Git Repository
Our git repo is hosted thru github, <https://github.com/webstreak> .

## Branches
Standard branch structure is as follows:

- production    -> production branch.

- master        -> tested, production ready, validated on integration branch.

### Links
http://reinh.com/blog/2009/03/02/a-git-workflow-for-agile-teams.html

-----------
# Jr Dev / Web Design Team
## Example Usage
### 1. Fork webstreak repo to your personal github account

### 2. Clone repo to local machine

    git clone repo-path

### 3. Checkout master to new feature branch
Branch name should correspond to feature name/description.

    git checkout -b "featurename"

### 4. Make changes and then commit
Commit messages should be short and describe what the commit actually does. Uppercase first word.

    git add .
    git commit -am "Fix bug in things controller"

### 5. Checkout master branch & pull changes

    git checkout master
    git pull #if you have forked the repo, pull upstream master

### 6. If no changes, you may merge and push

    git merge featurename
    git push

### 7. If there are changes you need to rebase them. [Why?] (https://www.derekgourlay.com/blog/git-when-to-merge-vs-when-to-rebase/)

    git checkout featurename
    git rebase master

### 8. If there are conflicts you need to resolve them and then continue the rebase

    git rebase --continue

### 9. Now you may merge.

    git checkout master
    git merge featurebranch
    git push

### 10. Open pull request with main repo

https://help.github.com/articles/creating-a-pull-request/

-----------

# Dev Workflow
## Example Usage
### 1. Clone repo to local machine

    git clone repo-path

### 2. Checkout master to new feature branch
Branch name should correspond to feature name/description.

    git checkout -b "featurename"

### 3. Make changes and then commit
Commit messages should be short and describe what the commit actually does. Uppercase first word.

    git add .
    git commit -am "Fix bug in things controller"

### 4. Checkout master branch & pull changes

    git checkout master
    git pull #if you have forked the repo, pull upstream master

### 5. If no changes, you may merge and push

    git merge featurename
    git push

### 6. If there are changes you need to rebase them. [Why?] (https://www.derekgourlay.com/blog/git-when-to-merge-vs-when-to-rebase/)

    git checkout featurename
    git rebase master

### 7. If there are conflicts you need to resolve them and then continue the rebase

    git rebase --continue

### 8. Now you may merge.

    git checkout master
    git merge featurebranch
    git push
