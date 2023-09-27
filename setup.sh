#!/bin/bash

# Update and sync
sudo pacman -Syu

# Ensure the following are installed
sudo pacman -S git
sudo pacman -S curl
sudo pacman -S htop
sudo pacman -S lua
sudo pacman -S networkmanager

# Enable and start networkmanager
sudo systemctl start NetworkManager.service
sudo systemctl enable NetworkManager.service

sudo pacman -S xprop
sudo pacman -S awk

# Install the lts version of arch aswell
sudo pacman -S linux-lts

# Install basic Utils
sudo pacman -S mediainfo
sudo pacman -S ffmpeg
sudo pacman -S neofetch
sudo pacman -S bluez bluez-utils
sudo pacman -S file-roller

sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service

# Install i3 if not installed via archinstall
#sudo pacman -S i3-wm
#sudo pacman -S i3lock

# Other i3 status bars instead of polybar
#sudo pacman -S i3status
#sudo pacman -S i3blocks

# Install LightDM for a login screen if not installed via archinstall
#sudo pacman -S lightdm lightdm-gtk-greeter

# Install Window Manager Utils
sudo pacman -S feh # Backgrounds
sudo pacman -S rofi # Dmenu replacement
sudo pacman -S picom # Transparency
sudo pacman -S polybar # Status bar

# Install Programs
sudo pacman -S neovim
sudo pacman -S alacritty
sudo pacman -S thunar thunar-volman
sudo pacman -S firefox
sudo pacman -S qutebrowser
sudo pacman -S vlc
sudo pacman -S godot

# Install libs for drives, trash, archive management
sudo pacman -S gvfs gvfs-mtp gvfs-gphoto2 gvfs-afc

# Install a bash replacement
sudo pacman -S zsh
#pacman -S fish

# Set aliases
echo "alias ll='ls -la'" >> ~/.bashrc
echo "alias vim='nvim'" >> ~/.bashrc

echo "alias ll='ls -la'" >> ~/.zshrc
echo "alias vim=nvim" >> ~/.zshrc

#systemctl enable lightdm 
#systemctl enable NetworkManager

# Copy the user icon and background used for lightdm login
sudo cp Wallpapers/starfield-blue.png /usr/share/pixmaps/starfield-blue.png
sudo cp usericon.png /usr/share/pixmaps/usericon.png

# Move downloaded configs to their locations
cp -r i3 ~/.config/
cp -r i3blocks ~/.config/
cp -r nvim ~/.config/
cp -r picom ~/.config/
cp -r polybar ~/.config/
cp -r rofi ~/.config/
mv Wallpapers ~/Wallpapers

sudo cp powermenu /usr/local/bin/
sudo cp wifimenu /usr/local/bin/
sudo chmod 755 /usr/local/bin/powermenu
sudo chmod 755 /usr/local/bin/wifimenu
sudo cp -r IosevkaTerm /usr/share/fonts/
sudo cp lightdm-gtk-greeter.conf /etc/lightdm/

#copy lightdm config

# Install papirus theme
sudo pacman -S papirus-icon-theme

# Disable beep sounds in laptops
echo "blacklist pcspkr" >> nobeep.conf
echo "blacklist snd_pcsp" >> nobeep.conf
sudo cp nobeep.conf /etc/modprobe.d/

# Grub configuration
# Disable grub menu unless holding Shift
# Enable Arch-Lts version
echo "GRUB_DEFAULT=saved" | sudo tee -a /etc/default/grub
echo "GRUB_SAVEDEFAULT=true" | sudo tee -a /etc/default/grub
echo "GRUB_DISABLE_SUBMENU=y" | sudo tee -a /etc/default/grub
echo "GRUB_FORCE_HIDDEN_MENU=true" | sudo tee -a /etc/default/grub

sudo cp 31_hold_shift /etc/grub.d/
sudo chmod 755 /etc/grub.d/31_hold_shift

sudo grub-mkconfig -o /boot/grub/grub.cfg
