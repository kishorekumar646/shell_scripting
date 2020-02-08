#!/bin/bash

read -p "Enter the number : " number

while [[ $((number % 2)) -eq 0 ]]; do
	echo -e "2"
	number=$((number / 2))
done

for (( i = 3; i <=$(echo "sqrt ( $number )" | bc) ; i = i + 2)); do
	while [[ $((number % i)) -eq 0 ]]; do
		echo -e "$i"
		number=$((number / i))
	done
done

if [[ $number -gt 2 ]]; then
	echo "$number"
fi