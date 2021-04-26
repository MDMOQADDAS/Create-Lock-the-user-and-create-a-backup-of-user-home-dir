#!/usr/bin/bash

user=$(cat db.txt)

for i in $user
do
	if id $i &> /dev/null 
	then
		echo $i user already cretaed..
	else
		if useradd $i
		then
			echo "$i user created.."
		else
			echo "$i user creation failed.."
		fi
	fi

done

