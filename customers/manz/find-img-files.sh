#!/bin/bash

echo "Searching for img links...."
temp_file=$(mktemp)
for file in $(find . -type f -name "dokument.xml");
do
    printf "."
    grep -oP 'img src="[^"]+"' $file >> $temp_file
done
echo ""

temp_media_db_files=$(mktemp)
cut -d '"' -f 2 $temp_file | sort | uniq > "$temp_media_db_files"
echo "Image files found:"
cat "$temp_media_db_files"

rm "$temp_file"

for file in $(cat "$temp_media_db_files");
do
    echo "Search for file: $file"
    find . -name "$file" -type f -print
done

rm "$temp_media_db_files"
