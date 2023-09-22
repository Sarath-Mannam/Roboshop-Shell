#/bin/bash

# creating an Array
NAMES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")

# to loop through the array is, now we will get all these names into this for loop
for i  in "${NAMES[@]}" 
do
   echo "NAME: $i" 
done