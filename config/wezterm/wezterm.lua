local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback({'CaskaydiaCove Nerd Font'})
config.font_size = 13
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.6
config.wayland_window_background_blur = true
config.window_close_confirmation = "NeverPrompt"
config.disable_default_key_bindings = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.keys = {
	{ key = "C", mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
	{ key = "F", mods = "SHIFT|CTRL", action = act.Search("CurrentSelectionOrEmptyString") },
	{ key = "N", mods = "SHIFT|CTRL", action = act.SpawnWindow },
	{ key = "P", mods = "SHIFT|CTRL", action = act.ActivateCommandPalette },
	{ key = "T", mods = "SHIFT|CTRL", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "V", mods = "SHIFT|CTRL", action = act.PasteFrom("Clipboard") },
	{ key = "W", mods = "SHIFT|CTRL", action = act.CloseCurrentTab({ confirm = true }) },
	{ key = "X", mods = "SHIFT|CTRL", action = act.ActivateCopyMode },
}

config.key_tables = require("key_tables")

config.color_scheme = "Noctalia"
return config
