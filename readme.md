# Minimal parental control
Notifies 15 minutes before time is up. Kills all apps when time is up

## Installation

1. `make install` as root
2. crontab -e 
```
*/2 * * * * time-limit.sh <username>
```
