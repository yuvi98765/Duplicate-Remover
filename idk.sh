#!/bin/bash
read -p "Hello write your username: " username
echo "Hello, $username!"
echo "This is a game with a mix of many mini-games. Which would you like to play?"
echo "1) Number Guessing Game"
echo "2) Rock Paper Scissors"
echo "3) Word Guessing Game"
read -p "Please choose a game (1-3): " choice

if [ "$choice" -eq 1 ]; then 
    echo "Welcome to the game where you guess the number I am thinking of!"
    random_number=$((RANDOM % 100 + 1))
    guess=0

    while [ "$guess" -ne "$random_number" ]; do
        read -p "Guess a number between 1 and 100: " guess
        if [ "$guess" -gt "$random_number" ]; then 
            echo "Too high! Try again."
        elif [ "$guess" -lt "$random_number" ]; then 
            echo "Too low! Try again."
        fi  
    done  

    echo "Congratulations! You've guessed the number!"

elif [ "$choice" -eq 2 ]; then
    echo "Lets play rock paper scissors."
    while true; do  
        read -p "Enter Your Choice Rock(1) Paper(2) Scissors(3): " user_choice
        random_number=$((RANDOM % 3 + 1))
        
        if [ "$user_choice" -eq "$random_number" ]; then
            read -p "It's a tie! Enter Your Choice Rock(1) Paper(2) Scissors(3): " user_choice  
        elif [[ "$user_choice" -eq 1 && "$random_number" -eq 3 || 
                "$user_choice" -eq 2 && "$random_number" -eq 1 || 
                "$user_choice" -eq 3 && "$random_number" -eq 2 ]]; then
            echo "You Won"
            break  
        else 
            echo "You Lose"
            break  
        fi  
    done 

elif [ "$choice" -eq 3 ]; then
    echo "Let's play a color choosing game."
    while true; do  
        read -p "Enter Your Choice Red(1) Orange(2) Yellow(3) Green(4) Blue(5) Indigo(6) Violet(7): " user_choice
        random_number=$((RANDOM % 7 + 1))
        
        if [ "$user_choice" -eq "$random_number" ]; then
            echo "You Won!"
            break
        else
            echo "You Lose! Try Again."
        fi
    done
else
    echo 
fi   