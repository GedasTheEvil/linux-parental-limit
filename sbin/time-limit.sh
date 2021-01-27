#!/bin/bash

YES="yes";
NO="no";
LESS_TAN_15_MINUTES="less-15";

CONFIG_PATH="/etc/security/time.conf"
USER="${1}"

if [[ "${USER}" == "" ]]; then
  USER=$(whoami)
fi

BIN_DIR=$(dirname "$0")

## TEST DATA START
#CONFIG_PATH="./security/time.conf"
## TEST DATA END

MY_TIME=$(grep -vi "^#" "${CONFIG_PATH}"| grep "${USER}")
HAS_TIME=$(php7 "${BIN_DIR}/has-time.php" "${MY_TIME}")

if [[ "${HAS_TIME}" == "${YES}" ]]; then
  exit 0
fi

if [[ "${HAS_TIME}" == "${LESS_TAN_15_MINUTES}" ]]; then
  "${BIN_DIR}/notify-user.sh" ${USER} "Liko mažiau nei 15 minučių. Po to programos išsijungs be įspėjimo"
fi

if [[ "${HAS_TIME}" == "${NO}" ]]; then
  "${BIN_DIR}/exit-user.sh" "${USER}"
fi
