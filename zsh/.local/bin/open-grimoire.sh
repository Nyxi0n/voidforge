# Save as ~/bin/open-grimoire.sh
#!/usr/bin/env bash
# 🕯️ Reset the Emacs submap, then open your Grimoire.org in one Emacs frame

# Reset the Hyprland submap
hyprctl dispatch submap reset

# Launch (or connect) to Emacs with daemon fallback
emacsclient -c -a "emacs --daemon" "$HOME/VoidForge/emacs/.config/emacs/Grimoire.org"
