# if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#     exec startx
# fi

export PATH=/home/elliotbobrow/.config/emacs/bin/:/home/elliotbobrow/.local/bin:/home/elliotbobrow/.cargo/bin:/home/elliotbobrow/go/bin:$PATH

# Enable colors and change prompt:
autoload -U colors && colors
# setopt autocd
# stty stop undef
# setopt interactive_comments

# Java fix?
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit

# GRML
grml_theme_add_token lambda 'λ '
zstyle ':prompt:grml:left:setup' items rc change-root path vcs lambda
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git*' formats "%{${fg[cyan]}%}[%{${fg[blue]}%}%b%{${fg[yellow]}%}%m%u%c%{${fg[cyan]}%}] %{$reset_color%}"

# History in cache directory:
setopt APPEND_HISTORY
setopt SHARE_HISTORY
HISTFILE=$HOME/.zsh_history
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# vi mode
# bindkey -v
# export KEYTIMEOUT=1
setopt vi

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

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
alias vm="nvim main.tex"
alias hw=". hw_script"
alias vh="nvim +'lua require(\"harpoon.ui\").nav_file(1)' +'call ZathuraOpenPdf()'"
alias wifi="nmcli device wifi"
alias swifi="sudo nmcli device wifi"
alias ht="cabal test --test-show-details=direct"
alias rs="/usr/lib/rstudio/rstudio"

alias fn="fasd -fe nvim"

# fasd
eval "$(fasd --init auto)"

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# [ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

[ -f "/home/elliotbobrow/.ghcup/env" ] && source "/home/elliotbobrow/.ghcup/env" # ghcup-env

# opam configuration
[[ ! -r /home/elliotbobrow/.opam/opam-init/init.zsh ]] || source /home/elliotbobrow/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
