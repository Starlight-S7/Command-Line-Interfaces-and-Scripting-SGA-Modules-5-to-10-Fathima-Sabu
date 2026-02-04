<h1>Answer 3 Explanation</h1>
The Question 3 folder contains both the shell script file "validate_results.sh" and the example text file I created to use for demonstration, named "marks.txt".

The below code reads one line at a time from marks.txt:

<code>while read roll name m1 m2 m3</code>

<code>fail=0</code>-> It tracks how many subjects the student failed.

In the code below, -lt means less than, checking if the mark is less than 33, which would then mean failed, and hence the fail coutner increases.

<code>if [ $m1 -lt 33 ]; then
        fail=$((fail + 1))
    fi
    if [ $m2 -lt 33 ]; then
        fail=$((fail + 1))
    fi
    if [ $m3 -lt 33 ]; then
        fail=$((fail + 1))
    fi</code>

In the code below, if the fail counter equals one, then the roll number and name of the student will be printed, and the fail_one counter goes up by 1. In the case when the fail counter is zero, then the student has passed all subjects and their roll number and name will be printed, and 1 will be added to the pass_all counter.

<code> if [ $fail -eq 1 ]; then
        echo "Failed in one subject: $roll $name"
        fail_one=$((fail_one + 1))
    fi
    if [ $fail -eq 0 ]; then
        echo "Passed all subjects: $roll $name"
        pass_all=$((pass_all + 1))
    fi</code>

The below line of code feeds the marks.txt into the while loop line by line:

<code>done < marks.txt</code>
