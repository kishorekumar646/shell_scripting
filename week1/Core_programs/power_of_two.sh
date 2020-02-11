#!/bin/bash

<<comment
	power of 2 table
comment

read -p 'Enter the number : ' numbers
for (( number = 0; number < $numbers; number++ )); 
do
  echo "2 power of $number : "$((2 ** $number))
done