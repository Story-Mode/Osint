#!/bin/bash
while read first last; # while is a looping command that repeats until a condition is met this case read first and last
do # this is a executing a command that is ready to capture an output
name= "$first $last" # The first capture output is the name which is populated by the first and last category
username="$last${first:0:1}" # this creates a user name with a Last name and the first initial of the first name
n=`egrep –c $username /etc/passwd` # this uses egrep and shows bold the username created and places them in the /etc/passwd file
n=$((n+1)) # this skips the n files and prints the previous command
username=$username$n # this shows the username as the current username
useradd -m $username # this adds a home directory for the user recently created
password=`tr -cd '[:alpha:]' < /dev/random | head -c8` # remove all non-printable characters from a file whose contents are 
  # redirected into /dev/random which is piped to the top 8 lines printed to screen
  # notice difference between the ` and ‘ characters in the line above 
echo $password | passwd --stdin $username # this echos the previously chosen password and displays it to standard 
  # input as well as the chosen user name
echo "$username $password" >> /root/tempPasswords # this displays the user name and password and places it in the /root file shown
done # this completes the loop
