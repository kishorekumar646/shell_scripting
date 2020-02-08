#!/bin/bash

read -p "Enter array size : " size
declare -a array
for (( i = 0; i < size; i++ )); do
	read number
	array[$i]="$number"
done
echo "${array[*]}"