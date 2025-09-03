#!/bin/bash

# Updating the system
sudo pacman -Syu

# Installing the basic packages
pacman -S ghostty neovim fish fisher curl keepassxc fastfetch gimp speedtest-cli php-apache yazi yay wget btop unzip unrar virtualbox php ntfs-3g eza apache bat flatpak npm

# Installing needed fonts
pacman -S noto-fonts-extra noto-fonts-emoji noto-fonts-cjk

# Installing libreoffice
pacman -S libreoffice-fresh libmythes mythes-en

# Installing basic packages with Yay
yay -S visual-studio-code-bin brave-bin

# Installing spotify
yay -S spotify

# Installing Lazyvim
git clone https://github.com/LazyVim/starter ~/.config/nvim && rm -rf ~/.config/nvim/.git

# Installing homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
