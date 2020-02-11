#!/bin/bash

declare -A array
echo "Matrix mxn"
read -p "Enter size of m : " rows
read -p "Enter size of n : " columns

for (( row = 0; row < rows; row++ )); do
	for (( column = 0; column < columns; column++ )); do
		read number
		array[$row,$column]="$number"
	done
done
for (( row = 0; row < rows; row++ )); do
	for (( column = 0; column < columns; column++ )); do
		echo -n "${array[$row,$column]} "
	done
	echo
done