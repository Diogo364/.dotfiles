TILIX_DCONF := /com/gextperts/Tilix/
LOCAL_BIN_PATH := ${HOME}/.local/bin
SCRIPTS_PATH := ./scripts
ALL_SYMLINKS := `cat "symlink.list"`
CURPATH := `pwd`
ENV_Z_FILE := ~/.zshenv
PROFILE_CUSTOM_TAG := `grep "~/.profile-custom" ${ENV_Z_FILE}`

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

append-profile-file:
	@if [ -z ${PROFILE_CUSTOM_TAG} ]; then \
		echo "[ -f ~/.profile-custom ] && . ~/.profile-custom" >> ${ENV_Z_FILE}; \
	fi
	@echo "Updating ~/.profile-custom file"
	cp .profile-custom ~/.profile-custom
