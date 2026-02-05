<h1>Answer 5 Explanation</h1>
Question 5 folder contains the shell script "sync.sh" and the directories and files I created to demonstrate this assignment question.

<h3>The shell script command explanation</h3>
1
<code>dirA=$1
dirB=$2</code

$1 -> first argument
$2 -> second argument

2
<code>ls "$dirA" > a.txt
ls "$dirB" > b.txt</code>

store filename in lists, such as dirA in a.txt and dirB in b.txt

3
<code>echo "Files only in dirA:"
ls "$dirA" > a.txt
ls "$dirB" > b.txt
comm -23 a.txt b.txt</code>

comm compares two sorted files line by line

Columns:

1. Only in first file

2. Only in second file

3. Common lines

-23 means hide columns 2 and 3

4
<code>echo "Files only in dirB:"
comm -13 a.txt b.txt</code>

Shows files only in dirB and -13 hides column 1 and 3.

5
<code>echo "Common files with comparison:"
comm -12 a.txt b.txt | while read file
do
    if cmp "$dirA/$file" "$dirB/$file" > /dev/null
    then
        echo "$file : SAME"
    else
        echo "$file : DIFFERENT"
    fi
done</code>

This gives us filenames that exist in both directories.

cmp compares binary content of two files, and then if they are same, it echoes the first command "file : SAME", else it echoes "file : DIFFERENT".

6
<code>rm a.txt b.txt</code>

This removes the temporary files and keeps the system clean from the unwanted files.

<h3>Execution steps and Demonstration</h3>

I first created the directories "dirA" and "dirB" using mkdir command.
<img width="1920" height="1019" alt="Screenshot (767)" src="https://github.com/user-attachments/assets/7cea17ce-a409-4c48-87aa-c01e323cde2f" />

Then I added text files with some content in them in both directories, one file had matching names and different content, and the other file had matching names and matching content, the other files created were completely different from eachother.
<img width="857" height="652" alt="Screenshot (768)" src="https://github.com/user-attachments/assets/087dd6d8-46ac-4dd4-9c59-6bc2c214e16d" />
<img width="851" height="644" alt="Screenshot (769)" src="https://github.com/user-attachments/assets/8586f15b-f9f6-44f0-b957-88dea25a5348" />

Then I proceeded to create the shell script "sync.sh" and used the command chmod to give execution permission, and then executed the file.
<img width="1920" height="1019" alt="Screenshot (770)" src="https://github.com/user-attachments/assets/553ab868-92b1-480e-b9be-4d1e415872b1" />
<img width="867" height="661" alt="Screenshot (771)" src="https://github.com/user-attachments/assets/2d1ec907-a047-45e7-aa04-61d4900ae2bb" />

The output showed the unique files in dirA and dirB, then common filenames with different content, and finally files with the same name and content. The shell script worked!
