#!/bin/bash

# Check for exactly one argument
if [ $# -ne 1 ]; then
    echo "Error: Please provide exactly one argument."
    exit 1
fi

# Check if path exists
if [ ! -e "$1" ]; then
    echo "Error: Path does not exist."
    exit 1
fi

# If argument is a file
if [ -f "$1" ]; then
    echo "File Analysis:"
    echo "Lines: $(wc -l < "$1")"
    echo "Words: $(wc -w < "$1")"
    echo "Characters: $(wc -c < "$1")"

# If argument is a directory
elif [ -d "$1" ]; then
    echo "Directory Analysis:"
    echo "Total files: $(ls -l "$1" | grep "^-" | wc -l)"
    echo ".txt files: $(ls "$1"/*.txt 2>/dev/null | wc -l)"
else
    echo "Error: Invalid input."
fi
