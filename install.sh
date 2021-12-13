#!/bin/sh

echo "upgrading stuff"

sudo pacman -Syu

sudo pacman -S xfce4 xorg-server xorg-drivers lightdm lightdm-gtk-greeter

yay -S xfce4-zorinmenulite-plugin

cd ..

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

cp -r /etc/xdg/xdg-zorin-os-lite/* ~/.config/
cp /etc/xd/xdg-zorin-os-lite/* ~/.config/

sudo systemctl enable lightdm

echo "all is good, should be finished"
