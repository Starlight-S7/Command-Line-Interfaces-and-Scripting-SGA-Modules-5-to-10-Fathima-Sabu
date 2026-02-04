#!/bin/bash

grep -E '^[a-zA-Z0-9]+@[a-zA-Z]+\.com$' emails.txt > valid.txt

grep -Ev '^[a-zA-Z0-9]+@[a-zA-Z]+\.com$' emails.txt > invalid.txt

sort valid.txt | uniq > temp.txt
mv temp.txt valid.txt
