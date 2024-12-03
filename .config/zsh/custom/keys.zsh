#!/bin/zsh

# Move with arrow keys
bindkey -M emacs '^[[1;5D' backward-word
bindkey -M emacs '^[[1;5C' forward-word

# tmux-sessionizer shortcut
tmux-sessionizer-widget() {
    exec </dev/tty
    exec <&1
    tmux-sessionizer
}

zle -N tmux-sessionizer-widget
bindkey -M emacs '^F' tmux-sessionizer-widget
bindkey -M vicmd '^F' tmux-sessionizer-widget
bindkey -M viins '^F' tmux-sessionizer-widget

# Yank entire command
yank-my-prompt-widget() {
    echo ${BUFFER} | yank
}

zle -N yank-my-prompt-widget
bindkey -M emacs '^[Y' yank-my-prompt-widget
bindkey -M vicmd '^[Y' yank-my-prompt-widget
bindkey -M viins '^[Y' yank-my-prompt-widget
