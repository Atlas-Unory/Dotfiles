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
sudo pacman -S syu

# Installing ecensial packages
sudo pacman -S git nvm zsh gimp qbittorrent discord fastfetch yazi fzf virtualbox neovim ghostty starship ntfs-3g unzip

# Installing yay helper
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd $HOME

# Installing Lazyvim
git clone https://github.com/LazyVim/starter ~/.config/nvim && rm -rf ~/.config/nvim/.git

# Installing ecensial packages through Yay
yay -S visual-studio-code-bin spotify

# Installing Brave browser
yay -Sy brave-bin

# Cloning my git dotfiles
cd ~/Documents && git clone minha/url/do/git/com/meus/dotfiles

# Linking the needing fonts
ln -s ~/Documents/Dotfiles/fonts ~/.local/share

# Linking fastfetch config
lsn -s ~/Documents/Dotfiles/fastfetch ~/.config

# Reloading font cache
fc-cache -vf

# Linking the Ghostty terminal config file
ln -s ~/Documents/Dotfiles/ghostty ~/.config

# Linking zsh source config
ln -s ~/Documents/Dotfiles/.zshrc ~/

# Exeting dotfiles
cd $HOME

# Chanching to zsh shell
chsh -s $(which zsh)

# Installing oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Cloning the zsh syntax-highliting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git