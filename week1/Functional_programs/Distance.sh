#!/bin/bash

read -p "Value of x : " x
read -p "Value of y : " y


c=$(echo "scale=3;sqrt ( $((x ** 2 + y ** 2)) )" | bc -l)

echo "$c"