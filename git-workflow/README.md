# WebStreak Git WorkFlow

## Git Repository
Our git repo is hosted thru github, <https://github.com/webstreak> .

## Branches
Standard branch structure is as follows:

- production    -> production branch.

- master        -> tested, production ready, validated on integration branch. Push restricted to product owner.

- featureBranch -> one branch per new feature, stored locally - only push to GH in special situations.

### Links
http://reinh.com/blog/2009/03/02/a-git-workflow-for-agile-teams.html

-----------

## Example Usage
### 1. Clone repo to local machine

    git clone repo-path

### 2. Checkout master to new feature branch
Branch name should correspond to pivotal tracker ID and feature name/description.

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

### 6. If there are changes you need to rebase them. [Why?] (http://infinitemonkeys.influitive.com/a-simple-explanation-for-git-rebase/)

    git checkout featurename
    git rebase master

### 7. If there are conflicts you need to resolve them and then continue the rebase

    git rebase --continue

### 8. Now you may merge.

    git checkout master
    git merge featurebranch
    git push
