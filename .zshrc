eval "$(starship init zsh)"

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"


# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=2000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd $realpath'
compdef lsd=ls

# Aliases
alias neofetch='neofetch --ascii ~/.config/neofetch/ascii/new.txt --ascii_colors 4'
alias r='ranger'
alias n='nvim'
alias c='clear'
alias h='htop'
alias md="mkdir"
alias rd="rmdir"
alias l='lsd'
alias ls='ls --color'
alias ll='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'
alias grep='grep --color=auto'
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export QT_QPA_PLATFORMTHEME=qt5ct
export EDITOR='nvim'
export P='/data/data/com.termux/files/'
export A='/storage/emulated/0'

if command -v tmux &> /dev/null && ! tmux has-session -t default 2>/dev/null; then
    tmux new-session -d -s default
    tmux attach -t default
fi

if [[ -z "$(tmux list-sessions)" ]]; then
    exit
fi
