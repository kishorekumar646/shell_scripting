#!/bin/bash

read -p "Enter the number : " number

while [[ $((number % 2)) -eq 0 ]]; do
	echo -e "2"
	number=$((number / 2))
done

for (( iterator = 3; iterator <=$(echo "sqrt ( $number )" | bc) ; iterator = iterator + 2)); do
	while [[ $((number % iterator)) -eq 0 ]]; do
		echo -e "$iterator"
		number=$((number / iterator))
	done
done

if [[ $number -gt 2 ]]; then
	echo "$number"
fi