#!/bin/bash
#Code by Claire Neumann

# This script gives the user five attempts to guess a secret number 1-10 (inclusive). 
#/.guess.sh <GUESS_NUMBER_1-10>

# A variable for number of tries is made so that it can be easily changed and the script can adapt.
tries=5

# I used a google search to get more information on the variable RANDOM and how to manipulate that to generate a random number in the range 1-10. 
secretnum=$(( (RANDOM % 10) + 1 ))

# We initialize the number of attempts at one.
attempts=1

# A for loop iterates according to the number of tries defined aboce.
for num in $(seq 1 $tries); do
        
	# This script can function whether or not a command line argument is given.
	# If a command line argument was given, the script treats that number as the first attempt.
	if (( num ==1 )) && [[ $1 ]]; then
		guess=$1
	
	# If a command line argument was not given, the script asks for a guess.
	# I used a google search to look up how to ask the user for additional input and found the read command.
	else
		read -p "Guess the secret number (1-10):" guess
	fi

	# Once a guess is established, the script ensures that the guess is a digit and also in the range 1-10.
	if ! [[ "$guess" =~ ^[0-9]+$ ]] || (( guess < 1 || guess > 10 )); then
        	echo "Please enter a valid number between 1 and 10."
        	continue
    	fi


	# Final conditional statements print output based on the comparison of the guess to the secret number. 
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

# If all of the tries are used without guessing the secret number, the script leaves the for loop for its final output.
echo "You've used all your attempts! The secret number was $secretnum."
