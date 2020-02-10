#!/bin/bash

insert()
{
	if [[ ($x -lt 0) || ($x -gt 2) || ($y -lt 0) || ($y -gt 2) ]]; then
		echo "Invalid Board Position"
		return
	fi
	if [[ ${board[$x,$y]} -ne $EMPTY ]]; then
		echo "Board position occupied"
		return
	fi

	board[$x,$y]=$player
	player=`expr -1 \* $player`


	
}

display_board()
{
	true=0
	for (( row = 0; row < 3; row++ )); do
		for (( colmn = 0; colmn < 3; colmn++ )); do
			if [[ ${board[$row,$colmn]} -eq 1 ]]; then
				echo -n " X "
			fi
			if [[ ${board[$row,$colmn]} -eq -1 ]]; then
				echo -n " O "
			fi
			if [[ ${board[$row,$colmn]} -eq $EMPTY ]]; then
				echo -n "   "
				true=1
			fi
			if [[ colmn -lt 2 ]]; then
				echo -n "|"
			fi
		done
		if [[ row -lt 2 ]]; then
			echo -e
			echo -e "------------"
		fi
		echo
	done
}

isWin()
{
	winner=
	return $(( $((${board[0,0]} +  ${board[0,1]} + ${board[0,2]})) == `expr $player \* 3` ))
}

display_winner()
{
	if isWin $X $player $board; then
		echo -e "\n X WINNER \n"
		true=0
	elif isWin $O $player $board; then
		echo -e "\n O WINNER \n"
		true=0
	else
		if [[ $true -eq 0 ]]; then
			echo -e "\n XO DRAW \n"
		fi
	fi
}

X=1
O=-1
player=$X
EMPTY=0
declare -A board
for (( i = 0; i < 3; i++ )); do
	for (( j = 0; j < 3; j++ )); do
		board[$i,$j]=0
	done
done
for (( a = 0; a < 3; a++ )); do
	for (( b = 0; b < 3; b++ )); do
		echo -n "${board[$a,$b]} "
	done
	echo
done
true=1	
while [[ $true -eq 1 ]]; do
	
	if [[ $player -eq $X ]]; then
		echo "Player X turn "
	else
		echo "Player O turn"
	fi

	echo "Enter x and y places"
	read -p "x : " x
	read -p "y : " y
	insert $x $y $board $EMPTY $player
	for (( a = 0; a < 3; a++ )); do
		for (( b = 0; b < 3; b++ )); do
			echo -n "${board[$a,$b]} "
		done
		echo
	done
	display_board $board $EMPTY $true
	echo -e "_____________________"
	display_winner $X $O $board $true $player
done