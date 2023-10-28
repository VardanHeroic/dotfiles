#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#alias dava='sh ~/Rice/Scripts/dava.sh'
alias hgrep='history | grep'
alias grep='grep --color=auto'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias nvim='nvim -c ":source /home/vardan/.config/nvim/init.vim"'

PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"


function reload_gtk_theme() {
  theme=$(gsettings get org.gnome.desktop.interface gtk-theme)
  gsettings set org.gnome.desktop.interface gtk-theme ''
  sleep 1
  gsettings set org.gnome.desktop.interface gtk-theme $theme
}

export QT_QPA_PLATFORMTHEME=qt5ct
export EDITOR=nvim

# Created by `pipx` on 2023-10-23 10:24:45
export PATH="$PATH:/home/vardan/.local/bin"
