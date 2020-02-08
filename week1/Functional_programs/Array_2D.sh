#!/bin/bash

declare -A array
echo "Matrix mxn"
read -p "Enter size of m : " rows
read -p "Enter size of n : " colmns

for (( i = 0; i < rows; i++ )); do
	for (( j = 0; j < colmns; j++ )); do
		read number
		array[$i,$j]="$number"
	done
done
for (( a = 0; a < rows; a++ )); do
	for (( b = 0; b < colmns; b++ )); do
		echo -n "${array[$a,$b]} "
	done
	echo
done