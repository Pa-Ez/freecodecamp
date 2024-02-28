#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

echo "Welcome to the salon, how can I help you with?"
echo "$($PSQL "SELECT service_id||') '|| name FROM services")"


while true; do
  read SERVICE_ID_SELECTED
  if $($PSQL "SELECT EXISTS(SELECT 1 FROM services WHERE service_id = $SERVICE_ID_SELECTED);" | grep -q 't'); then
    echo "What's your telephone number?"
    break
  else
    echo "I could not find that service. What would you like today?"
    echo "$($PSQL "SELECT service_id||') '|| name FROM services")"
  fi
done


read CUSTOMER_PHONE
if $($PSQL "SELECT EXISTS(SELECT 1 FROM customers WHERE phone = '$CUSTOMER_PHONE');" | grep -q 't'); then
  echo "What time would you like your cut, $($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';")? "
  read SERVICE_TIME
else
  echo "I don't have a record for that phone, what's your name?"
  read CUSTOMER_NAME
  $PSQL "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE');"
  echo "What time would you like your cut, $($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';")? "
  read SERVICE_TIME
fi

$PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ((SELECT customer_id from customers WHERE phone='$CUSTOMER_PHONE'),$SERVICE_ID_SELECTED,'$SERVICE_TIME');"

echo "I have put you down for a $($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED';") at $SERVICE_TIME, $CUSTOMER_NAME."