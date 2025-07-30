# 🕯️ ── Midnight General Aliases: Gothic Hacker’s Boon ── 🕯️

# 🦇 Clear the Veil (and screen)
alias c='clear'

# 🕸️ Summon System Echoes
alias nf='pokefetch'    # Whisper system stats  
alias pf='pokefetch'  
alias ff='pokefetch'  

# 🌑 Peaceful Oblivion
alias shutdown='systemctl poweroff'  # End the ritual  

# 🖤 Invoke the Arcane Editors
alias emacs='$VISUAL'   # Open the grand tome  
alias e='$VISUAL'  
alias ec='$EDITOR'      # Carve new incantations  
alias vim='nvim'        # Replace relics with neovim  
alias v='nvim'  

# 🕯️ Emacs Rebirth Ritual
emacs-restart() {
  if pgrep -u "$USER" emacs >/dev/null; then
    echo "🦇 Emacsy is already awake… resealing the pact."
    emacsclient -e "(kill-emacs)"  
    sleep 1
    /usr/bin/emacs --daemon &  
    notify-send "🔁 Emacs Reborn" "The daemon rises anew from shadow."  
  else
    echo "🌑 Emacsy slumbers no more… conjuring the daemon."
    /usr/bin/emacs --daemon &  
    notify-send "🚀 Emacs Summoned" "Daemon awakened in the abyss."  
  fi
}
alias emacs-daemon='/usr/bin/emacs --daemon &'

# 🦇 Transform the Familiar
alias cat='bat'    # Bat replaces the cat in the night  

# 🌙 Gather Media from the Abyss
alias YT='yt-dlp -U'
alias yt='yt-dlp -U'

# 🕸️ ── Gothic Dotfile Rites ── 🕸️

alias dot="git -C $HOME/VoidForge"
alias dotconfig="cd $HOME/VoidForge"

alias ds="dot status"
alias da="dot add"

# 🌸 Commit with mindful message
alias dc="dot commit -s -S -m \"\$(echo -n 'Commit message: ' && read message && echo \$message)\""

# 🍃 Commit & push in one breath
alias dcp="dot commit -s -S -m \"\$(echo -n 'Commit message: ' && read message && echo \$message)\" && dot push"

# 🍓 Commit (signed) & push to BOTH in one go
alias dcpa="dot commit -s -S -m \"\$(echo -n 'Commit message: ' && read message && echo \$message)\" && dpa"


# 🌼 Push, Pull & Stash flows
alias dp="dot push"
alias dpl="dot pull"
alias dst="dot stash"
alias dsp="dot stash; dot pull"

# 🍂 Checkout & credential helper
alias dcheck="dot checkout"
alias dcredential="dot config credential.helper store"

# 🌟 Push NyxDots to GitHub & GitLab in one go
# 🍭 Push NyxDots to BOTH GitHub & GitLab
dpa() {
  local branch
  branch=$(dot rev-parse --abbrev-ref HEAD)
  echo "➤ Pushing '$branch' to GitHub…"
  dot push github "$branch"
  echo "➤ Pushing '$branch' to GitLab…"
  dot push gitlab "$branch"
}

# 🌑 ── Gothic Git Aliases ── 🌑
# 🌱 Check your path (status)
alias gs="git status"

# 🌸 Stage changes gently
alias ga="git add"
#alias gac="git add . && git commit -s -S -m \"\$(echo -n 'Commit message: ' && read message && echo \$message)\""

# 🍃 Commit with intention
alias gc="git commit -s -S -m \"\$(echo -n 'Commit message: ' && read message && echo \$message)\""

# 🌼 Push your work to the world
alias gp="git push"
alias gpa="git push origin main && git push gitlab main"
#alias gpas="~/.local/bin/gpas.sh"

# 🍂 Bring in changes
alias gpl="git pull"

# 🌿 Tuck away progress (stash)
alias gst="git stash"
alias gsp="git stash; git pull"

# 🧘♀️ Switch branches mindfully
alias gcheck="git checkout"

# 🍃 Remember your credentials
alias gcredential="git config credential.helper store"

# 🌿 ── System Rites ── 🌿
alias PU='paru -Sy'          # Refresh package grimoire  
alias PUS='paru -Syu'        # Full arch update  
alias pus='pacman -Syuu'     # Pacman path cleansing  

alias PS='paru'              # Seek new spells  
alias PI='paru -S --needed'  # Install only true artifacts  

# 🌸 ── Eza: Enchanted Listings ── 🌸
alias ls='eza -al --color=always --group-directories-first'  
alias la='eza -a --color=always --group-directories-first'  
alias ll='eza -l --color=always --group-directories-first'  
alias lt='eza -aT --color=always --group-directories-first'  
alias l.='eza -al --color=always --group-directories-first ../'  
alias l..='eza -al --color=always --group-directories-first ../../'  
alias l...='eza -al --color=always --group-directories-first ../../../'  

