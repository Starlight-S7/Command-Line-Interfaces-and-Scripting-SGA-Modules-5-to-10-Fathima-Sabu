#!/bin/bash

# Convert text into one word per line
words=$(tr -cs 'a-zA-Z' '\n' < input.txt)

echo "Longest word:"
echo "$words" | awk '{ print length, $0 }' | sort -nr | head -1 | cut -d" " -f2

echo "Shortest word:"
echo "$words" | awk '{ print length, $0 }' | sort -n | head -1 | cut -d" " -f2

echo "Average word length:"
echo "$words" | awk '{ sum += length; count++ } END { print sum/count }'

echo "Total unique words:"
echo "$words" | sort | uniq | wc -l
