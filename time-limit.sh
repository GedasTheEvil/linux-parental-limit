#!/bin/bash

CONFIG_PATH="/etc/security/time.conf"
USER=$(whoami)

YES="yes";
NO="no";
LESS_TAN_15_MINUTES="less-15";
BIN_DIR=$(dirname "$0")

## TEST DATA START
#CONFIG_PATH="./security/time.conf"
#USER="laurynas"
## TEST DATA END

MY_TIME=$(grep -vi "^#" "${CONFIG_PATH}"| grep "${USER}")
HAS_TIME=$(php "${BIN_DIR}/has-time.php" "${MY_TIME}")

if [[ "${HAS_TIME}" == "${YES}" ]]; then
  exit 0
fi

if [[ "${HAS_TIME}" == "${LESS_TAN_15_MINUTES}" ]]; then
  "${BIN_DIR}/notify-user.sh" "Liko mažiau nei 15 minučių. Po to programos išsijungs be įspėjimo"
fi

if [[ "${HAS_TIME}" == "${NO}" ]]; then
  "${BIN_DIR}/exit-user.sh" "${USER}"
fi
