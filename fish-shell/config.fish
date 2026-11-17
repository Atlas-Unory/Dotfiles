source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

starship init fish | source

# NVM default version
set --universal nvm_default_version lts

# Bat colors
set -gx BAT_THEME "Catppuccin Mocha"

# FZF
set -gx FZF_DEFAULT_OPTS "
-m
--preview 'bat --color=always {}'
--style full
--border
--border-label ' CachyOS '
--input-label ' Search '
--header-label ' File Type '
--list-label ' Result List'
--preview-label ' Preview '
--bind 'focus:+transform-header:file --brief {}'

--color 'border:#cdd6f4,label:#cdd6f4'
--color 'preview-border:#b4befe,preview-label:#ccccff'
--color 'list-border:#a6e3a1,list-label:#99cc99'
--color 'input-border:#f38ba8,input-label:#f5c2e7'
--color 'header-border:#89b4fa,header-label:#74c7ec'
"
# catppucin mocha colors paletts⏎
