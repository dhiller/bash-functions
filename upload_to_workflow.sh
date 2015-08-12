#!/bin/bash

WORK_DIR=$(pwd)
if [ -d "$1" ]; then
    WORK_DIR="$1"
fi

for FILE in $(find "$WORK_DIR" -name "*.xml" -print); do
    uuid=$(uuidgen)
    curl -v -F \
        "externname=@$FILE" \
        "http://eusqld272016:8000/wf/servlet.method/com.groiss.lncommon.doc.service.http.DocumentService.upload?extid=$uuid&user=curl&password=wurx"
done;
