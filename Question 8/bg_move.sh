#!/bin/bash

dir=$1
backup="$dir/backup"

mkdir -p "$backup"

for file in "$dir"/*
do
    mv "$file" "$backup" &     # background move
    echo "Moved $file | PID: $!"
done

wait
echo "All background processes completed."
