local wezterm = require("wezterm")

local config = wezterm.config_builder()
config.font_size = 15
config.hide_tab_bar_if_only_one_tab = true

-- macOS IME swallows Ctrl+Space (tmux prefix) when enabled
config.use_ime = false

-- Force Ctrl+Space to send NUL (0x00) so tmux sees C-Space as prefix;
-- this wezterm version doesn't reliably send it, esp. on non-US layouts
config.keys = {
	{ key = "phys:Space", mods = "CTRL", action = wezterm.action.SendString("\x00") },
}

return config
