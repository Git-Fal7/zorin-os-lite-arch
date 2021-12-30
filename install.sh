#!/bin/sh

echo "upgrading stuff"

sudo pacman -Syu

git clone https://aur.archlinux.org/yay
cd yay/
makepkg -si

cd ..
sudo pacman -S xfce4 xorg-server xorg-drivers lightdm lightdm-gtk-greeter inter-font noto-fonts xfce4-power-manager network-manager-applet pulseaudio gvfs xfce4-pulseaudio-plugin light-locker
yay -S xfce4-zorinmenulite-plugin xfce4-docklike-plugin

if [ "$1" = "-full" ]; then
 yay -S mugshot pamac-nosnap
 sudo ln -s /usr/bin/pamac-manager /usr/bin/gnome-software
 sudo ln -s /usr/bin/xfce4-appearance-settings /usr/bin/zorin-appearance
fi

cd zorin-icon-theme/
makepkg -si

cd ..

cd zorin-desktop-themes/
makepkg -si

cd ..

cd zorin-backgrounds/
makepkg -si

cd ..

cd zorin-os-lite-default-settings/
makepkg -si

mkdir ~/.config/

cp -r /etc/xdg/xdg-zorin-os-lite/* ~/.config/
cp /etc/xdg/xdg-zorin-os-lite/* ~/.config/

if [ "$1" != "-nosystemd" ]; then
 sudo systemctl enable lightdm
fi
echo "all is good, should be finished"
