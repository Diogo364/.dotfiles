#!/usr/bin/env zsh

# Set up fzf key bindings and fuzzy completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


if ! [[ -s $(command -v fzf) ]]; then
    _verbose_notify "binary fzf not found"
    return
fi

# -- Use fd instead of fzf --
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
export FZF_TMUX_OPTS="--tmux=center,80%"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'" "$@" ;;
    ssh)          fzf --preview 'dig {}' "$@" ;;
    alias)        alias | sort -fr | fzf --layout=reverse-list "$@" ;;
    tmux*)        tmux ls -F '#{session_name}' | sort -fr | fzf --layout=reverse-list "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# CTRL-A - Paste the selected alias into the command line
fzf-alias-widget() {
  local selected
  setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases noglob nobash_rematch 2> /dev/null
  selected="$(alias | 
      fzf --prompt='Alias > ' | 
      cut -d '=' -f1)"
  LBUFFER="$selected"
  zle reset-prompt
}

zle     -N            fzf-alias-widget
bindkey -M emacs '^A' fzf-alias-widget
bindkey -M vicmd '^A' fzf-alias-widget
bindkey -M viins '^A' fzf-alias-widget


# CTRL-? - Paste the selected alias into the command line
fzf-keybindings-widget() {
  local selected
  setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases noglob nobash_rematch 2> /dev/null
  
  selected="$(bindkey |
      fzf --prompt='bindkey > ' |
      rev |
      cut -d ' ' -f 1 |
      rev)"
  LBUFFER="$selected"
  zle reset-prompt
}

zle     -N            fzf-keybindings-widget
bindkey -M emacs '^_' fzf-keybindings-widget
bindkey -M vicmd '^_' fzf-keybindings-widget
bindkey -M viins '^_' fzf-keybindings-widget

