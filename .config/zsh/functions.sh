#!/usr/bin/env bash

olaMundo() {
    echo "ola mundo"
}

addToPath() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$PATH:$1
    fi
}

addToPathFront() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}

keybindings_for() {
    fd -p $1 ~/.config | fzf --reverse | xargs less
}

csv_pp(){
    sed 's/,/:,/g' $1 | column -t -s: | sed 's/ ,/,/g'
}

_verbose_notify() {
    if [[ "${_ZSH_VERBOSE}" -eq 1 ]]; then
        notify-send -u normal "$1"
    fi
}

sendToLocalBin() {
    in_file="$1"
    if [[ ! -f "$in_file" ]]; then
        echo "File $in_file do not exist">&2
        return
    fi

    target_dir=~/.local/bin/
    target_file="$target_dir/`basename "$in_file"`"

    chmod +x $in_file && cp "$in_file" "$target_file"
    echo "File created" >&2
    echo "$target_file"
}
