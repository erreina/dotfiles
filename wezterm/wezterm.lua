-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.color_scheme = "Catppuccin Macchiato"

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 12

-- config.enable_tab_bar = false

-- config.window_decorations = "RESIZE"

config.window_background_opacity = 1.0
config.macos_window_background_blur = 10

-- padding
config.window_padding = {
	left = 10,
	right = 10,
	top = 0,
	bottom = 0,
}

-- and finally, return the configuration to wezterm
return config
