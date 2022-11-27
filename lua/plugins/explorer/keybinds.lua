local ok, keybinds = pcall(require,"core.functions")
if not ok then return end

local opts = {
  { mode = {"n"}, lhs = "ñ", rhs = "<cmd>NvimTreeToggle<cr>", options = {silent = true}, desc = "Explorador de archivos" },
}

keybinds.load_keybinds(opts)
