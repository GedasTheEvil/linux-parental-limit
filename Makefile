BIN_DIR = /usr/local/bin

install:
	cp sbin/exit-user.sh sbin/has-time.php sbin/notify-user.sh sbin/time-limit.sh ${BIN_DIR}

remove:
	rm ${BIN_DIR}/exit-user.sh ${BIN_DIR}/has-time.php ${BIN_DIR}/notify-user.sh ${BIN_DIR}/time-limit.sh
