#!/bin/bash

# This script gives the user five tries to guess a secret number 1-10 (inclusive). 
#/.guess.sh <GUESS_NUMBER_1-10>


secretnum=$(( (RANDOM % 10) + 1 ))
guess=$1


echo $secretnum
echo $guess


for num in {1..5}; do
        read -p "Guess the secret number:" guess
