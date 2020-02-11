#!/bin/bash

<<comment
	Replace user name in given a string
comment

user="Hello <<UserName>>, How are you?"
read -p "Enter your name : " user_name
echo "${user/<<UserName>>/$user_name}"
