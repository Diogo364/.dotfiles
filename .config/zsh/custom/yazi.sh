#!/usr/bin/env bash

if ! [[ -s $(command -v yazi) ]]; then
    _verbose_notify "binary yazi not found"
    return
fi

# Yazi wrapper
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd "$cwd"
	fi
	rm -f "$tmp"
}
