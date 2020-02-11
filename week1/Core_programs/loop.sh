#!/bin/bash

<<comment
	print number using while
comment

true=5
while [[ $true -ge 1 ]]; do
	echo "$true"
	true=`expr $true - 1`
done