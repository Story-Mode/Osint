#!/bin/bash
input=“./names.txt”  # this shows where to place the following commands  
while IFS=, read -r first last; # notice the comma after the equal sign
 do # This initializes 
name="$first $last" # This showes users by first name and then last name
username="${first:0:1}$last" # This presents the usernames with their first initial and last name
useradd -m $username -s /bin/bash # this adds a user with a home and shell login
 done < "$input" # this finishes the input to the text file.
tail -8 /etc/passwd # This lists the last 8 bottom entries in the passwd file
