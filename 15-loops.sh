#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/logs/shell-script"
LOG_FILE="/var/logs/shell-script/$0.log"

if [ $USERID -ne 0 ]; then
    echo "Please run this script with root user access"| tee -a $LOG_FILE
    exit 1
fi

mkdir -p $LOGS_FOLDER

Validate(){

if [ $1 -ne 0 ]; then
    echo "$2 ... FAILURE" | tee -a $LOG_FILE
    exit 1
else
    echo "$2 ... SUCCESS"| tee -a $LOG_FILE
fi
}

for package in $@ # sudo sh 14-loops.sh nginx mysql nodejs
do 
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]; then
         echo "$pacakge not installed, installing now"
        dnf install $pacakge -y &>>$LOG_FILE
        Validate $? "$package installation"
    else 
        echo "$package already installed, skipping"
    fi
done