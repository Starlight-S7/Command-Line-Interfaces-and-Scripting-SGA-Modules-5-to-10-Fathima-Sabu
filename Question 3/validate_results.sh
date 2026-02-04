#!/bin/bash

fail_one=0
pass_all=0

while read roll name m1 m2 m3
do
    fail=0

    if [ $m1 -lt 33 ]; then
        fail=$((fail + 1))
    fi

    if [ $m2 -lt 33 ]; then
        fail=$((fail + 1))
    fi

    if [ $m3 -lt 33 ]; then
        fail=$((fail + 1))
    fi

    if [ $fail -eq 1 ]; then
        echo "Failed in one subject: $roll $name"
        fail_one=$((fail_one + 1))
    fi

    if [ $fail -eq 0 ]; then
        echo "Passed all subjects: $roll $name"
        pass_all=$((pass_all + 1))
    fi

done < marks.txt

echo "Count failed in exactly one subject: $fail_one"
echo "Count passed in all subjects: $pass_all"
