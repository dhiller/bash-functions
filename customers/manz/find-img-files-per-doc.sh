#!/bin/bash

echo "Searching for img links in documents"
for file in $(find . -type f -name "dokument.xml");
do
    temp_file=$(mktemp)
    grep -oP 'img src="[^"]+"' $file > $temp_file

    temp_media_db_files=$(mktemp)                                    
    cut -d '"' -f 2 $temp_file | sort | uniq > "$temp_media_db_files"

    no_of_img_files=$(wc -l "$temp_media_db_files" | cut -d ' ' -f 1)
    printf "$no_of_img_files"
    if (( "$no_of_img_files" > 0 )); then
        for img_file in $(cat "$temp_media_db_files");
        do
            img_file_found=$(find ${file%/formats/dokument.xml} -type f -name "$img_file" -print | wc -l)
            if (( "$img_file_found" == 0 )); then
                echo "File $file misses $img_file"
            fi
        done
    fi

    rm  "$temp_media_db_files"

done
