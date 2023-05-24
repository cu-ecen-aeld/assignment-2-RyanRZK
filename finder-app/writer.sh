#!/bin/bash
# writer script for assignment 1
# Author: Reza Karimzadeh  

# Check if all arguments are specified
if [ $# -ne 2 ]; then
    echo "two arguments (a file path, and a text to write to the file) should be supplied."
    exit 1
fi

writefile=$1
writestr=$2

# Create the directory path if it doesn't exist
mkdir -p "$(dirname "$writefile")"

# Write the content to the file
echo "$writestr" > "$writefile"

# Check if the file was created successfully
if [ $? -ne 0 ]; then
    echo "Failed to create $writefile"
    exit 1
fi

echo "File created successfully: $writefile"
