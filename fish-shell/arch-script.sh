#!/bin/bash

# Updating the system
sudo pacman -Syu

# Installing the basic packages
sudo pacman -S --noconfirm ghostty neovim fish fisher curl keepassxc fastfetch gimp php-apache yazi yay wget btop unzip unrar virtualbox php ntfs-3g eza apache bat flatpak npm

# Installing needed fonts
sudo pacman -S --noconfirm noto-fonts-extra noto-fonts-emoji noto-fonts-cjk

# Installing libreoffice
sudo pacman -S --noconfirm libreoffice-fresh libmythes mythes-en

# Installing basic packages with Yay
yay -S --noconfirm visual-studio-code-bin brave-bin

# Installing spotify
yay -S --noconfirm spotify

# Installing Lazyvim
git clone https://github.com/LazyVim/starter ~/.config/nvim && rm -rf ~/.config/nvim/.git

# Installing homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
