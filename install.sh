#!/bin/sh

DIRNAME=${pwd}

echo "upgrading stuff"

sudo pacman -Syu

sudo pacman -S xfce lightdm lightdm-gtk-greeter

yay -S xfce4-zorinmenulite-plugin

cd ${DIRNAME}

cd zorin-icon-theme/
makepkg -si

cd ..

cd zorin-desktop-themes/
makepkg -si

cd ..

cd zorin-backgrounds/
makepkg -si

cp -r xfce4/ ~/.config/

sudo cp lightdm-gtk-greeter.conf /etc/lightdm/

echo "all is good, should be finished"
