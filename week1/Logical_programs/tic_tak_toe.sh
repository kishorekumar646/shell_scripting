#!/bin/bash

<<comment

	Write a Program to play a Cross Game or Tic-Tac-Toe Game. 
	Player 1 and the Player 2 is the user. 
	Player 1 and Player 2 to take Cell that is the Column and Row. 

comment

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

display_winner()
{
	if [[ $X -eq 1 ]]; then
		if [[ $(( ${board[0,0]} + ${board[0,1]} + ${board[0,2]} )) -eq `expr 1 \* 3` ||
				$((${board[1,0]} +  ${board[1,1]} + ${board[1,2]})) -eq `expr 1 \* 3` ||
				$((${board[2,0]} +  ${board[2,1]} + ${board[2,2]})) -eq `expr 1 \* 3` ||
				$((${board[0,0]} +  ${board[1,0]} + ${board[2,0]})) -eq `expr 1 \* 3` ||
				$((${board[0,1]} +  ${board[1,1]} + ${board[2,1]})) -eq `expr 1 \* 3` ||
				$((${board[0,2]} +  ${board[1,2]} + ${board[2,2]})) -eq `expr 1 \* 3` ||
				$((${board[0,0]} +  ${board[1,1]} + ${board[2,2]})) -eq `expr 1 \* 3` ||
				$((${board[2,0]} +  ${board[1,1]} + ${board[0,2]})) -eq `expr 1 \* 3`
			 ]]; then
			echo "X WINNER"
			true=0
			return
		fi
	fi
	if [[ $O -eq -1 ]]; then
		if [[ $(( ${board[0,0]} + ${board[0,1]} + ${board[0,2]} )) -eq `expr -1 \* 3` ||
				$((${board[1,0]} +  ${board[1,1]} + ${board[1,2]})) -eq `expr -1 \* 3` ||
				$((${board[2,0]} +  ${board[2,1]} + ${board[2,2]})) -eq `expr -1 \* 3` ||
				$((${board[0,0]} +  ${board[1,0]} + ${board[2,0]})) -eq `expr -1 \* 3` ||
				$((${board[0,1]} +  ${board[1,1]} + ${board[2,1]})) -eq `expr -1 \* 3` ||
				$((${board[0,2]} +  ${board[1,2]} + ${board[2,2]})) -eq `expr -1 \* 3` ||
				$((${board[0,0]} +  ${board[1,1]} + ${board[2,2]})) -eq `expr -1 \* 3` ||
				$((${board[2,0]} +  ${board[1,1]} + ${board[0,2]})) -eq `expr -1 \* 3`
			]]; then
			echo "O WINNER"
			true=0
			return
		fi
	fi
	if [[ $X -eq 1 || $O -eq -1 ]]; then
		if [[ $true -eq 0 ]]; then
			echo "XO DRAW"
			return
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
	display_board $board $EMPTY $true
	echo -e "\n_____________________\n"
	display_winner $X $O $board $true
done