#!/usr/bin/env bash

if ! [[ -s $(command -v bat) ]]; then
    _verbose_notify "binary bat not found"
    return
fi

export BAT_THEME="Monokai Extended Origin"
