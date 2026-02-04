<h1>Answer 4 Explanation</h1>
The Question 4 folder contains both the shell script file "emailcleaner.sh" and the example text file I created to use for demonstration, named "emails.txt".

<code>#!/bin/bash</code> -> Tells the system to run the script using bash.

<code>grep -E '^[a-zA-Z0-9]+@[a-zA-Z]+\.com$' emails.txt > valid.txt</code> -> Extract VALID emails

<code>^</code>                -> start of line

<code>[a-zA-Z0-9]+</code>     -> one or more letters or digits

<code>[a-zA-Z]+</code>        -> one or more letters in domain name

<code>$</code>                -> end of line

-E enables extended regex and lets us use <code>+</code> without escaping, and <code>> valid.txt</code> stores matched lines into valid.txt file.

To extract the INVALID emails:

<code>grep -Ev '^[a-zA-Z0-9]+@[a-zA-Z]+\.com$' emails.txt > invalid.txt</code>

<code>-v</code> is used to invert match, as in give me lines that do not match a specific pattern. Hence, the code finds all the emails that cannot be categorised as valid and stores them into the <code>invalid.txt</code> file.

In order to remove duplicates from valid.txt:

<code>sort valid.txt | uniq > temp.txt</code>

Here, we used "sort" first because "uniq" only removes adjacent duplicates. So we first get all the same emails adjacent to each other and then use uniq to remove them, and store them into temp.txt.

To replace the original file with the final correct valid file:

<code>mv temp.txt valid.txt</code>

This is because we can't directly overwrite <code>valid.txt</code> while reading it.

This is the text file created with all the valid, invalid, and duplicate emails in them.

<img width="706" height="545" alt="Screenshot (766)" src="https://github.com/user-attachments/assets/69eb6590-3ab3-42a4-a43b-a0b0329477c3" />

Once I run the script after using the chmod command, and then using the <em>./emailcleaner.sh emails.txt</em> command, I get valid.txt and invalid.txt automatically created in my system, with the proper email classification.

<img width="1920" height="1019" alt="Screenshot (765)" src="https://github.com/user-attachments/assets/47e4d859-7218-4965-8888-44b556763cdc" />
