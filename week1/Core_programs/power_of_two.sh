#!/bin/bash

read -p 'Enter the number : ' number
for (( i = 0; i < $number; i++ )); 
do
  echo "2 power of $i : "$((2 ** $i))
done