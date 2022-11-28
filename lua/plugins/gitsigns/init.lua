local ok_config, config = pcall(require, "plugins.gitsigns.config")
local ok_keybinds, keybinds = pcall(require, "plugins.gitsigns.keybinds")
if not ok_config and ok_keybinds then return end

