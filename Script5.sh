#!/bin/bash
input=“./names.txt”  # This line directs the following to be places in the text file 
while IFS=, read -r first last;      # notice the comma after the equal sign 
  do
name="$first $last" # this states the user name by first and last name
username="${first:0:1}$last” 
 n=`egrep –c $username /etc/passwd` 
 n=$((n+1))
 username=$username$n
useradd -m $username -s /bin/bash
done < "$input"
 tail /etc/passwd
