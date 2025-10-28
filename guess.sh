#!/bin/bash

# This script gives the user five tries to guess a secret number 1-10 (inclusive). 
#/.guess.sh <GUESS_NUMBER_1-10>

tries=5
secretnum=$(( (RANDOM % 10) + 1 ))
guess=$1



for num in $(seq 1 $tries); do
        read -p "Guess the secret number (1-10):" guess

        if ((guess == secretnum)); then
                echo "Congrats! You guessed the secret number!"
                exit 0
        elif ((guess < secretnum)); then
                echo "your guess is too low..."
        else
                echo "your guess is too high.."
        fi
done

echo "You've used all your tries! The secret number was $secretnum."
