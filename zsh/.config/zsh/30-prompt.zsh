# 🕯️ ── Zenful Prompt: oh-my-posh Invocation ── 🕯️

# 🌱 Initialize oh-my-posh in zsh with your chosen theme
eval "$($HOME/.local/bin/oh-my-posh init zsh --config $HOME/.config/oh-my-posh/zen.toml)"

# 🕯️ Direnv: Hook into Zsh’s lifecycle
eval "$(direnv hook zsh)"

# Pokefetch
pokefetch
