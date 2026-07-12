source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

# Starship config
starship init fish | source

# NVM
set --universal nvm_default_version lts

# Bat
export BAT_THEME="Dracula"

# Start keychain and load your private key.
# if status is-interactive
#     keychain --eval minhachave_rsa | source
# end
