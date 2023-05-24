#!/bin/sh
# finder script for assignment 1
# Author: Reza Karimzadeh   

# Check if all runtime arguments are specified
if [ $# -ne 2 ]; then
    echo "two arguments (a directory, and a text to search for within the directory) should be supplied."
    exit 1
fi

filesdir=$1
searchstr=$2

# Check if filesdir is a directory
if [ ! -d "$filesdir" ]; then
    echo "$filesdir does not represent a directory on the filesystem"
    exit 1
fi

# Count the number of files and matching lines
file_count=0
line_count=0

# Recursive function to search for matching lines in files
search_files() {
    local dir=$1
    local search=$2

    for file in "$dir"/*; do
        if [ -f "$file" ]; then
            file_count=$((file_count + 1))
            match_count=$(grep -c "$search" "$file")
            line_count=$((line_count + match_count))
        elif [ -d "$file" ]; then
            search_files "$file" "$search"
        fi
    done
}

# Call the search function with the provided arguments
search_files "$filesdir" "$searchstr"

# Print the results
echo "The number of files are $file_count and the number of matching lines are $line_count."
