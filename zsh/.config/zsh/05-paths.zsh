# 🕯️ ── Midnight Paths: Arcane Corridors ── 🕯️
# 🦇 Gracefully extend PATH & anchor core XDG spirits for the Gothic Hacker’s Den

# 🕸️ Personal & Local Binaries: your secret sanctuaries
for dir in \
    "$HOME/.bin" \
    "$HOME/.local/bin" \
    "$HOME/Grimoire/bin" \
    "$HOME/Grimoire/scripts" \
    "$HOME/Forge/bin" \
    "$HOME/Zendo/bin"
do
    [[ -d "$dir" ]] && PATH="$dir:$PATH"
done

# 🦇 Application Rites: summon GUI & CLI tools
[[ -d "$HOME/Applications" ]] && PATH="$HOME/Applications:$PATH"

# 🕷️ Spicetify Conjuration
[[ -d "$HOME/.spicetify" ]] && PATH="$HOME/.spicetify:$PATH"

# 🖤 Wine CachyOS Integration: bridge the Windows phantoms
if [[ -d "/opt/wine-cachyos/bin" ]]; then
    PATH="/opt/wine-cachyos/bin:$PATH"
    WINEDLLPATH="/opt/wine-cachyos/lib/wine:/opt/wine-cachyos/lib32/wine:$WINEDLLPATH"
    export LD_LIBRARY_PATH="/opt/wine-cachyos/lib:/opt/wine-cachyos/lib32:$LD_LIBRARY_PATH"
fi

# 🌑 Emacs XDG Sanctum
if [[ -d "$HOME/.config/emacs/bin" ]]; then
    PATH="$HOME/.config/emacs/bin:$PATH"
fi

# 🌿 Core XDG Foundations
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

# 🕯️ Final binding of your PATH
export PATH

