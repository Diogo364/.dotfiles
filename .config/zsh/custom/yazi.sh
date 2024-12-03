#!/usr/bin/env bash

[[ -s $(command -v yazi) ]] || $(_verbose_notify "binary yazi not found" && return)

# Yazi wrapper
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd "$cwd"
	fi
	rm -f "$tmp"
}
