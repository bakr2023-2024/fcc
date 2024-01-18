#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
if [[ ! $1 ]]
then
echo "Please provide an element as an argument."
else
if [[ $1 =~ ^[0-9]+$ ]]
then
RESULT=$($PSQL "select atomic_number,name,symbol,type,atomic_mass,melting_point_celsius,boiling_point_celsius from elements full join properties using(atomic_number) full join types using(type_id) where atomic_number=$1")
elif [[ $1 =~ ^[A-Z][a-z]?$ ]]
then
RESULT=$($PSQL "select atomic_number,name,symbol,type,atomic_mass,melting_point_celsius,boiling_point_celsius from elements full join properties using(atomic_number) full join types using(type_id) where symbol='$1'")
else
RESULT=$($PSQL "select atomic_number,name,symbol,type,atomic_mass,melting_point_celsius,boiling_point_celsius from elements full join properties using(atomic_number) full join types using(type_id) where name='$1'")
fi
if [[ -z $RESULT ]]
then
echo "I could not find that element in the database."
else
echo "$RESULT" | while IFS="|" read NUM NAME SY TYPE MASS MP BP
do
echo "The element with atomic number $NUM is $NAME ($SY). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MP celsius and a boiling point of $BP celsius."
done
fi
fi
