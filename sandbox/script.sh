#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
sudo service nginx start
for I in {1..10}
do
echo "The value of I is $I"
sleep 1
done
