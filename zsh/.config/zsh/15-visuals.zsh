# 🕯️ ── Midnight Visuals: Gothic Aesthetic ── 🕯️
# 🦇 Enshrine your shell in rose-pine hues and spectral effects…

# 🌑 Truecolor & kitty communion
#export TERM="kitty"
export COLORTERM="truecolor"

# 🕸️ Rose-Pine palette via base16-shell (if installed)
if [[ -r "${HOME}/.config/base16-shell/scripts/base16-rose-pine.sh" ]]; then
  source "${HOME}/.config/base16-shell/scripts/base16-rose-pine.sh"
fi

# 🖤 LS_COLORS from your custom dircolors file (rose-pine edition)
[[ -f "${HOME}/.config/dircolors/rose-pine" ]] && eval "$(dircolors "${HOME}/.config/dircolors/rose-pine")"


# 🌑 GREP & LESS in spectral style  
export GREP_COLOR='01;38;5;108'  
export LESS_TERMCAP_mb=$'\e[01;31m'      # blinking  
export LESS_TERMCAP_md=$'\e[01;38;5;108m' # bold  
export LESS_TERMCAP_me=$'\e[0m'           # reset  
export LESS_TERMCAP_se=$'\e[0m'           # end standout  
export LESS_TERMCAP_so=$'\e[01;38;5;109m' # standout  
export LESS_TERMCAP_ue=$'\e[0m'           # end underline  
export LESS_TERMCAP_us=$'\e[04;38;5;110m' # underline  

# 🌿 FZF shimmer: truecolor support
export FZF_DEFAULT_OPTS="--ansi --color=fg:#a6adc8,bg:#232136,hl:#c4a7e7"

# 🕷️ Powerlevel10k prompt (if present)
if [[ -r "${HOME}/.local/share/powerlevel10k/powerlevel10k.zsh-theme" ]]; then
  source "${HOME}/.local/share/powerlevel10k/powerlevel10k.zsh-theme"
fi

