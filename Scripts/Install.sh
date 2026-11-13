#!/bin/bash

# Variables
SCRIPT_LOCATION="$(pwd)"

# Packages to check and isntall if not found
Packages=("neovim" "flatpak" "kitty" "dbeaver" "thunderbird" "bun" "uv" "shfmt" "vivaldi" "librewolf" "vlc" "yay" "tmux" "shellcheck" "clamav" "typos" "gimp" "libreoffice-fresh" "krita")
Packages_AUR=("vscodium-bin" "insomnia-bin" "docker-desktop")

if [ -f /etc/os-release ]; then
	# Load os-release data
	. /etc/os-release

	if [ "$ID" = "cachyos" ]; then
		echo "The distribution is CachyOS"
		for package in "${Packages[@]}"; do
			if [ "$package" != "yay" ]; then
				sudo pacman -S "$package"
			else
				git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd "$SCRIPT_LOCATION" || exit
			fi
		done

		for package in "${Packages_AUR[@]}"; do
			yay -S "$package"
		done

		# Adding dotfile content
		git clone git@github.com:Atlas-Unory/Dotfiles.git "$HOME"/Documents
		ln -s "$HOME"/Documents/Dotfiles/images "$HOME"/Pictures
		ln -s "$HOME"/Documents/Dotfiles/fonts "$HOME"/.local/share
		rm "$HOME"/.config/fish/config.fish
		ln -s "$HOME"/Documents/Dotfiles/fish/config.fish "$HOME"/.config/fish

		git clone https://github.com/LazyVim/starter ~/.config/nvim
		rm -rf ~/.config/nvim/.git
	fi
else
	echo "Cannot detect distribution."
fi
