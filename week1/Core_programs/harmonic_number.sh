#!/bin/bash

read -p "Enter the number : " number
harmonic_sum=1
for (( i = 2; i <= $number; i++ ))
do
	c=$(echo "$harmonic_sum" "$i" | awk '{print $1 + (1/$2)}')
	echo "$c"
done