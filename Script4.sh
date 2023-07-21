#!/bin/bash
input=“./names.txt”  # this creates a text files  
while IFS=, read -r first last; # notice the comma after the equal sign
 do # This initializes 
name="$first $last" # This showes users by first name and then last name
username="${first:0:1}$last" # This presents the usernames with their first initial and last name
useradd -m $username -s /bin/bash # this adds a user to
 done < "$input"
tail -8 /etc/passwd
