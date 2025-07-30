# /$$$$$$  /$$$$$$$$ /$$        /$$$$$$   /$$$$$$        /$$$$$$$   /$$$$$$  /$$$$$$$$ /$$$$$$$$ /$$$$$$ /$$       /$$$$$$$$  /$$$$$$ 
# /$$__  $$|__  $$__/| $$       /$$__  $$ /$$__  $$      | $$__  $$ /$$__  $$|__  $$__/| $$_____/|_  $$_/| $$      | $$_____/ /$$__  $$
# | $$  \ $$   | $$   | $$      | $$  \ $$| $$  \__/      | $$  \ $$| $$  \ $$   | $$   | $$        | $$  | $$      | $$      | $$  \__/
# | $$$$$$$$   | $$   | $$      | $$$$$$$$|  $$$$$$       | $$  | $$| $$  | $$   | $$   | $$$$$     | $$  | $$      | $$$$$   |  $$$$$$ 
# | $$__  $$   | $$   | $$      | $$__  $$ \____  $$      | $$  | $$| $$  | $$   | $$   | $$__/     | $$  | $$      | $$__/    \____  $$
# | $$  | $$   | $$   | $$      | $$  | $$ /$$  \ $$      | $$  | $$| $$  | $$   | $$   | $$        | $$  | $$      | $$       /$$  \ $$
# | $$  | $$   | $$   | $$$$$$$$| $$  | $$|  $$$$$$/      | $$$$$$$/|  $$$$$$/   | $$   | $$       /$$$$$$| $$$$$$$$| $$$$$$$$|  $$$$$$/
# |__/  |__/   |__/   |________/|__/  |__/ \______/       |_______/  \______/    |__/   |__/      |______/|________/|________/ \______/


#!/bin/bash

# Updating the system
sudo pacman -Syu

# Installing ecensial packages
sudo pacman -S vlc gimp git discord obsidian wofi hyprland ntfs-3g unzip qbittorrent discord ghostty waybar ntfs-3g unzip fastfetch keepassxc

# Installing yay
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd $HOME

# Installing Brave
yay -Sy brave-bin

# cloning the dotfiles repo
cd Documents && git clone url/to/my/dotfiles && cd dotfiles

# Linking the configuration
ln -s ~/Documents/dotfiles/ghostty ~/.config
ln -s ~/Documents/dotfiles/hypr ~/.config
ln -s ~/Documents/dotfiles/waybar ~/.config
ln -s ~/Documents/dotfiles/wofi ~/.config
ln -s ~/Documents/Dotfiles/fastfetch ~/.config

# Linking the fonts
ln -s ~/Documents/dotfiles/fonts ~/.local/share