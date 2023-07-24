#!/bin/bash
input=“./names.txt”  # This line directs the following to be places in the text file 
while IFS=, read -r first last;      # notice the comma after the equal sign 
  do
name="$first $last" # this states the name of the users listed by first and last name
username="${first:0:1}$last" # This states the username will be created with the first letter of their first name and their last name
 n=`egrep –c $username /etc/passwd` # This is bold qouting via egrep the user name created above and placed in /etc/passwd
 n=$((n+1)) # skip n files and print
 username=$username$n # the username is current username
useradd -m $username -s /bin/bash # create a user home directory as well as set user login shell
done < "$input" # Ends the loop and finish input into previously defined file
 tail /etc/passwd # displays the last entries for the file /etc/passwd
