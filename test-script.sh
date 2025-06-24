#!/bin/bash


#Colors for temrinal

#RED
R="\e[31m"                
#GREEN
G="\e[32m"
#YELLOW
Y="\e[33m"
#NORMAL
N="\e[0m"


validation(){
    local url="$1"
    local message="$2"

    status=$(curl -s -o dev/null -w"%{http_code}" "$url")

    if [ "$status" -eq 200 ];
    then 
        echo -e "${G}$message is successful${N}"
    else 
        echo -e "${R}$message has Failed${N}"
    fi
}

echo -e "${Y}Testing Go:Ping${N}" 
validation "http://localhost:8080/service1/ping" "Testing Go:Ping"

echo -e "${Y}Testing Go:Hello${N}" 
validation "http://localhost:8080/service1/hello" "Testing Go:Hello"

echo -e "${Y}Testing Python:Ping${N}" 
validation "http://localhost:8080/service2/ping" "Testing Python:Ping"

echo -e "${Y}Testing Python:Hello${N}" 
validation "http://localhost:8080/service2/hello" "Testing Python:Hello"