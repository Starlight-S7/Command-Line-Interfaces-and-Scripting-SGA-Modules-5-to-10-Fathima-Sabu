<h1>Answer 1 Explanation</h1>
The shell script in the analyze.sh file has been written and executed in my Kali Linux VM to check if it was working. You can find a detailed explanation for every command executed to check whether each of the shell script blocks is working.
<img width="1920" height="1014" alt="Screenshot (752)" src="https://github.com/user-attachments/assets/45dab6a1-baa1-440d-b6ac-7066d6614f93" />

The first thing I did after creating the analyze.sh file with the complete script in it is go to the Kali command line and changed the directory to Desktop <em>(cd Desktop)</em>, where the file was saved.

I then used the command <em>chmod +x analyze.sh</em> to permit my current user to execute the shell script.
<img width="940" height="705" alt="Screenshot (753)" src="https://github.com/user-attachments/assets/f6e75fec-0891-463c-9ce8-0c4891550d31" />


The first block of the shell script is to check for exactly one argument:

<code>if [ $# -ne 1 ]; then
    echo "Error: Please provide exactly one argument."
    exit 1
fi</code>

I used the command <em>./analyze.sh bandit ~/Downloads</em> to analyze a file named "bandit" and a directory name "Downloads". The script is instructed to show an error message if there's more than one argument, and it does its job. Since there's two arguments given in the command, it shows the error message.

<img width="898" height="674" alt="Screenshot (758)" src="https://github.com/user-attachments/assets/a2717830-718d-4e76-9c1a-d6cbf54730ba" />

On the above image, you can see that I also used the command <em>./analyze.sh Downloads</em> to test the second part of the script to check if the path exists:

<code>if [ ! -e "$1" ]; then
    echo "Error: Path does not exist."
    exit 1
fi</code>

Since I'm in the Desktop directory and there's no direct pathway to Downloads from there unless I include the complete pathway <strong>~/Downloads</strong>, it shows an error, just as the script instructs it to, because the path <strong>Downloads</strong> doesn't exist in the Desktop directory.

The third part of the script checks if it's a file.

<code>if [ -f "$1" ]; then
    echo "File Analysis:"
    echo "Lines: $(wc -l < "$1")"
    echo "Words: $(wc -w < "$1")"
    echo "Characters: $(wc -c < "$1")"</code>
    
I used the command <em>./analyze.sh bandit</em> to analyze the file name bandit. The result I got is given in the screenshot below:
<img width="897" height="673" alt="Screenshot (754)" src="https://github.com/user-attachments/assets/37fce2e4-5614-4720-a0d5-9ac527ec1f00" />

If it was not a file, it will move on to the final part that checks if it's a directory

<code>elif [ -d "$1" ]; then
    echo "Directory Analysis:"
    echo "Total files: $(ls -l "$1" | grep "^-" | wc -l)"
    echo ".txt files: $(ls "$1"/*.txt 2>/dev/null | wc -l)"</code>

I used the command <em>./analyze.sh ~/Downloads</em> to analyze the Downloads directory. The first image shows my Download directory results with no <strong>.txt</strong> files, and the second image shows the result after I added a txt file.
<img width="943" height="707" alt="Screenshot (756)" src="https://github.com/user-attachments/assets/9f435c5f-e32b-4add-9031-17fc12d36f79" />
<img width="926" height="694" alt="Screenshot (757)" src="https://github.com/user-attachments/assets/5a5dbd18-3e15-4766-b237-b1ad57011aa8" />

For additional checks, I have also analyzed an empty file and an empty directory:
<img width="1920" height="1021" alt="Screenshot (759)" src="https://github.com/user-attachments/assets/f0e79f36-51b4-4fb5-8dd5-2f352b8dea2f" />
