#!/bin/bash

#+---------------------------------------------------------+
#| ############ VARIABLES ############                     |
#+---------------------------------------------------------+

# Reset
OFF='\033[0m' # Text Reset - very important!

# Colors
Blue='\033[0;34m'

# Machine operating system
COMPUTER_OS=""

# LazyVim path
LAZY_VIM_DIR="$HOME/.config/nvim/"

# Install script path
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

# Image folder path
IMAGES_DIR="$SCRIPT_DIR/images/"

# Dotfiles folder path
DOTFILES_DIR="$SCRIPT_DIR/Dotfiles"

# Font folder path
FOLDER="$HOME/.local/share/"
FONT_FOLDER_NAME=$(basename "$FOLDER")

# Fastfetch configuration file path
FASTFETCH_CONF_DIR="$HOME/.config/fastfech/"

#+---------------------------------------------------------+
#| ############ FUNCTIONS ############                     |
#+---------------------------------------------------------+

# Show the user that a task got completed
logCompletion() {
	local Green='\033[0;32m'
	echo -e "✅${Green}%s $1 ${OFF}"
}

# Show the user information
logInfo() {
	local White='\033[0;37m'
	echo -e "ℹ️${White}%s $2 ${OFF}"
}

# Show the user that an error has occurred on the system
logError() {
	local Red='\033[0;31m'
	echo -e "❌${Red}%s $3 ${OFF}"
}

# Show the user what actions need to be taken
logAlert() {
	local Yellow='\033[0;33m'
	echo -e "🚨${Yellow}%s $4 ${OFF}"
}

#+---------------------------------------------------------+
#| ############ THE SCRIPT ############                  |
#+---------------------------------------------------------+

# Stop the script immediately if any error occurs
set -e

# My logo
echo -e " $Blue
    _      _____   _          _      ____        ____     ___    _____   _____   ___   _       _____   ____  
   / \    |_   _| | |        / \    / ___|      |  _ \   / _ \  |_   _| |  ___| |_ _| | |     | ____| / ___| 
  / _ \     | |   | |       / _ \   \___ \      | | | | | | | |   | |   | |_     | |  | |     |  _|   \___ \ 
 / ___ \    | |   | |___   / ___ \   ___) |     | |_| | | |_| |   | |   |  _|    | |  | |___  | |___   ___) |
/_/   \_\   |_|   |_____| /_/   \_\ |____/      |____/   \___/    |_|   |_|     |___| |_____| |_____| |____/ 
$OFF"

echo -e "⭐$BYellow Identifing your system $OFF"

if [ "$(uname -s)" == "Linux" ]; then
	echo "This system is Linux."
	if [ -f /etc/os-release ]; then
		# shellcheck disable=SC1091
		. /etc/os-release
		if [ "$ID" == "cachyos" ]; then
			COMPUTER_OS="cachyos" # This OS is CachyOS
		else
			# This is not a Linux machine
			logError "This is another Linux distribution: $PRETTY_NAME"
		fi
	fi
else
	# I can't identify your system
	logError "It is not safe to run this script on your system."

	# In theory, this next line should NEVER be executed
	exit 1
fi

if [[ "$COMPUTER_OS" == "cachyos" ]]; then

	# This is a CachyOS machine
	logInfo "Your system is CachyOS, updating packages..."

	# Updating the system
	sudo pacman -Syu --noconfirm

	# Installing the programs
	logInfo "Installing programs..."
	sudo pacman -S --needed --noconfirm neovim vlc vlc-plugins-all starship clamav ghostty vivaldi libreoffice-fresh tmux yazi keepassxc lazygit mysql-workbench fastfetch

	# Finishing install message
	logCompletion "Installating completed"

	# Verifying if yay is installed
	if command -V yay &>/dev/null; then
		logAlert "yay is already installed, no actions will be taken"
	else
		# Installing yay
		logError "Yay is not installed"

		logInfo "Installing Yay now..."
		cd "$HOME"
		git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd $HOME

		logCompletion "Yay was installed successfully"

		# Installing programs with yay
		logAlert "Installing programs with yay"
		yay -S --noconfirm visual-studio-code-bin lunacy-bin insomnia-bin
	fi

	# Verifing if fisher is installed
	if command -V fisher &>/dev/null; then
		logInfo "Fisher is installed"
	else
		logInfo "Fisher is not installed, installing..."
		sudo pacman -S --noconfirm fisher
		logCompletion "Fisher installed"
	fi

	# Checking if LazyVim is already installed
	if [ -d "$LAZY_VIM_DIR" ]; then
		logAlert "Verifing if LazyVim is installed..."
		if [ -f "$LAZY_VIM_DIR/init.lua" ]; then
			logInfo "Lazy is installed, installing plugins..."

			# Verifying if the plugin's folder exists
			if [ -d "$LAZY_VIM_DIR/lua/plugins" ]; then
				# Deleting the existent folder
				rm -rf "$LAZY_VIM_DIR/lua/plugins"

				# Adding my folder
				ln -s "$DOTFILES_DIR/neovim/" "$LAZY_VIM_DIR/lua/"
				logCompletion "Plugins successfully installed"
			fi
		fi
	else
		# It seems LazyVim is not installed
		# Installing LazyVim
		logAlert "Lazy is not installed, installing now..."

		git clone https://github.com/LazyVim/starter ~/.config/nvim
		rm -rf ~/.config/nvim/.git
		logCompletion "LazyVim successfully installed"

		# Removing the current plugin folder and linking the new one
		logAlert "Removing the plugins..."
		rm -rf "$LAZY_VIM_DIR/lua/plugins"
		logAlert "Adding the new folder..."
		ln -s "$DOTFILES_DIR/neovim/plugins/" "$LAZY_VIM_DIR/lua/"
		logCompletion "Plugin's folder successfully added"
	fi

	#+---------------------------------------------------------+
	#| ############ LINKING FILES ############                 |
	#+---------------------------------------------------------+

	# Adding the image folder into the system
	logInfo "Adding the wallpaper folder to the system..."
	rm -rf "$HOME/Pictures/*"
	ln -s "$IMAGES_DIR" "$HOME/Pictures/Images"
	logCompletion "Wallpaper folder added successfully"

	# Removing the current ghostty configuration file and linking it to the new one
	logAlert "Removing the current ghostty configuration file and linking the new one..."
	if [ -e "$HOME/.config/ghosty/config.ghostty"]; then
		logAlert "A ghostty configuration file was found, deleting it..."
		rm "$HOME/.config/ghostty/config.ghostty"
		logAlert "Adding the new configuration file"
		ln -s "$DOTFILES_DIR/ghostty/config" "$HOME/.config/ghostty/"
		logCompletion "New configuration added"
	elif [[ ! -d "$HOME/.config/ghostty" ]]; then
		logAlert "No Ghostty folder found, adding the folder and the configuration file..."
		mkdir "$HOME/.config/ghostty"
		ln -s "$DOTFILES_DIR/ghostty/config" "$HOME/.config/ghostty/"
	fi

	rm "$HOME/.config/ghostty/config"
	ln -s "$SCRIPT_DIR/ghostty/config" "$HOME/.config/ghostty/"
	logCompletion "Ghostty configuration file added successfully"

	# Removing the current fish configuration file and linking the new one
	logAlert "Deleting the current fish configuration file and adding the new one..."
	rm "$HOME/.config/fish/config.fish"
	ln -s "$SCRIPT_DIR/fish/config.fish" "$HOME/.config/fish/config.fish"
	logCompletion "Fish configuration file successfully added"

	# Deleting a possible .tmux.conf file and linking to the new one
	if [ -f "$HOME/.tmux.conf" ]; then
		logAlert "A tmux configuration file was found, deleting it..."
		rm "$HOME/.tmux.conf"
		logInfo "Adding the new .tmux.conf"
		ln -s "$SCRIPT_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
		logCompletion ".tmux.conf successfully added"
	else
		# It seems no .tmux.conf is on the system's home directory, then it'll link directly to the Dotfiles tmux configuration
		logAlert "Adding the tmux configuration file..."
		ln -s "$SCRIPT_DIR/tmux/.tmux.conf" "$HOME/"
		logCompletion ".tmux.conf successfully added"
	fi

	# Verifying if a font folder exists on the system
	# And adding the new fonts

	if [ -d "$HOME/.local/share/fonts" ] || [ -d "$HOME/.local/share/font" ]; then
		logAlert "A font folder was found, adding the new fonts..."

		# Checking the font folder name and adding the fonts
		if [ "$FONT_FOLDER_NAME" == "fonts" ] || [ "$FONT_FOLDER_NAME" == "font" ]; then
			logAlert "Ading the new fonts..."
			ln -s "$SCRIPT_DIR/fonts/*" "$HOME/.local/share/$FONT_FOLDER_NAME"
			logCompletion "New fonts added successfully"
		fi
	else
		# No font folder was found, creating folder and adding the fonts
		logAlert "No font folder found, creating it..."
		logInfo "Adding the new fonts"
		ln -s "$SCRIPT_DIR/fonts/" "$HOME/.local/share/"
		# ln -s "$SCRIPT_DIR/fonts/*" "$HOME/.local/sahre/fonts/"
		logCompletion "New fonts added successfully"
	fi

	# Verifying if there is a fastfetch configuration file on the system
	# And verifying the configuration folder
	if [ -d "$FASTFETCH_CONF_DIR" ]; then
		logAlert "Deleting the current configuration file and adding the new one..."
		rm "$FASTFETCH_CONF_DIR/config.jsonc"
		ln -s "$SCRIPT_DIR/fastfetch" "$FASTFETCH_CONF_DIR/config.jsonc"
		logCompletion "New fastfetch configuration file added successfully"
	else
		# It seems there is no fastfetch directory
		logAlert "There is no fastfetch configuration folder, creating it..."
		mkdir "$HOME/.config/fastfetch"
		logInfo "Linking the configuration file"
		ln -s "$SCRIPT_DIR/fastfetch/config.jsonc" "$FASTFETCH_CONF_DIR/config.jsonc"
		logCompletion "Fastfetch configuration file added successfully"
	fi

	# Verifing if NVM is installed
	if command -V nvm &>/dev/null; then
		logInfo "NVM is already installed"
	else
		# NVM alert
		logAlert "NVM is not installed."
		logAlert "Open another termianl window and run this commands:"
		logInfo "fisher install FabioAntunes/fish-nvm edc/bass"
	fi

	# Menssage to install TokyoNight themes for fish shell
	logAlert "Run this commands in a new terminal window to install TokyoNight themes for fish shell"
	logInfo "fisher install vitallium/tokyonight-fish"

	# Finishing all installation
	logCompletion "All setup fished"
	echo "Enjoi your new system 😉"
fi
