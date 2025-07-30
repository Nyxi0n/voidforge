# ~/.zshrc – VoidForge Loader

# XDG base
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# Load modular Zsh config
for file in "$XDG_CONFIG_HOME/zsh/"*.zsh; do
    [[ -r "$file" ]] && source "$file"
done

unset file

