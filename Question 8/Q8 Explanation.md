<h1>Answer 8 Explanation</h1>
Question 8 folder contains the shell script "bg_move.sh". I reused the dirB directory I created for Question 5 to demonstrate this question's shell script.

<h3>The shell script command explanation</h3>
1 <code>dir=$1</code> means that the first argument is stored as the function dir.

2 <code>backup="$dir/backup"
mkdir -p "$backup"</code>

Creates the backup directory as a subdirectory of the directory given as the argument. -p ensures there's no error if backup already exists.

3 <code>for file in "$dir"/*
do
    mv "$file" "$backup" &
    echo "Moved $file | PID: $!"
done</code>

All the files inside the directory are moved to the backup directory, and the "&" symbol makes the commands run in the background.

