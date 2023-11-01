# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/vardan/.zshrc'

# ~/.zshrc
alias hgrep='history | grep'
alias ls='ls --color'
alias grep='grep --color=auto'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'

export QT_QPA_PLATFORMTHEME=qt5ct
export EDITOR=nvim
export PATH="$PATH:/home/vardan/.local/bin"

eval "$(starship init zsh)"


autoload -Uz compinit
compinit

if [ "$TERM" = "linux" ]; then
     echo -en "\e]P0000000" #black
     echo -en "\e]P8D8D8D8" #darkgrey
     echo -en "\e]P1AB4642" #darkred
    echo -en "\e]P9AB4642" #red
    echo -en "\e]P2A1B56C" #darkgreen
    echo -en "\e]PAA1B56C" #green
    echo -en "\e]P3F7CA88" #brown
    echo -en "\e]PBF7CA88" #yellow
    echo -en "\e]P47CAFC2" #darkblue
    echo -en "\e]PC7CAFC2" #blue
    echo -en "\e]P5BA8BAF" #darkmagenta
    echo -en "\e]PDBA8BAF" #magenta
    echo -en "\e]P686C1B9" #darkcyan
    echo -en "\e]PE86C1B9" #cyan
    echo -en "\e]P7D8D8D8" #lightgrey
    echo -en "\e]PFFFFFFF" #white
    clear #for background artifacting
fi

# End of lines added by compinstall
