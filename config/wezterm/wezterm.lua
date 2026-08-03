local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback({ "CaskaydiaCove Nerd Font" })
config.font_size = 13
config.line_height = 1.1
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.6
config.wayland_window_background_blur = true
config.window_close_confirmation = "NeverPrompt"
config.disable_default_key_bindings = true
config.adjust_window_size_when_changing_font_size = false
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
	{ key = "X", mods = "SHIFT|CTRL", action = act.ActivateCopyMode },
  { key = "W", mods = "SHIFT|CTRL", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "0", mods = "CTRL", action = act.ResetFontSize },
	{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
	{ key = "=", mods = "CTRL", action = act.IncreaseFontSize },
	{ key = "%", mods = "SHIFT|CTRL", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = '"', mods = "SHIFT|CTRL", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "LeftArrow", mods = "CTRL", action = act.ActivatePaneDirection("Left") },
	{ key = "DownArrow", mods = "CTRL", action = act.ActivatePaneDirection("Down") },
	{ key = "UpArrow", mods = "CTRL", action = act.ActivatePaneDirection("Up") },
	{ key = "RightArrow", mods = "CTRL", action = act.ActivatePaneDirection("Right") },
	{ key = "LeftArrow", mods = "SHIFT|CTRL", action = act.AdjustPaneSize({ "Left", 1 }) },
	{ key = "DownArrow", mods = "SHIFT|CTRL", action = act.AdjustPaneSize({ "Down", 1 }) },
	{ key = "UpArrow", mods = "SHIFT|CTRL", action = act.AdjustPaneSize({ "Up", 1 }) },
	{ key = "RightArrow", mods = "SHIFT|CTRL", action = act.AdjustPaneSize({ "Right", 1 }) },
	{ key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
	{ key = "Tab", mods = "SHIFT|CTRL", action = act.ActivateTabRelative(-1) },
}

config.key_tables = require("key_tables")

config.color_scheme = "Noctalia"
return config
