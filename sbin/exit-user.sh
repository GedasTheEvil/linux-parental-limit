#!/bin/bash

killall -u "${1}"
sleep 5
killall -u "${1}" -s 16
