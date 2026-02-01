#!/bin/bash

if [ $# -ne 1 ]
then
    echo "Invalid number of arguments"
    exit 1
fi

if [ ! -e "$1" ]
then
    echo "Path does not exist"
    exit 1
fi

if [ -f "$1" ]
then
    wc "$1"

elif [ -d "$1" ]
then
    ls "$1" | wc -l
    ls "$1"/*.txt 2>/dev/null | wc -l

fi
