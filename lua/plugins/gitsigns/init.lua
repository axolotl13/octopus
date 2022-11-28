local ok_gitsigns, gitsigns = pcall(require, "plugins.gitsigns.config")
local ok_keybinds, keybinds = pcall(require, "plugins.gitsigns.keybinds")
if not ok_gitsgins and ok_keybinds then return end

