TILIX_DCONF := /com/gextperts/Tilix/
LOCAL_BIN_PATH := ${HOME}/.local/bin
SCRIPTS_PATH := ./scripts
ALL_SYMLINKS := `cat "symlink.list"`
CURPATH := `pwd`

load-tilix:
	dconf load ${TILIX_DCONF} < ./tilix.dconf

dump-tilix:
	dconf dump /com/gexperts/Tilix/ > ./tilix.dconf

set-custom-scritps:
	if  [ ! -d ${LOCAL_BIN_PATH} ]; then \
		mkdir ${LOCAL_BIN_PATH}; \
	fi
	for bin in ${SCRIPTS_PATH}/*; do \
		echo "setting $${bin} to ${LOCAL_BIN_PATH}"; \
		chmod 755 $${bin} && cp $${bin} ${LOCAL_BIN_PATH}/${bin}; \
	done
	echo "Done!"

create-config-symlinks:
	for file in ${ALL_SYMLINKS}; do \
		echo "Linking ${CURPATH}/$${file} -> ${HOME}/$${file}"; \
		rm -rf ${HOME}/$${file}; \
		ln -s ${CURPATH}/$${file} ${HOME}/$${file}; \
	done
