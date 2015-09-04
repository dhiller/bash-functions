#!/bin/bash

for project in $(cat ~/bin/wkd-projects.txt);
do
    echo "Checking $project"
    cd $CORE_CMS/$project
    git pull -q
    ~/bin/wkd-check-release-status.sh 
done
cd $CORE_CMS
