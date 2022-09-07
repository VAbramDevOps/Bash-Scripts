#!/bin/bash

function autologinConfig() {
    echo "[SeatDefaults]" >> /etc/lightdm/lightdm.conf
    echo "autologin-user=$username" >> /etc/lightdm/lightdm.conf
    echo "autologin-user-timeout=0" >> /etc/lightdm/lightdm.conf
    echo "user-session=Xubuntu" >> /etc/lightdm/lightdm.conf
    echo "greeter-session=lightdm-gtk-greeter" >> /etc/lightdm/lightdm.conf
}

cd /etc/lightdm

read -r -p "Enter username for autologin: " username

grep $username /etc/passwd >/dev/null
if [ $? -ne 0 ]; then
    echo 'ATTENTION: No username found!'
else 
    if [[ ! -f lightdm.conf ]]; then
        touch lightdm.conf
        autologinConfig;
    else
        echo -n > lightdm.conf
        autologinConfig;
    fi
    echo "AUTOLOGIN FOR USER: $ursername SUCCESSFULLY SET UP"
fi

