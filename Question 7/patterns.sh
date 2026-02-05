#!/bin/bash

# Extract words, convert to lowercase
words=$(tr -cs 'a-zA-Z' '\n' < "$1" | tr 'A-Z' 'a-z')

# Only vowels
echo "$words" | grep -E '^[aeiou]+$' > vowels.txt

# Only consonants
echo "$words" | grep -E '^[^aeiou]+$' > consonants.txt

# Mixed words starting with a consonant
echo "$words" | grep -E '^[^aeiou][a-z]*[aeiou][a-z]*$' > mixed.txt
