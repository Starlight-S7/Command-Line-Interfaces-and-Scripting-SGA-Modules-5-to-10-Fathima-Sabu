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

"$!" gives the PID of the most recent background process.

4 <code>wait
echo "All background processes completed."</code>

Pauses the script execution and waits until all background processes finish. If we do not use wait, script may exit before moves complete. Finally, it displays the completion message after all processes are done.

In summary, the script moves files concurrently using background processes, tracks their PIDs using $!, and synchronizes completion using wait.

<h3>Execution steps and demonstration</h3>
Used "chmod +x" to give execution permission, and executed the shell script.
<img width="878" height="661" alt="Screenshot (783)" src="https://github.com/user-attachments/assets/04e8199d-77dc-48c1-92ee-997d2730a3dc" />

I used the dirB directory I created for Question 5 for demonstration here. After I executed the shell script and checked the directory, the backup sub-directory was created and the files had been moved into it.
<img width="718" height="555" alt="Screenshot (784)" src="https://github.com/user-attachments/assets/960faa98-20b2-4ec3-81e1-868f3a051c37" />
The shell script worked!
