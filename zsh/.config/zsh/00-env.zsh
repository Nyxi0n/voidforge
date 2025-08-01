# 🕯️ ── Midnight Environment: Arcane Foundations ── 🕯️

# 🌑 XDG Sanctuaries (Config, Data, Cache, State)
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

# 🖤 Editor & Visual incantations
export EDITOR="nvim"
export VISUAL="nvim"

export DOOMDIR="$HOME/.config/doom"
export EMACSDIR="$HOME/.config/emacs"


# 🦇 Locale whispers for universal tomes
#export LANG="en_US.UTF-8"
#export LC_ALL="en_US.UTF-8"

# 🦇 Ghostly terminal hues
#export TERM="kitty"
export TERM="xterm-ghostty"    # Uncomment to summon the ghostly xterm

# 🌿 Gentle history: ignore trivial echoes
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..|shutdown)"

# 🌱 Optional Dotbare sanctum (uncomment to activate)
# export DOTBARE_DIR="$HOME/.dotfiles"
# export DOTBARE_TREE="$HOME"

# ⚔️ Doom Emacs sanctum (uncomment if you dare)
# export DOOMDIR="$HOME/.config/doom/"
