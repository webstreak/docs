#WebStreak Git WorkFlow

##Git Repository
Our git repo is hosted thru github, <https://github.com/webstreak> .

##Branches
Standard branch structure is as follows:

- master        -> tested, production ready, validated on integration branch. Push restricted to product owner.

- featureBranch -> one branch per new feature, stored locally - only push to GH in special situations.

-----------

##Example Usage
###1. Clone repo to local machine

    git clone repo-path

###2. Checkout master to new feature branch
Branch name should correspond to pivotal tracker ID and feature name/description.

    git checkout -b "featurename"

###3. Make changes and then commit
Commit messages should be short and describe what the commit actually does.

    git add .
    git commit -am "commit message"

###4. Checkout master branch & pull changes

    git checkout master
    git pull

###5. If no changes, you may merge and push

    git merge featurename
    git push

###6. If there are changes you need to rebase them. [why?] http://infinitemonkeys.influitive.com/a-simple-explanation-for-git-rebase/
    git checkout featurename
    git rebase master

###7. If there are conflicts you need to resolve them and then continue the rebase

    git rebase --continue

###8. Now you may merge.

    git checkout master
    git merge featurebranch
    git push


