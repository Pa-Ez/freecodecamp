#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Function to insert unique team
insert_team() {
  # Check if the team already exists in the teams table
  exists=$($PSQL "SELECT COUNT(*) FROM teams WHERE name = '$1';")
  
  # If the team does not exist, insert it
  if [[ $exists -eq 0 ]]
  then
    insert_result=$($PSQL "INSERT INTO teams (name) VALUES ('$1');")
    echo "Inserted team: $1"
  fi
}

# Read from the CSV file and insert unique teams
while IFS=, read -r year round winner opponent winner_goals opponent_goals
do
  # Skip the header line
  if [[ $year != "year" ]]; then
    insert_team "$winner"
    insert_team "$opponent"
  fi
done < games.csv

# Insert game data here if needed
# You might need to query the team IDs based on the team names to insert the game data correctly.

echo "Finished processing teams."


# Function to get team ID by name
get_team_id() {
    # $1 is the team name passed to this function
    echo $($PSQL "SELECT team_id FROM teams WHERE name = '$1';")
}

# Read from the CSV file and insert game data
while IFS=, read -r year round winner opponent winner_goals opponent_goals
do
  # Skip the header line
  if [[ $year != "year" ]]; then
    # Get the IDs for the winner and opponent teams
    winner_id=$(get_team_id "$winner")
    opponent_id=$(get_team_id "$opponent")

    # Insert the game data into the games table
    insert_result=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ('$year', '$round', $winner_id, $opponent_id, $winner_goals, $opponent_goals);")
    echo "Inserted game: $year, $round, $winner vs $opponent, Score: $winner_goals - $opponent_goals"
  fi
done < games.csv