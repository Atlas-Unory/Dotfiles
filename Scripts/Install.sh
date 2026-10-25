#!/bin/bash

# Variables
SCRIPT_LOCATION="$(pwd)"

# Packages to check and isntall if not found
Packages=("neovim" "flatpak" "kitty" "dbeaver" "thunderbird" "bun" "uv" "shfmt" "vivaldi" "librewolf" "vlc" "yay")
Packages_AUR=("vscodium-bin" "insomnia-bin")

if [ -f /etc/os-release ]; then
	# Load os-release data
	. /etc/os-release

	if [ "$ID" = "cachyos" ]; then
		echo "The distribution is CachyOS"

	fi
else
	echo "Cannot detect distribution."
fi
