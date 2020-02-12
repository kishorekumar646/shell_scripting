#!/bin/bash
 
echo "teststring" | grep -o . | sort -n |tr -d '\n'
echo
str="teststring"
for (( i = 0; i < ${#str[@]}; i++ )); do 
	echo "${str[$i]}" 
done | sort