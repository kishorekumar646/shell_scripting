#!/bin/bash

distance()
{
	c=$(echo "scale=3;sqrt ( $((x ** 2 + y ** 2)) )" | bc -l)
	echo "$c"
}

read -p "Value of x : " x
read -p "Value of y : " y

distance $x $y