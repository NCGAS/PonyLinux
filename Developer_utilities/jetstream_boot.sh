#!/bin/bash

declare -a names=(shadowfax epona bojack secretariat starlite spirit ponyella flicka mr_ed maximus)

p=learnBash
groupadd ponies

perl -p -i -e 's/AllowGroups.+$/AllowGroups users root ponies/g' /etc/ssh/sshd_config
adduser --disabled-login --ingroup ponies --shell /usr/sbin/nologin --gecos "" applejack
adduser --disabled-login --ingroup ponies --shell /usr/sbin/nologin --gecos "" pinkiepie
adduser --disabled-login --ingroup ponies --shell /usr/sbin/nologin --gecos "" rdash

chmod 777 /home/applejack
chmod 777 /home/pinkiepie
chmod 777 /home/rdash

for i in "${names[@]}"
do
#check if user exists
if grep -q $i /etc/passwd;
	then : ;
	else adduser --disabled-password --gecos "" --ingroup ponies $i ;
	     echo "$i:$p" | chpasswd ;
fi

#check if user home exists
if [ -d /home/$i ]; then : ; else mkdir -p /home/$i; fi

#force home owned by user and not root
chown $i /home/$i

#check if user home has correct permissions
if [ -r /home/$i ] && [ -w /home/$i ] && [ -x /home/$i ]; then : ; else chmod 755 /home/$i; fi

done

sudo systemctl restart sshd
