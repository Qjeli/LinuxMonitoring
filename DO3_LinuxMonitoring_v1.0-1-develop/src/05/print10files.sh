#!/bin/bash

function print_top_10_files {
  i=1
while read -r file_info; do
    file_size=$(echo "$file_info" | awk '{print $1}')
    file_path=$(echo "$file_info" | awk '{print $2}')
    file_type=$(file -b --mime-type "$file_path")
    echo "$i - $file_path, $(numfmt --to=iec-i --suffix=B "$file_size"), $file_type"
    ((i++))
done <<< "$TOP_FILES"
}