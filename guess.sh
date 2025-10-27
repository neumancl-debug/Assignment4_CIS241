#!/bin/bash

# This script gives the user five tries to guess a secret number 1-10 (inclusive). 
#/.guess.sh <GUESS_NUMBER_1-10>

tries=5
secretnum=$(( (RANDOM % 10) + 1 ))
guess=$1



for num in $(seq 1 $tries); do
        read -p "Guess the secret number:" guess

	if ![["$guess" =~ [1-10]]]; then
		echo "Please enter a number 1 through 10"
		continue
	
