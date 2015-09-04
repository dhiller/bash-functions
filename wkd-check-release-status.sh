#!/bin/bash

branch_to_check=master
if [ $(git branch -l|grep develop|wc -l) -ne 0 ]; then
    branch_to_check=develop
fi

commits_since_release=$(git log --format=oneline $(git release-commit $branch_to_check)..|wc -l)
release_description=$(git show $(git release-commit $branch_to_check) --format=%s|head -1|grep -o -P '[^ ]+$')

echo "$branch_to_check has $commits_since_release commit(s) since $release_description"
