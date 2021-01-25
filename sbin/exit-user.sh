#!/bin/bash

echo killall -u "${1}"
sleep 5
echo killall -u "${1}" -s 16
