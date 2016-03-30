#!/bin/bash

# Downloads a set of media db files from wimbledon rest api
# Parameters:
#    1: input file list
#    2: output file name (will be created in current working directory)

function usage {
    echo "Usage: $0 <input-file> <output-file>"
    exit 1                                     
}

set -e

CWD=$(pwd)

if [ ! -f "$1" ]; then
    usage
fi

if [ -f "$CWD/$2" ]; then
    echo "File $2 already exists!"
    usage 
fi

MISSING_FILES="$1"
OUTPUT_FILE="$CWD/$2"

# Do not let wget stop file download if file is missing
set +e
TEMP_DIR=$(mktemp -d)
for file in $(cat "$MISSING_FILES")
do
    echo "Downloading $file"
    wget --user=$wkd_username \
         --password=$wkd_password \
         -q \
         -O $TEMP_DIR/$file \
         http://wimbledon.wkd.wolterskluwer.de/api/mediadb/binaries/$file
done
echo "Downloaded files to $TEMP_DIR"

ERROR_LOG="$TEMP_DIR/errors.log"

echo "Empty files:" > "$ERROR_LOG"
find "$TEMP_DIR" -size 0b -print >> "$ERROR_LOG"

CWD=$(pwd)
cd "$TEMP_DIR"
zip -r "$OUTPUT_FILE" .
cd "$CWD"
echo "Created file $OUTPUT_FILE"

rm -rf "$TEMP_DIR"
echo "Temporary folder $TEMP_DIR deleted"
