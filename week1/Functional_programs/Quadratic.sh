#!/bin/bash

<<comment
	
	find the roots of the equation a*x*x + b*x + c. 
	
	delta = b*b - 4*a*c
	Root 1 of x = (-b + sqrt(delta))/(2*a)
	Root 2 of x = (-b - sqrt(delta))/(2*a)

comment

quadratice_equation()
{
	delta=$(echo "scale=3; $((b**2 - 4*a*c))" | bc -l)
	echo "$delta"

	root1=$(echo "$((-b + $(echo "scale=3;sqrt ( $((delta / 2 * a)) )" |bc -l )))" | bc -l)
	echo "$root1"

	root2=$(echo "$((-b - $(echo "scale=3;sqrt ( $((delta / 2 * a)) )" |bc -l )))" | bc -l)
	echo "$root2"
}

read -p "Enter a : " a
read -p "Enter b : " b
read -p "Enter c : " c

quadratice_equation $a $b $c