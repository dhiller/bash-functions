#!/bin/bash

set -e

CWD=$(pwd)

# Fetch and/or update all public stash repositories

cd /opt/opengrok/src/

curl "http://stash.wkd.wolterskluwer.de/rest/api/1.0/projects" > temp.txt
for PROJECT_URL in $(grep -e "\"href\":\"[^\"]\+\"" -o temp.txt | sed s/^\"href\":\"// | sed s/\"$//); do
    PROJECT_KEY=${PROJECT_URL##*/}
    curl "http://stash/rest/api/1.0/projects/$PROJECT_KEY/repos" > "$PROJECT_KEY.txt"
    for REPO_URL in $(grep -e "http:[^\"]\+\.git" -o "$PROJECT_KEY.txt"); do
        PROJECT_DIR=${REPO_URL##*/}
        PROJECT_DIR=${PROJECT_DIR%.git}
        if [ ! -d "$PROJECT_DIR" ]; then
            git clone "$REPO_URL"
        else
            cd "$PROJECT_DIR"
            git fetch --all
            git pull
            cd ..
        fi
    done
    rm -f "$PROJECT_KEY.txt"
done

rm -f temp.txt

#./updateSVNRepos.sh

# rebuild indices
/opt/opengrok/bin/OpenGrok index

# Reindexing only didn't update list of projects
#service tomcat restart

cd "$CWD"
