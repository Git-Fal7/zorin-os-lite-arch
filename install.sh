#!/bin/sh

echo "upgrading stuff"

sudo pacman -Syu

git clone https://aur.archlinux.org/yay
cd yay/
makepkg -si

cd ..

sudo pacman -S xfce4 xorg-server xorg-drivers lightdm lightdm-gtk-greeter inter-font noto-fonts xfce4-power-manager network-manager-applet pulseaudio gvfs xfce4-pulseaudio-plugin

yay -S xfce4-zorinmenulite-plugin xfce4-docklike-plugin

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

sudo systemctl enable lightdm

echo "all is good, should be finished"
