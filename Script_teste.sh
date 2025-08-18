#!/bin/bash

set -e

# Sudo password only in the begining
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Changing directory
cd $HOME

# Updating the system
sudo pacman -Syu --noconfirm

# Main packages
sudo pacman -S vlc git bat firefox eza zsh fastfetch nvm ghostty keepassxc fzf yazi neovim vlc-plugins-all --noconfirm

# installing yay
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm --needed
cd $HOME

# Installing VScode
yay -S visual-studio-code-bin --noconfirm --needed

# Installing Brave
yay -S brave-bin --noconfirm --needed

# oh-my-zsh venv variables
RUNZSH=no CHSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Installing syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

# installing starship
sudo pacman -S starship --noconfirm

# Installing zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Verifing zshrc in home
if [ -e ~/.zshrc ]; then
  rm -f .zshrc
  ln -sf ~/Documents/Dotfiles/.zshrc/ ~/.zshrc
else
  echo "There is no .zshrc file in ~"
fi

# Installing lazyvim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Linking the Dotfiles
ln -sf ~/Documents/Dotfiles/fastfetch/ ~/.config/
ln -sf ~/Documents/Dotfiles/ghostty/ ~/.config/
ln -sf ~/Documents/Dotfiles/fonts/ ~/.local/share/
