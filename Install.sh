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
msg_success() {
	local Green='\033[0;32m'
	printf "✅ %b%s%b\n" "$Green" "$1" "${OFF}"
}

# Show the user information
msg_info() {
	local White='\033[0;37m'
	printf "ℹ️ %b%s%b" "$White" "$1" "${OFF}"
}

# Show the user that an error has occurred on the system
msg_error() {
	local Red='\033[0;31m'
	printf "❌ %b%s%b" "$Red" "$1" "${OFF}"
}

# Show the user what actions need to be taken
msg_warn() {
	local Yellow='\033[0;33m'
	printf "🚨 %b%s%b" "$Yellow" "$1" "${OFF}"
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

echo -e "⭐$Yellow Identifing your system $OFF"

if [ "$(uname -s)" == "Linux" ]; then
	echo "This system is Linux."
	if [ -f /etc/os-release ]; then
		# shellcheck disable=SC1091
		. /etc/os-release
		if [ "$ID" == "cachyos" ]; then
			COMPUTER_OS="cachyos" # This OS is CachyOS
		else
			# This is not a Linux machine
			msg_error "This is another Linux distribution: $PRETTY_NAME"
		fi
	fi
else
	# I can't identify your system
	msg_error "It is not safe to run this script on your system."

	# In theory, this next line should NEVER be executed
	exit 1
fi

if [[ "$COMPUTER_OS" == "cachyos" ]]; then

	# This is a CachyOS machine
	msg_info "Your system is CachyOS, updating packages..."

	# Updating the system
	sudo pacman -Syu --noconfirm

	# Installing the programs
	msg_info "Installing programs..."
	sudo pacman -S --needed --noconfirm neovim vlc vlc-plugins-all starship clamav typos ghostty vivaldi libreoffice-fresh tmux yazi keepassxc lazygit mysql-workbench fastfetch dbeaver shellcheck readest

	# Installing docker
	if [ "$(uname -m)" == "x86_64" ]; then
		msg_info "Your machine is x86_64"

		if command -V docker &>/dev/null; then
			echo "Verifying if Docker is installed on your machine"
			msg_info "Docker is already installed"
			if command -V docker-desktop &>/dev/null; then
				msg_info "Docker Desktop is already installed"
			else
				msg_warn "Docker Desktop is not installed"
				msg_warn "Installing Docker Desktop"
				wget https://download.docker.com/linux/static/stable/x86_64/docker-29.5.2.tgz -qO- | tar xvfz - docker/docker --strip-components=1
				sudo --noconfirm cp -rp ./docker /usr/local/bin/ && rm -r ./docker
				curl -L "https://desktop.docker.com/linux/main/amd64/227598/docker-desktop-x86_64.pkg.tar.zst?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64" -o "$HOME/Downloads/docker-desktop-x86_64.pkg.tar.zst"
				sudo --noconfirm pacman -U "$HOME/Downloads/docker-desktop-x86_64.pkg.tar.zst"
				msg_success "Docker installation finished"
			fi

			if command -V docker-compose &>/dev/null; then
				msg_info "Docker Compose is already installed"
			else
				msg_warn "Docker Compose is not installed on your machine"
				msg_warn "Installing Docker Compose"
				sudo pacman -S --noconfirm docker-compose
				msg_success "Docker Compose installation finished"
			fi
		else
			msg_warn "Docker is not installed on your machine"
			msg_warn "Installing Docker"
			sudo pacman -S --noconfirm docker docker-compose
			wget https://download.docker.com/linux/static/stable/x86_64/docker-29.5.2.tgz -qO- | tar xvfz - docker/docker --strip-components=1
			sudo --noconfirm cp -rp ./docker /usr/local/bin/ && rm -r ./docker
			curl -L "https://desktop.docker.com/linux/main/amd64/227598/docker-desktop-x86_64.pkg.tar.zst?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64" -o "$HOME/Downloads/docker-desktop-x86_64.pkg.tar.zst"
			sudo --noconfirm pacman -U "$HOME/Downloads/docker-desktop-x86_64.pkg.tar.zst"
			msg_success "Docker installation finished"
		fi
	else
		msg_error "Your machine is not x86_64"
		msg_error "You'll have to install Docker and Docker Compose manually"
	fi

	# Finishing install message
	msg_success "Installating completed"

	# Verifying if yay is installed
	if command -V yay &>/dev/null; then
		msg_warn "yay is already installed, no actions will be taken"
	else
		# Installing yay
		msg_error "Yay is not installed"

		msg_info "Installing Yay now..."
		cd "$HOME"
		git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd "$HOME"

		msg_success "Yay was installed successfully"

		# Installing programs with yay
		msg_warn "Installing programs with yay"
		yay -S --noconfirm visual-studio-code-bin lunacy-bin insomnia-bin spotify imhex-bin affine-bin
	fi

	# Verifing if fisher is installed
	if command -V fisher &>/dev/null; then
		msg_info "Fisher is installed"
	else
		msg_info "Fisher is not installed, installing..."
		sudo pacman -S --noconfirm fisher
		msg_success "Fisher installed"
	fi

	# Checking if LazyVim is already installed
	if [ -d "$LAZY_VIM_DIR" ]; then
		msg_warn "Verifing if LazyVim is installed..."
		if [ -f "$LAZY_VIM_DIR/init.lua" ]; then
			msg_info "Lazy is installed, installing plugins..."

			# Verifying if the plugin's folder exists
			if [ -d "$LAZY_VIM_DIR/lua/plugins" ]; then
				# Deleting the existent folder
				rm -rf "$LAZY_VIM_DIR/lua/plugins"

				# Adding my folder
				ln -s "$DOTFILES_DIR/neovim/" "$LAZY_VIM_DIR/lua/"
				msg_success "Plugins successfully installed"
			fi
		fi
	else
		# It seems LazyVim is not installed
		# Installing LazyVim
		msg_warn "Lazy is not installed, installing now..."

		git clone https://github.com/LazyVim/starter ~/.config/nvim
		rm -rf ~/.config/nvim/.git
		msg_success "LazyVim successfully installed"

		# Removing the current plugin folder and linking the new one
		msg_warn "Removing the plugins..."
		rm -rf "$LAZY_VIM_DIR/lua/plugins"
		msg_warn "Adding the new folder..."
		ln -s "$DOTFILES_DIR/neovim/plugins/" "$LAZY_VIM_DIR/lua/"
		msg_success "Plugin's folder successfully added"
	fi

	#+---------------------------------------------------------+
	#| ############ LINKING FILES ############                 |
	#+---------------------------------------------------------+

	# Adding the image folder into the system
	msg_info "Adding the wallpaper folder to the system..."
	rm -rf "$HOME/Pictures/*"
	ln -s "$IMAGES_DIR" "$HOME/Pictures/Images"
	msg_success "Wallpaper folder added successfully"

	# Removing the current ghostty configuration file and linking it to the new one
	msg_warn "Removing the current ghostty configuration file and linking the new one..."
	if [ -e "$HOME/.config/ghosty/config.ghostty" ]; then
		msg_warn "A ghostty configuration file was found, deleting it..."
		rm "$HOME/.config/ghostty/config.ghostty"
		msg_warn "Adding the new configuration file"
		ln -s "$DOTFILES_DIR/ghostty/config" "$HOME/.config/ghostty/"
		msg_success "New configuration added"
	elif [[ ! -d "$HOME/.config/ghostty" ]]; then
		msg_warn "No Ghostty folder found, adding the folder and the configuration file..."
		mkdir "$HOME/.config/ghostty"
		ln -s "$DOTFILES_DIR/ghostty/config" "$HOME/.config/ghostty/"
	fi

	rm "$HOME/.config/ghostty/config"
	ln -s "$SCRIPT_DIR/ghostty/config" "$HOME/.config/ghostty/"
	msg_success "Ghostty configuration file added successfully"

	# Removing the current fish configuration file and linking the new one
	msg_warn "Deleting the current fish configuration file and adding the new one..."
	rm "$HOME/.config/fish/config.fish"
	ln -s "$SCRIPT_DIR/fish/config.fish" "$HOME/.config/fish/config.fish"
	msg_success "Fish configuration file successfully added"

	# Deleting a possible .tmux.conf file and linking to the new one
	if [ -f "$HOME/.tmux.conf" ]; then
		msg_warn "A tmux configuration file was found, deleting it..."
		rm "$HOME/.tmux.conf"
		msg_info "Adding the new .tmux.conf"
		ln -s "$SCRIPT_DIR/tmux/.tmux.conf" "$HOME/"
		msg_success ".tmux.conf successfully added"
	elif [ -d "$HOME/.config/tmux/" ]; then
		msg_warn "A tmux configuration folder was found, delegting it..."
		rm "$HOME/.config/tmux"
		msg_info "Adding the new tmux file"
		mkdir "$HOME/.config/tmux"
		ln -s "$SCRIPT_DIR/tmux/.tmux.conf" "$HOME/.config/tmux"
	else
		# It seems no .tmux.conf is on the system's home directory, so it'll be linked to the home
		msg_warn "Adding the tmux configuration file..."
		ln -s "$SCRIPT_DIR/tmux/.tmux.conf" "$HOME/"
		msg_success ".tmux.conf successfully added"
	fi

	# Verifying if a font folder exists on the system
	# And adding the new fonts

	if [ -d "$HOME/.local/share/fonts" ] || [ -d "$HOME/.local/share/font" ]; then
		msg_warn "A font folder was found, adding the new fonts..."

		# Checking the font folder name and adding the fonts
		if [ "$FONT_FOLDER_NAME" == "fonts" ] || [ "$FONT_FOLDER_NAME" == "font" ]; then
			msg_warn "Ading the new fonts..."
			ln -s "$SCRIPT_DIR/fonts/*" "$HOME/.local/share/$FONT_FOLDER_NAME"
			msg_success "New fonts added successfully"
		fi
	else
		# No font folder was found, creating folder and adding the fonts
		msg_warn "No font folder found, creating it..."
		msg_info "Adding the new fonts"
		ln -s "$SCRIPT_DIR/fonts/" "$HOME/.local/share/"
		# ln -s "$SCRIPT_DIR/fonts/*" "$HOME/.local/sahre/fonts/"
		msg_success "New fonts added successfully"
	fi

	# Verifying if there is a fastfetch configuration file on the system
	# And verifying the configuration folder
	if [ -d "$FASTFETCH_CONF_DIR" ]; then
		msg_warn "Deleting the current configuration file and adding the new one..."
		rm "$FASTFETCH_CONF_DIR/config.jsonc"
		ln -s "$SCRIPT_DIR/fastfetch" "$FASTFETCH_CONF_DIR/config.jsonc"
		msg_success "New fastfetch configuration file added successfully"
	else
		# It seems there is no fastfetch directory
		msg_warn "There is no fastfetch configuration folder, creating it..."
		mkdir "$HOME/.config/fastfetch"
		msg_info "Linking the configuration file"
		ln -s "$SCRIPT_DIR/fastfetch/config.jsonc" "$FASTFETCH_CONF_DIR/config.jsonc"
		msg_success "Fastfetch configuration file added successfully"
	fi

	# Verifing if NVM is installed
	if command -V nvm &>/dev/null; then
		msg_info "NVM is already installed"
	else
		# NVM alert
		msg_warn "NVM is not installed."
		msg_warn "Open another termianl window and run this commands:"
		msg_info "fisher install FabioAntunes/fish-nvm edc/bass"
	fi

	# Menssage to install TokyoNight themes for fish shell
	msg_warn "Run this commands in a new terminal window to install TokyoNight themes for fish shell"
	msg_info "fisher install vitallium/tokyonight-fish"

	# Finishing all installation
	msg_success "All setup fished"
	echo "Enjoi your new system 😉"
fi
