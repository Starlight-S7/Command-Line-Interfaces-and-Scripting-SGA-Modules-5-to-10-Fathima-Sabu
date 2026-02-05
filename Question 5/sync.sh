#!/bin/bash

dirA=$1
dirB=$2

# Files only in dirA
echo "Files only in dirA:"
ls "$dirA" > a.txt
ls "$dirB" > b.txt
comm -23 a.txt b.txt

# Files only in dirB
echo "Files only in dirB:"
comm -13 a.txt b.txt

# Files present in both
echo "Common files with comparison:"
comm -12 a.txt b.txt | while read file
do
    if cmp "$dirA/$file" "$dirB/$file" > /dev/null
    then
        echo "$file : SAME"
    else
        echo "$file : DIFFERENT"
    fi
done

rm a.txt b.txt
