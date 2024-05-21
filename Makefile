TILIX_DCONF := /com/gextperts/Tilix/

load-tilix:
	dconf load ${TILIX_DCONF} < ./tilix.dconf

dump-tilix:
	dconf dump /com/gexperts/Tilix/ > ./tilix.dconf

