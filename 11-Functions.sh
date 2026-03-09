#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run this script with root user access"
    exit 1
fi

validate(){

if [ $1 -ne 0 ]; then
    echo "$2 ... FAILURE"
    exit 1
else
    echo "$2 ... SUCCESS"
fi
}

dnf install nginx -y
Validate $? "installing nginx"

dnf install mysql -y
Validate $? "installing mysql"

dnf install nodejs -y
Validate $? "installing nodejs"

