#!/bin/bash

cd /etc/lightdm/
touch lightdm.conf

read -r -p "Enter username for autologin: " username

grep $username /etc/passwd >/dev/null
if [ $? -ne 0 ]; then
echo 'No username found!'
else 
echo "[SeatDefaults]" >> /etc/lightdm/lightdm.conf
echo "autologin-user=$username" >> /etc/lightdm/lightdm.conf
echo "autologin-user-timeout=0" >> /etc/lightdm/lightdm.conf
echo "user-session=Xubuntu" >> /etc/lightdm/lightdm.conf
echo "greeter-session=lightdm-gtk-greeter" >> /etc/lightdm/lightdm.conf

echo "AUTOLOGIN FOR USER: $ursername SUCCESSFULLY SET UP"
fi

