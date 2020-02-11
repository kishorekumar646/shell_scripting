#!/bin/bash

<<comment
	susing this formula
	calculate distance = sqrt(x*x + y*y)
comment

distance()
{
	distance_value=$(echo "scale=3;sqrt ( $((x_axis ** 2 + y_axis ** 2)) )" | bc -l)
	echo "$distance_value"
}

read -p "Value of x : " x_axis
read -p "Value of y : " y_axis

distance $x_axis $y_axis