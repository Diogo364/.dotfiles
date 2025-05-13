#!/usr/bin/env bash

tmux-attach() {
	session_name=$1

	if [[ -z $session_name ]]; then
		echo "No session name provided" >&2
		exit 0
	fi

	if [[ -z $TMUX ]]; then
		tmux attach -t $session_name
	else
		tmux switch-client -t $session_name
	fi
}
