#!/bin/bash

sed -i 's/ (Runtime)//g' /usr/share/applications/steam.desktop
sed -i 's/viber.png/viber/g' /usr/share/applications/viber.desktop
sed -i 's/Firefox Web Browser/Firefox/g' /usr/share/applications/firefox.desktop
sed -i 's/WebCord/Discord/g' /usr/share/applications/webcord.desktop
sed -i 's/Vesktop/Discord/g' /usr/share/applications/vesktop.desktop
sed -i 's/Icon=vesktop/Icon=discord/' /usr/share/applications/vesktop.desktop
sed -i 's/Telegram Desktop/Telegram/g' /usr/share/applications/org.telegram.desktop.desktop
sed -i 's/Figma Linux/Figma/g' /usr/share/applications/figma-linux.desktop
sed -i 's/Icon=nwg-look/Icon=theme-config/' /usr/share/applications/nwg-look.desktop
sed -i 's/Icon=nwg-icon-picker/Icon=view_icons/' /usr/share/applications/nwg-icon-picker.desktop
sed -i 's/VLC media player/VLC/g' /usr/share/applications/vlc.desktop
sed -i 's/Exec=Hyprland/Exec=Hyprland \&> \/dev\/null /g' /usr/share/wayland-sessions/hyprland.desktop

for file in $(ls /usr/share/applications/ | grep electron); do
    IFS='.' read -r name extension <<< "$file"
    sed -i "s/Icon=$name/Icon=electron/g" "/usr/share/applications/$file"
done
