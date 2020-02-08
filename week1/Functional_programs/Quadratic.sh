#!/bin/bash

quadratice_equation()
{
	delta=$(echo "scale=3; $((b**2 - 4*a*c))" | bc -l)
	echo "$delta"

	root1=$(echo "$((-b + $(echo "scale=3;sqrt ( $((delta / 2 * a)) )" |bc -l )))" | bc -l)
	echo "$root1"
}

read -p "Enter a : " a
read -p "Enter b : " b
read -p "Enter c : " c

quadratice_equation $a $b $c