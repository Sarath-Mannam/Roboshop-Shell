#/bin/bash

# creating an Array
NAMES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")
INSTANCE_TYPE=""
Image_ID=ami-03265a0778a880afb
SECURITY_GROUP_ID=sg-0a92292ce4af7fec5

# For mysql & mongodb instance_type should be t3.medium, for all others t2.micro. So this is the condition we should check. 
# to loop through the array is, now we will get all these names into this for loop
for i  in "${NAMES[@]}" 
do
   if [ [ $i == "mongodb" || $i == "mysql" ] ];
   then 
        INSTANCE_TYPE="t3.medium"
   else
        INSTANCE_TYPE="t2.micro"
   fi        
   echo "creating $i instance"
   aws ec2 run-instances --image-id $Image_ID --count 1 --instance-type $INSTANCE_TYPE --security-group-ids $SECURITY_GROUP_ID --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=demo-$i}]"
done