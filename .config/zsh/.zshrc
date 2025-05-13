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

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/dinascimento/miniconda3/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
	eval "$__conda_setup"
else
	if [ -f "/home/dinascimento/miniconda3/etc/profile.d/conda.sh" ]; then
		. "/home/dinascimento/miniconda3/etc/profile.d/conda.sh"
	else
		export PATH="/home/dinascimento/miniconda3/bin:$PATH"
	fi
fi
unset __conda_setup
conda activate general-qa
# <<< conda initialize <<<
