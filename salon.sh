#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~Welcome to the Salon!~~~\n"
MAIN_MENU(){
  if [[ $1 ]]
  then
  echo -e "\n$1"
  fi
  SERVICE_INFO=$($PSQL "select service_id,name from services")
  echo "$SERVICE_INFO" | while read SERVICE_ID BAR NAME
  do
  echo "$SERVICE_ID) $NAME"
  done
  read SERVICE_ID_SELECTED
  SERVICE_ID_SELECTED_RESULT=$($PSQL "select service_id from services where service_id=$SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_ID_SELECTED_RESULT ]]
  then
  MAIN_MENU "I could not find that service. What would you like today?"
  else
    echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
  SERVICE_NAME=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED")
  if [[ -z $CUSTOMER_ID ]]
  then
  echo -e "\nI don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  CUSTOMER_NAME_RESULT=$($PSQL "insert into customers(phone,name) values('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
  fi
  CUSTOMER_NAME=$($PSQL "select name from customers where customer_id=$CUSTOMER_ID")
  echo -e "\nWhat time would you like your $(echo $SERVICE_NAME | sed -E 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g')"
  read SERVICE_TIME
  APPOINTMENT_RESULT=$($PSQL "insert into appointments(customer_id,service_id,time) values($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
  echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -E 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g')."
  fi
}
MAIN_MENU "Today's offers"
