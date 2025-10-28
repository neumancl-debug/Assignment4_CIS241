#!/bin/bash

# This script gives the user five tries to guess a secret number 1-10 (inclusive). 
#/.guess.sh <GUESS_NUMBER_1-10>

tries=5
secretnum=$(( (RANDOM % 10) + 1 ))
attempts=1

for num in $(seq 1 $tries); do
        
	if (( num ==1 )) && [[ $1 ]]; then
		guess=$1
	else
		read -p "Guess the secret number (1-10):" guess
	fi

	if ! [[ "$guess" =~ ^[0-9]+$ ]] || (( guess < 1 || guess > 10 )); then
        	echo "Please enter a valid number between 1 and 10."
        	continue
    	fi


        if ((guess == secretnum)); then
                echo "Congrats! You guessed the secret number! You used $attempts attempts!"
                exit 0
        elif ((guess < secretnum)); then
                echo "your guess is too low..."
        else
                echo "your guess is too high.."
        fi
	attempts=$((attempts + 1))
done

echo "You've used all your attempts! The secret number was $secretnum."
