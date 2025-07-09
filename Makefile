LOCAL_BIN_PATH := ${HOME}/.local/bin
SCRIPTS_PATH := ./scripts

set-custom-scritps:
	if  [ ! -d ${LOCAL_BIN_PATH} ]; then \
		mkdir ${LOCAL_BIN_PATH}; \
	fi
	for bin in ${SCRIPTS_PATH}/*; do \
		echo "setting $${bin} to ${LOCAL_BIN_PATH}"; \
		chmod 755 $${bin} && cp $${bin} ${LOCAL_BIN_PATH}/${bin}; \
	done
	echo "Done!"
