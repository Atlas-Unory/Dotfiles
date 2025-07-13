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
sudo pacman -S git zsh gimp qbittorrent discord fastfetch yazi fzf virtualbox neovim ghostty starship ntfs-3g unzip bat

# Installing yay helper
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd $HOME

# Installing Lazyvim
git clone https://github.com/LazyVim/starter ~/.config/nvim && rm -rf ~/.config/nvim/.git

# Installing ecensial packages through Yay
yay -S visual-studio-code-bin spotify

# Installing Brave browser
yay -S brave-bin

# Cloning my git dotfiles
cd ~/Documents && git clone https://github.com/Atlas-Unory/Dotfiles.git

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

# Installing NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# Sourcing .zshrc after NVM installation
source ~/.zshrc

# Installing oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Cloning the zsh syntax-highliting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

# Finishing the installation
echo "Installation complete"