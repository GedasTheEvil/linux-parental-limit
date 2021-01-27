#!/bin/bash

USER=$1
USER_ID=$(id -u ${USER})

echo $2
sudo -u ${USER} DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/${USER_ID}/bus notify-send $2 --icon=system-log-out
