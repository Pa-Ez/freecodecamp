#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Check if at least one argument is provided
if [ $# -gt 0 ]; then
  if $($PSQL "SELECT EXISTS(select 1 from elements where atomic_number::text='$1');" | grep -q "t"); then
    ATOMIC_NUMBER=$1
  elif $($PSQL "SELECT EXISTS(select 1 from elements where name=INITCAP('$1'));" | grep -q "t"); then
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name=INITCAP('$1');" | xargs)
  elif $($PSQL "SELECT EXISTS(select 1 from elements where symbol=INITCAP('$1'));" | grep -q "t"); then
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol=INITCAP('$1');" | xargs)
  else
    echo "I could not find that element in the database."
    exit
  fi
  NAME=$($PSQL "select name from elements where atomic_number=$ATOMIC_NUMBER;" | xargs)
  SYMBOL=$($PSQL "select symbol from elements where atomic_number=$ATOMIC_NUMBER;" | xargs)
  TYPE=$($PSQL "select type from types where type_id=(select type_id from properties where atomic_number=$ATOMIC_NUMBER);" | xargs)
  MASS=$($PSQL "select atomic_mass from properties where atomic_number=$ATOMIC_NUMBER;" | xargs)
  MELTING=$($PSQL "select melting_point_celsius from properties where atomic_number=$ATOMIC_NUMBER;" | xargs)
  BOILING=$($PSQL "select boiling_point_celsius from properties where atomic_number=$ATOMIC_NUMBER;" | xargs)
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
else
  echo "Please provide an element as an argument."
fi
