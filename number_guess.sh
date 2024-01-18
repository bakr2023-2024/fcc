#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=users -t --no-align -c"
echo "Enter your username:"
read USERNAME
USERNAME_RESULT=$($PSQL "select username,games_played,best_game from users where username='$USERNAME'")
if [[ -z $USERNAME_RESULT ]]
then
echo "Welcome, $USERNAME! It looks like this is your first time here."
INSERT_USERNAME_RESULT=$($PSQL "insert into users(username,games_played,best_game) values('$USERNAME',0,0)")
USERNAME_RESULT=$($PSQL "select username,games_played,best_game from users where username='$USERNAME'")
else
echo "$USERNAME_RESULT" | while IFS="|" read NAME GAMES GUESS
do
echo "Welcome back, $NAME! You have played $GAMES games, and your best game took $GUESS guesses."
done
fi
SECRET_NUMBER=$(( 1 + $RANDOM % 1000 ))
echo "Guess the secret number between 1 and 1000:"
GUESS=0
NUMBER_OF_GUESSES=1
while [[ $GUESS -ne $SECRET_NUMBER ]]
read GUESS
if [[ ! $GUESS =~ ^[0-9]+$ ]]
then
echo "That is not an integer, guess again:"
continue
fi
do
if [[ $SECRET_NUMBER -lt $GUESS ]]
then
echo "It's lower than that, guess again:"
elif [[ $SECRET_NUMBER -gt $GUESS ]]
then
echo "It's higher than that, guess again:"
else
break
fi
((NUMBER_OF_GUESSES++))
done
echo "$USERNAME_RESULT" | while IFS="|" read NAME GAMES BEST
do
if [[ $BEST -gt $NUMBER_OF_GUESSES || $BEST -eq 0 ]]
then
BEST=$NUMBER_OF_GUESSES
fi
UPDATE_USER_DATA=$($PSQL "update users set games_played = $((GAMES + 1)), best_game = $BEST where username='$NAME'")
done
echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
