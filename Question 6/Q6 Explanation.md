<h1>Answer 6 Explanation</h1>
Question 6 folder contains the shell script "metrics.sh" and the text file "input.txt" I created to demonstrate this assignment question.

<h3>The shell script command explanation</h3>
1 <code>words=$(tr -cs 'a-zA-Z' '\n' < input.txt)</code>

Converts text into one word per line and stores it in the variable words

2 <code>echo "Longest word:"
echo "$words" | awk '{ print length, $0 }' | sort -nr | head -1 | cut -d" " -f2</code>

Prints the lenght of each word, then sorts it in reverse order (largest to smallest), takes the longest, removes the lenght and only shows the word.

3 <code>echo "Shortest word:"
echo "$words" | awk '{ print length, $0 }' | sort -n | head -1 | cut -d" " -f2</code>

Pretty much the same as the longest word, except this time there's no -r, hence the smallest comes first, and displays the smallest word.

4 <code>echo "Average word length:"
echo "$words" | awk '{ sum += length; count++ } END { print sum/count }'</code>

<code>sum += lenght</code> adds all the characters and gives the total number of characters, <code>count++</code> counts the number of words, END after processing all lines and then calculate the average <code>sum/count</code>

5 <code>echo "Total unique words:"
echo "$words" | sort | uniq | wc -l</code>

sort groups the duplicates, uniq removes the duplicates, and wc -l counts the remaining lines.

In summary, the script converts text into one word per line using tr, analyzes word lengths using awk, and counts unique words using sort, uniq, and wc.

<h3>Execution steps and demostration</h3>

I first wrote the shell script:
<img width="702" height="562" alt="Screenshot (772)" src="https://github.com/user-attachments/assets/723f2e20-5b1d-40fb-9d58-045b1e4e3603" />

Then I created the input.txt file:
<img width="711" height="545" alt="Screenshot (775)" src="https://github.com/user-attachments/assets/e78ab3a1-b353-463b-b4ed-b34ecd114042" />

And finally, used the command chmod to give permission to execute the shell script and executed it using ./metrics.sh input.txt
<img width="850" height="640" alt="Screenshot (774)" src="https://github.com/user-attachments/assets/8abfcffa-c62f-47a7-a22e-6c9d9e9dde52" />

The output gave the longest word, the shortest word, average word length, and total unique words. The shell script worked!
