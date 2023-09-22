#!/bin/bash

# Update and sync
sudo pacman -Syu

# Install basic Utils
pacman -S git
pacman -S curl
pacman -S htop
pacman -S mediainfo
pacman -S neofetch
pacman -S ffmpeg
pacman -S luaz

# Install Libs
pacman -S xprop
pacman -S awk

# Install i3
pacman -S i3-wm
pacman -S i3lock

# Install Window Manager Utils
pacman -S feh # Backgrounds
pacman -S rofi # Dmenu replacement
pacman -S picom # Transparency
pacman -S polybar # Status bar

# Install LightDM for a login screen
pacman -S lightdm lightdm-gtk-greeter

systemctl enable lightdm 
systemctl enable NetworkManager

# Other i3 status bars instead of polybar
#pacman -S i3status
#pacman -S i3blocks

# Install Programs
pacman -S neovim
pacman -S alacritty
pacman -S thunar thunar-volman
pacman -S qutebrowser
pacman -S vlc
pacman -S steam
pacman -S godot
pacman -S obsidian

# Install fish bash replacement
pacman -S fish
