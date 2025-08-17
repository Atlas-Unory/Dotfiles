#!/bin/bash

# Changing directory
cd $HOME

# Updating the system
sudo pacman -Syu --noconfirm

# Main packages
sudo pacman -S vlc git bat firefox eza zsh fastfetch nvm ghostty keepassxc fzf yazi neovim vlc-plugins-all --noconfirm

# installing yay
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
cd $HOME

# Installing VScode
yay -S visual-studio-code-bin --noconfirm

# Installing Brave
yay -S brave-bin --noconfirm

# installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --noconfirm

# Installing syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

# installing starship
sudo pacman -S starship --noconfirm

# Installing zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Verifing zshrc in home
if [ -e ~/.zshrc ]; then
  rm -f .zshrc
  ln -s ~/Documents/Dotfiles/.zshrc/ ~/
else
  echo "There is no .zshrc file in ~"

# Installing lazyvim
git clone https://github.com/LazyVim/starter ~/.config/nvim && rm -rf ~/.config/nvim/.git

# Linking the Dotfiles
ln -s ~/Documents/Dotfiles/fastfetch/ ~/.config/
ln -s ~/Documents/Dotfiles/ghostty/ ~/.config/
ln -s ~/Documents/Dotfiles/fonts/ ~/.local/share/
