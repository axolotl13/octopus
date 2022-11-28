local ok, keybinds = pcall(require,"core.functions")
if not ok then return end

local opts = {
  { mode = {"n"}, lhs = "<leader>bi", rhs = "<cmd>BufferLineSortByDirectory<cr>", options = {silent = true}, desc = "Ordernar buffer por directorio" },
  { mode = {"n"}, lhs = "<leader>be", rhs = "<cmd>BufferLineSortByExtension<cr>", options = {silent = true}, desc = "Ordernar buffer por extensiones" },
  { mode = {"n"}, lhs = "<A-right>", rhs = "<cmd>BufferLineMoveNext<cr>", options = {silent = true}, desc = "Mover buffer hacía la derecha" },
  { mode = {"n"}, lhs = "<A-left>", rhs = "<cmd>BufferLineMovePrev<cr>", options = {silent = true}, desc = "Mover buffer hacía la izquierda" },
  { mode = {"n"}, lhs = "<C-z>", rhs = function() vim.cmd("BufferLineCloseRight") vim.cmd("BufferLineCloseLeft") end, options = {silent = true}, desc = "Cerrar todos los bufferes excepto la actual" },
  { mode = {"n"}, lhs = "<A-1>", rhs = "<cmd>BufferLineGoToBuffer 1<cr>", options = {silent = true}, desc = "Mover al primer buffer" },
  { mode = {"n"}, lhs = "Ñ", rhs = "<cmd>BufferLinePick<cr>", options = {silent = true}, desc = "Pickear en bufferes actuales" }
}

keybinds.load_keybinds(opts)
