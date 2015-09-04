#!/bin/bash

set -e

cwd=$(pwd)

cd "$CORE_CMS/wkd-cms-source"
version=$(mvn org.apache.maven.plugins:maven-help-plugin:2.1.1:evaluate -Dexpression=project.version | sed -n -e '/^\[.*\]/ !{ /^[0-9]/ { p; q } }')
update_branch_name="feature/wkd-cms-source-update-$version"

cd "$CORE_CMS"

for project_dir in $(grep -l 'wkd-cms-source' --exclude 'wkd-cms-source/*' --exclude '**/target/*' **/pom.xml|sed 's/\/.*//g'); 
do
    cd "$CORE_CMS/$project_dir"
    echo "Checking "$(pwd)

    branch_to_check=master
    if [ $(git branch -l|grep develop|wc -l) -ne 0 ]; then
        branch_to_check=develop
    fi

    git checkout "$branch_to_check"
    git pull
    git checkout -b "$update_branch_name"
    mvn versions:update-parent -DparentVersion="$version" -DallowSnapshots=true -DgenerateBackupPoms=false
    git commit -am "wkd-cms-source updated to $version"
    git push -u origin "$update_branch_name" 
done

cd "$cwd"
