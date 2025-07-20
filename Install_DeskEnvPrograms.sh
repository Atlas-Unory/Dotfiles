#  /$$$$$$$                                                                         
# | $$__  $$                                                                        
# | $$  \ $$ /$$$$$$   /$$$$$$   /$$$$$$   /$$$$$$  /$$$$$$  /$$$$$$/$$$$   /$$$$$$$
# | $$$$$$$//$$__  $$ /$$__  $$ /$$__  $$ /$$__  $$|____  $$| $$_  $$_  $$ /$$_____/
# | $$____/| $$  \__/| $$  \ $$| $$  \ $$| $$  \__/ /$$$$$$$| $$ \ $$ \ $$|  $$$$$$ 
# | $$     | $$      | $$  | $$| $$  | $$| $$      /$$__  $$| $$ | $$ | $$ \____  $$
# | $$     | $$      |  $$$$$$/|  $$$$$$$| $$     |  $$$$$$$| $$ | $$ | $$ /$$$$$$$/
# |__/     |__/       \______/  \____  $$|__/      \_______/|__/ |__/ |__/|_______/ 
#                               /$$  \ $$                                           
#                              |  $$$$$$/                                           
#                               \______/ 

#!/bin/bash

# Updating the system
sudo pacman -Syu

# Installing the programs
sudo pacman -S git gimp qbittorrent discord manuskript kdenlive virtualbox xournalpp vlc okular

# Installing yay helper
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd $HOME

# Installing Brave browser
yay -S brave-bin

# Installing Spotify
yay -S spotify

# Finishing the script
echo "Installation complete" 