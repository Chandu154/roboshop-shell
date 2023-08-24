#!/bin/bash
NAMES=("mongodb" "rdis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")

#if mongodb or mysql instanec type should be t3.micro ,for all others t2.micro
INSTANCE_TYPE=""
IMAGE_ID="ami-03265a0778a880afb"
SECURITY_GROUP_ID="sg-076d950dcb72cc617"

for i in "${NAMES[@]}"
do
 if [[$i == "mongodb" || $i == "mysql"]]
  then 
   INSTANCE_TYPE="t3.medium"
  else
   INSTANCE_TYPE="t2.micro"
 fi  
echo "creating $i instance"
aws ec2 run-instances --image-id $IMAGE_ID  --instance-type $INSTANCE_TYPE  --security-group-ids $SECURITY_GROUP_ID --tag-specifications"ResourceType=instance,Tags=[{Key=Name,Value=$i}]"