#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

random_number=$((RANDOM % 1000 + 1))

echo "Enter your username:"
read username

if $($PSQL "SELECT EXISTS(SELECT * FROM users WHERE username = '$username');" | grep -q 't'); then
  user_id=$($PSQL "select user_id from users where username='$username';")
  games_played=$($PSQL "select count(*) from games where user_id=$user_id;")
  best_game=$($PSQL "select min(result) from games where user_id=$user_id;")
  echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
else
  echo "Welcome, $username! It looks like this is your first time here."
  insert=$($PSQL "insert into users (username) values ('$username');")
  user_id=$($PSQL "select user_id from users where username='$username';")
fi

result=0
echo "Guess the secret number between 1 and 1000:"
read guessed_number
while true; do
  if ! [[ "$guessed_number" =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    read guessed_number
  fi
  if [[ $guessed_number -lt $random_number ]]; then
    echo "It's higher than that, guess again:"
    ((result++))
    read guessed_number
  elif [[ $guessed_number -gt $random_number ]]; then
    echo "It's lower than that, guess again:"
    ((result++))
    read guessed_number
  elif [[ $guessed_number -eq $random_number ]]; then
    ((result++))
    echo "You guessed it in $result tries. The secret number was $random_number. Nice job!"
    insert=$($PSQL "insert into games (user_id,guessed_number,result) values ($user_id,$random_number,$result);")
    break

  fi
done
