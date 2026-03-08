#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run this script with root user access"
    exit 1
fi

Validate(){

if [ $1 -ne 0 ]; then
    echo "$2 ... FAILURE"
    exit 1
else
    echo "$2 ... SUCCESS"
fi
}


dnf install nginx -y
validate $? "installing nginx"



dnf install mysql -y
validate $? "installing mysql"

dnf install nodejs -y
validate $? "installing nodejs"

