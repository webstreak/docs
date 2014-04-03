#WebStreak Git WorkFlow

##Git Repository
Our git repo is hosted thru github, <https://github.com/webstreak> .

##Branches
Standard branch structure is as follows:

- master        -> tested, production ready, validated on integration branch. Push restricted to product owner.

- integration   -> used for testing dev branch commits. Never merge with master.

- featureBranch -> one branch per new feature, merge with integration for testing, then request merge to master.

-----------

##Example Usage
###1. Clone repo to local machine

    git clone repo-path

###2. Checkout master to new feature branch
Branch name should correspond to pivotal tracker ID and feature name/description.

    git checkout -b "pivotalID-featurename"

###3. Make changes and then commit
Commit messages should be short and describe what the commit actually does. 

    git add --all
    git commit -am "commit message"

###4. Merge with integration branch for testing

    git checkout integration
    git merge pivotalID-featurename

###5. Request merge to master once feature tested and verified by product owner.

-----------

###To Do:

Setup/describe remote deploy definition:

    git remote add deploy http://deployurl.com

