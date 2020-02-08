#!/bin/bash

find_triplets()
{
	found=0
	for (( i = 0; i < ${#array[*]} - 2 ; i++ )); do
		for (( j = i + 1; j < ${#array[*]} - 1; j++ )); do
			for (( k = j + 1; k < ${#array[*]}; k++ )); do
				if [[ $(( ${array[i]} + ${array[j]} + ${array[k]} )) -eq 0 ]]; then
					echo "${array[i]} ${array[j]}  ${array[k]}"
					found=1
				fi
			done
		done
	done
	if [[ $found -eq 0 ]]; then
		echo "Not Found"
	fi
}

read -p "Enter array size : " size
declare -a array
for (( i = 0; i < size; i++ )); do
	read number
	array[$i]="$number"
done
#echo $(( ${array[1]} + ${array[2]} )) #adding array elements
#echo "${#array[*]}" #find size of array

find_triplets $array