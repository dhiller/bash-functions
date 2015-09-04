#!/bin/bash

for project_name in $(cat svn_projects.txt);
do
    svn co http://svn.wkd.wolterskluwer.de/svn/$project_name
done
