# 🕯️ ── Nightshade Invocation: zInit Summoning ── 🕯️

# 🌑 Define the crypt where zInit slumbers (XDG‐compliant)
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# 🦇 If the crypt is empty, awaken the beast…
if [[ ! -d $ZINIT_HOME ]]; then
  mkdir -p "${ZINIT_HOME%/*}"    # Carve the tombstone
  git clone --quiet \
    https://github.com/zdharma-continuum/zinit.git \
    "$ZINIT_HOME"               # Whisper the incantation
fi

# 🕸️ Bind the spirit of zInit to your shell…
source "$ZINIT_HOME/zinit.zsh"

# 🦇 ── Midnight Zsh Essentials: Arcane Plugins ── 🦇

# 🕷️ Summon ethereal aids to your command line…
zinit light zsh-users/zsh-syntax-highlighting   # Enchant your text with spectral color  
zinit light zsh-users/zsh-completions          # Invoke hidden completions from the void  
zinit light zsh-users/zsh-autosuggestions      # Hear whispered suggestions in the dark  
zinit light Aloxaf/fzf-tab                     # Bend fzf’s fate to your fingertips  


# 🕯️ ── Midnight OMZ Invocation: Arcane Snippets ── 🕯️

# 🦇 Call forth the sacred OMZ powers…
zinit snippet OMZP::git             # Bind Git’s might to your will  
zinit snippet OMZP::sudo            # Cloak commands in elevated shadows  
zinit snippet OMZP::archlinux       # Whisper Arch rites into your flow  
# zinit snippet OMZP::aws           # Summon AWS spectres (commented)  
# zinit snippet OMZP::kubectl       # Commune with Kubernetes phantoms (commented)  
# zinit snippet OMZP::kubectx       # Traverse K8s realms mindfully (commented)  
zinit snippet OMZP::command-not-found  # Invoke gentle guidance from the abyss  
zinit snippet OMZP::direnv          # Enshroud your environment in harmony  

# 🕸️ Awaken completion spirits…
autoload -U compinit && compinit

# 🖤 Replay your ritual’s echoes…
zinit cdreplay -q

# 🦇 ── Moonlit Keybindings & Ancestral History ── 🦇

# 🕷️ Bind the runes of navigation…
bindkey -e                              # Embrace the Emacs-style incantation  
bindkey '^n' history-search-forward    # Summon the next echo from the void  
bindkey '^p' history-search-backward   # Invoke the previous whisper from shadow  

# 🕯️ Carve your chronicles into the eternal grimoire…
HISTSIZE=5000                          # A vault of 5,000 spectral entries  
HISTFILE=~/.zsh_history                # The ever-present tome of your commands  
SAVEHIST=$HISTSIZE                     # Inscribe upon exit… preserve every echo  
HISTDUP=erase                          # Exile duplicate whispers to oblivion  

# 🖤 Rituals of remembrance…
setopt appendhistory       # Append to the chronicle, never replace  
setopt sharehistory        # Share memories across every spectral session  
setopt hist_ignore_all_dups   # Banish all duplicate echoes from the annals  
setopt hist_save_no_dups      # Save only unique whispers in the tome  
setopt hist_ignore_dups       # Ignore echoes that have already been uttered  
setopt hist_ignore_space      # Silence entries that begin with a solemn space  

# 🕯️ ── Midnight Completion & fzf-tab Ritual ── 🕯️
# 🦇 Ethereal matching and hues for a spectral completion flow…

# 🌑 Case-obliterating matching across the abyss
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# 🕸️ Draping suggestions in the twilight colors of LS_COLORS
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# 🦉 Silence the chorus—keep the menu veiled
zstyle ':completion:*' menu no

# 🕷️ fzf-tab “cd” preview through the mist with enchanted `ls` hues
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# 🕸️ zoxide directory visions, unveiled with spectral preview
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# 🖤 ── Arcane Shell Integrations ── 🖤

# 🌑 Summon fzf’s phantom finder
eval "$(fzf --zsh)"

# 🦇 Invoke zoxide’s path-walking specter
eval "$(zoxide init --cmd cd zsh)"

