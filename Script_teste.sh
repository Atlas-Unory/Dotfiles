#!/bin/bash

# Updating the system
sudo pacman -Syu

# Main packages
sudo pacman -S vlc git bat firefox eza zsh fastfetch ghostty keepassxc fzf yazi neovim vlc-plugins-all

# installing yay
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

cd $HOME

# Installing VScode
yay -S visual-studio-code-bin

# installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Installing syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

# Installing zsh-autosuggestions
sudo pacman -S zsh-autosuggestions

# Installing lazyvim
git clone https://github.com/LazyVim/starter ~/.config/nvim && rm -rf ~/.config/nvim/.git

# Linking the Dotfiles
ln -s ~/Documents/Dotfiles/fastfetch/ ~/.config/
ln -s ~/Documents/Dotfiles/.zshrc/ ~/
ln -s ~/Documents/Dotfiles/ghostty/ ~/.config/
