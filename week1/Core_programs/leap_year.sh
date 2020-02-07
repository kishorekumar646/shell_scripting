#!/bin/bash

read -p "Enter the year : " year
if [ $(($year % 4)) -eq 0 ]
then
	if [ $(($year % 100)) -eq 0 ]
	then
		if [ `expr $year % 400` -eq 0 ]
		then
			echo "$year is leap year"
		else
			echo "$year is not leap year"
		fi
	else
		echo "$year is leap year"
	fi
else
	echo "$year is not leap year"
fi