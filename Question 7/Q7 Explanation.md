<h1>Answer 7 Explanation</h1>
Question 7 folder contains the shell script "patterns.sh" and the text file "lyrics.txt" I created to demonstrate this assignment question. I've also copied and pasted the mixed.txt file that was created after I executed the shell script, since it was too long to capture on screenshot.

<h3>The shell script command explanation</h3>
1 <code>words=$(tr -cs 'a-zA-Z' '\n' < "$1" | tr 'A-Z' 'a-z')</code>

It splits text into one word per line and translates all the capital letters into small letters.

2 <code>echo "$words" | grep -E '^[aeiou]+$' > vowels.txt</code>

Finds words containing only vowels and stores it into vowels.txt

3 <code>echo "$words" | grep -E '^[^aeiou]+$' > consonants.txt</code>

Finds words that do not contain vowels, and stores it into consonants.txt

<code>[^aeiou]</code> means anything except vowels, which means it includes only consonants.

4 <code>echo "$words" | grep -E '^[^aeiou][a-z]*[aeiou][a-z]*$' > mixed.txt</code>

This line of script ensures the first letter is a consonant and there's at least one vowel.

<h3>Execution steps and demonstration</h3>
I first wrote the shell script and then I created the lyrics.txt file for demosntrating the shell script.
<img width="681" height="540" alt="Screenshot (776)" src="https://github.com/user-attachments/assets/a7eebae0-f0e0-4d0d-a0b4-5d3a25b4b8f3" />

I then used the command chmod and gave permission to run the script. After running the script, all three of the text files get created.
<img width="1920" height="1019" alt="Screenshot (782)" src="https://github.com/user-attachments/assets/6c966627-7e7b-4bef-b0d8-ac4e6a54e791" />
