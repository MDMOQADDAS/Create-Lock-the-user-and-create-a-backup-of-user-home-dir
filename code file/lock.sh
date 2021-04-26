#!/usr/bin/bash

ts=$(date +%F)

while :
do

read -p "Enter user name to lock and create backup : " user

if [ -z $user ]
then
	echo "user name is not provided"
else
	if id $user &> /dev/null 
	then
		passwd -l $user
		homeDir=$(grep ^user1:  /etc/passwd | cut -d ":" -f 6)
		echo $homeDir
                if [ -d $homeDir ]
		then
			echo "home dir existed.."
			tar -cf ${user}-${ts}.tar $homeDir -P
		fi
		exit 0
	else
		echo "provided user not exist.."
	fi
fi
done
exit 1
