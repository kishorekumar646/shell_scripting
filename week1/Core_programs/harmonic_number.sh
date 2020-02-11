#!/bin/bash

<<comment
	sum of harmonic number
comment

read -p "Enter the number : " numbers
harmonic_sum=1
for (( number = 2; number <= $numbers; number++ ))
do
	sum=$(echo "$harmonic_sum" "$number" | awk '{print $1 + (1/$2)}')
	echo "$sum"
done