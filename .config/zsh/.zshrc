# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

unsetopt beep
setopt always_to_end
setopt auto_cd auto_pushd
setopt auto_list
setopt auto_param_keys
setopt auto_param_slash
setopt bash_auto_list
setopt list_ambiguous
setopt list_packed
setopt extended_glob
setopt hist_find_no_dups
setopt append_history
setopt prompt_subst

autoload run-help

# Set emacs bindings
bindkey -e

export WORDCHARS='*?.[]~=&;!#$%^(){}<>'
export HISTFILE="${HOME}/.zsh_history"
export SAVEHIST=10000
export HISTSIZE=10000


# Initialize custom settings
[[ -d "${ZDOTDIR}" ]] && source "${ZDOTDIR}/init.sh"

[[ -d "${ZDOTDIR}/plugins" ]] && for f in ${ZDOTDIR}/plugins/*; do source $f; done


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

. "$HOME/.local/share/../bin/env"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
