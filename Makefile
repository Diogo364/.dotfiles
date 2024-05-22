TILIX_DCONF := /com/gextperts/Tilix/
LOCAL_BIN_PATH := ${HOME}/.local/bin
SCRIPTS_PATH := ./scripts

load-tilix:
	dconf load ${TILIX_DCONF} < ./tilix.dconf

dump-tilix:
	dconf dump /com/gexperts/Tilix/ > ./tilix.dconf

set-custom-scritps:
	for bin in ${SCRIPTS_PATH}/*; do \
		echo "setting $${bin} to ${LOCAL_BIN_PATH}"; \
		chmod 755 $${bin} && cp $${bin} ${LOCAL_BIN_PATH}/${bin}; \
	done
	echo "Done!"
