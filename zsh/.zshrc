if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    # exec startx
fi

export PATH=/home/elliotbobrow/.local/bin:/home/elliotbobrow/.cargo/bin:/home/elliotbobrow/go/bin:$PATH

# Enable colors and change prompt:
autoload -U colors && colors
setopt autocd
stty stop undef
setopt interactive_comments

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.zsh_history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# vi mode
# bindkey -v
# export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

bindkey '^[[P' delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# For title bar
autoload -Uz add-zsh-hook

function xterm_title_precmd () {
	print -Pn -- '\e]2;%n@%m %~\a'
}

function xterm_title_preexec () {
	print -Pn -- '\e]2;%n@%m %~ %# ' && print -n -- "${(q)1}\a"
}

if [[ "$TERM" == (alacritty*|st*|nome*|konsole*|putty*|rxvt*|screen*|tmux*|xterm*) ]]; then
    add-zsh-hook -Uz precmd xterm_title_precmd
    add-zsh-hook -Uz preexec xterm_title_preexec
fi

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
alias paci="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
alias pacr="pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"
alias auri="paru -Slq | fzf --multi --preview 'paru -Si {1}' | xargs -ro paru -S"
alias aurr="paru -Qq | fzf --multi --preview 'paru -Qi {1}' | xargs -ro paru -Rns"

alias gs="git status"

alias ls="ls --color=auto"
alias cp="cp -v"
alias mv="mv -v"
alias x="startx"
alias v="nvim"
alias wifi="nmcli device wifi"
alias swifi="sudo nmcli device wifi"
alias ht="cabal test --test-show-details=direct"

eval "$(starship init zsh)"

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# TODO
#[ -f "/home/elliotbobrow/.ghcup/env" ] && source "/home/elliotbobrow/.ghcup/env" # ghcup-env

alias luamake=/home/elliotbobrow/lua-language-server/3rd/luamake/luamake
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

[ -f "/home/elliotbobrow/.ghcup/env" ] && source "/home/elliotbobrow/.ghcup/env" # ghcup-env
