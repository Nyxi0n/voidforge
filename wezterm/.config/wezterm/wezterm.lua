-- Mistress Luna’s tailored WezTerm configuration
-- Primary font: Maple Mono NF Medium, fallback JetBrains Mono & Hack, size 12
-- Incorporates Rosé Pine (Soho vibes) theme from neapsix/wezterm

local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Enable Wayland
config.enable_wayland = true

-- Hide tab bar when only one tab
config.hide_tab_bar_if_only_one_tab = true

-- Font configuration: Maple Mono NF (Medium), then JetBrains Mono, then Hack
config.font = wezterm.font_with_fallback({
	{
		family = "Maple Mono NF",
		weight = "Medium", -- Medium face
		style = "Normal",
		stretch = "Normal",
	},
	"JetBrains Mono",
	"Hack",
})

-- Font size
config.font_size = 12.0

-- Rosé Pine theme integration via plugin
local theme = wezterm.plugin.require("https://github.com/neapsix/wezterm").main
config.colors = theme.colors()
config.window_frame = theme.window_frame() -- needed for fancy tab bar
config.use_fancy_tab_bar = true

-- Adjust opacity
config.window_background_opacity = 0.75

-- Tab bar styling (overrides from theme if needed)
config.window_padding = { left = 10, right = 10, top = 10, bottom = 10 }

-- Cursor style & blinking
config.default_cursor_style = "BlinkingUnderline"
config.cursor_blink_rate = 500

-- Terminal type & performance
config.term = "xterm-256color"
config.max_fps = 120
config.animation_fps = 30

-- Keybindings (ALT-based for tabs & panes)
config.keys = {
	-- Tabs
	{ key = "t", mods = "ALT", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ key = "w", mods = "ALT", action = wezterm.action.CloseCurrentTab({ confirm = false }) },
	{ key = "n", mods = "ALT", action = wezterm.action.ActivateTabRelative(1) },
	{ key = "p", mods = "ALT", action = wezterm.action.ActivateTabRelative(-1) },
	-- Panes
	{ key = "v", mods = "ALT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "h", mods = "ALT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "q", mods = "ALT", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
	-- Pane navigation
	{ key = "LeftArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "UpArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Down") },
}

-- Suppress missing glyph warnings
config.warn_about_missing_glyphs = false

return config
