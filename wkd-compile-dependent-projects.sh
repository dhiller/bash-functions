#!/bin/bash

set -e

for project in $(grep -l 'wkd-cms-source' --exclude 'wkd-cms-source/*' --exclude '**/target/*' **/pom.xml|sed 's/\/.*//g'); do
    cd $project
    mvn -U clean install
    cd ..
done
