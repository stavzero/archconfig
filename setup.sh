#!/bin/bash

echo "Starting Arch Setup this will take some time."

# Update and sync
yes | sudo pacman -Syu

# Ensure the following are installed
yes | sudo pacman -S git
yes | sudo pacman -S base-devel
yes | sudo pacman -S curl
yes | sudo pacman -S htop # Resource monitor
yes | sudo pacman -S lua # Programming language
yes | sudo pacman -S networkmanager
yes | sudo pacman -S libnotify # Notifications
yes | sudo pacman -S dunst # Notifications

# Enable and start networkmanager
sudo systemctl start NetworkManager.service
sudo systemctl enable NetworkManager.service

# Install i3 if not installed via archinstall
#yes | sudo pacman -S i3-wm
#yes | sudo pacman -S i3lock

# Other i3 status bars instead of polybar
#yes | sudo pacman -S i3status
#yes | sudo pacman -S i3blocks

# Install LightDM for a login screen if not installed via archinstall
#yes | sudo pacman -S lightdm lightdm-gtk-greeter

#systemctl enable lightdm 
#systemctl enable NetworkManager

# Install the lts version of arch as well
yes | sudo pacman -S linux-lts

# Install basic Utils
yes | sudo pacman -S awk
yes | sudo pacman -S xprop
yes | sudo pacman -S mediainfo
yes | sudo pacman -S ffmpeg # Media codec
yes | sudo pacman -S neofetch # System info
yes | sudo pacman -S bluez bluez-utils # Bluetooth
yes | sudo pacman -S blueman # Bluetooth manager
yes | sudo pacman -S file-roller # Archive manager

sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service

bluetoothctl power on
bluetoothctl agent on
bluetoothctl default-agent

# Install Window Manager Utils
yes | sudo pacman -S feh # Backgrounds
yes | sudo pacman -S rofi # Dmenu replacement
yes | sudo pacman -S picom # Transparency
yes | sudo pacman -S polybar # Status bar

# Install Programs
yes | sudo pacman -S neovim # Editor
yes | sudo pacman -S alacritty # Terminal emulator
yes | sudo pacman -S thunar thunar-volman # File browser
yes | sudo pacman -S tumbler # Image thumbnails for file browser
yes | sudo pacman -S firefox # Web browser
yes | sudo pacman -S vlc # Media player
yes | sudo pacman -S gnome-disk-utility # Disc utility

# Optional programs
yes | sudo pacman -S qutebrowser # Web browser with vim keybindings
#yes | sudo pacman -S godot # Game engine
#yes | sudo pacman -S blender # 3D modeling software
#yes | sudo pacman -S gimp # Drawing program
#yes | sudo pacman -S helix # Editor
#yes | sudo pacman -S gparted # Disc utility
#yes | sudo pacman -S openvpn # VPN
#yes | sudo pacman -S networkmanager-openvpn # Manage OpenVPN from Network Manager

# Install libs for drives, trash, archive management
yes | sudo pacman -S gvfs gvfs-mtp gvfs-gphoto2 gvfs-afc

# Install papirus theme
yes | sudo pacman -S papirus-icon-theme

# Install fonts
yes | sudo pacman -S ttf-iosevkaterm-nerd
yes | sudo pacman -S ttf-jetbrains-mono-nerd
yes | sudo pacman -S ttf-space-mono-nerd

# Install a bash replacement
#yes | sudo pacman -S zsh
#yes | sudo pacman -S fish

# Set zsh as default shell
#chsh -s /bin/zsh
# -- OR --
# Set fish as default shell
#chsh -s /bin/fish

# Set aliases
echo "alias ll='ls -la'" >> ~/.bashrc
echo "alias vim='nvim'" >> ~/.bashrc
echo "alias hx='helix'" >> ~/.bashrc
#echo "PS1='$PWD > '" >> ~/.bashrc
echo "PS1='\[\033[1;44m\]\[\033[1;31m\] $PWD \[\033[00m\] > '" >> ~/.bashrc

#echo "alias ll='ls -la'" >> ~/.zshrc
#echo "alias vim=nvim" >> ~/.zshrc
#echo "alias hx='helix'" >> ~/.zshrc
#echo "PS1='$PWD > '" >> ~/.zshrc

# Copy the user icon and background used for lightdm login
sudo cp Wallpapers/starfield-blue.png /usr/share/pixmaps/starfield-blue.png
sudo cp usericon.png /usr/share/pixmaps/usericon.png

# Create default home directories
mkdir ~/Documents
mkdir ~/Downloads
mkdir ~/Pictures
mkdir ~/Projects
mkdir ~/Music

# Move downloaded configs to their locations
cp -r i3 ~/.config/
cp -r i3blocks ~/.config/
cp -r nvim ~/.config/
cp -r picom ~/.config/
cp -r polybar ~/.config/
cp -r rofi ~/.config/
cp -r dunst ~/.config
cp -r alacritty ~/.config
cp -r helix ~/.config
mv Wallpapers ~/Wallpapers

sudo chmod 755 ~/.config/polybar/open-vpn.sh
sudo cp powermenu /usr/local/bin/
sudo cp wifimenu /usr/local/bin/
sudo chmod 755 /usr/local/bin/powermenu
sudo chmod 755 /usr/local/bin/wifimenu
sudo cp lightdm-gtk-greeter.conf /etc/lightdm/

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

# Enable pacman multilib package database to install steam
#echo "[multilib]" | sudo tee -a /etc/pacman.conf
#echo "Include = /etc/pacman.d/mirrorlist" | sudo tee -a /etc/pacman.conf
#sudo pacman -Syu

# Install linux headers to be able to use the AUR
#yes | sudo pacman -S linux-headers
#yes | sudo pacman -S linux-lts-headers

# Install dynamic kernel module system (needed for some aur packages)
#yes | sudo pacman -S dkms

# Install yay AUR helper
#git clone https://aur.archlinux.org/yay.git
#cd yay-git
#makepkg -si
#yay -Syu

# Install GPU drivers (pick the correct one) and Steam
#sudo pacman -S nvidia
#sudo pacman -S nvidia-lts
#sudo pacman -S steam

# Finish setup
yes | sudo pacman -Syu
echo "SETUP DONE. REBOOT."
