if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Stopping fish greeting
set fish_greeting ""

# Starship prompt init
starship init fish | source

# homebrew init config
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# eza icons config
alias eza="eza  --icons=always"

# Yazi shell wrapper
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# Vscode super alias
# alias code-root='sudo code --no-sandbox --user-data-dir=/root/.vscode-root'
