#!/bin/bash

user="Hello <<UserName>>, How are you?"
read -p "Enter your name : " user_name
echo "${user/<<UserName>>/$user_name}"
