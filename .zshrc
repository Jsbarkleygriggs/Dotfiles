# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' ignore-parents pwd .. directory
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'l:|=* r:|=*' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' max-errors 2 numeric
zstyle ':completion:*' menu select=long
zstyle ':completion:*' original true
zstyle ':completion:*' prompt 'corrected %e'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s%l
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' substitute 1
zstyle :compinstall filename '/home/login0/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

PS1='[%2~]%(!.#.%%) '

#source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh
#export FZF_DEFAULT_OPTS="--preview 'ls -l --color=always {}'"

# Enable fzf key bindings and completion
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

# Custom function to search and open files using fzf
#function ff() {
#    local file
#    file=$(find . -type f | fzf --preview 'cat {}' --preview-window=up:30%:wrap)
#    if [ -n "$file" ]; then
#        nvim "$file"
#    else
#        echo "No file selected."
#    fi
#}

function vif() {
  local query=$1
  fzf --query="$query" --bind 'enter:execute(nvim {})'
}

# direnv
eval "$(direnv hook zsh)"

setopt PROMPT_SUBST

show_virtual_env() {
  if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
    echo "($(basename $VIRTUAL_ENV))"
  fi
}
PS1='$(show_virtual_env)'$PS1

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# Nix path for multi-user
#. /etc/profile.d/nix-daemon.sh

# Created by `pipx` on 2024-12-11 14:40:15
export PATH="$PATH:/home/login0/.local/bin"

alias vi='nvim'
alias ls='ls --color'

bindkey "\e[3~" delete-char

alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
