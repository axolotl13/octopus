local M = {}

M.opts = {
  size = function(term)
    if term.direction == "horizontal" then
      return 10
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.5
    end
  end,
  direction = "horizontal",
  float_opts = {border = "curved"}
}

M.maps = {
  { mode = {"n"}, lhs = "<leader>ts", rhs = "<cmd>ToggleTerm<cr>", options = {silent = true}, desc = "Abrir nueva terminal en el buffer actual" },
  { mode = {"n"}, lhs = "<leader>tf", rhs = "<cmd>ToggleTerm direction=float<cr>", options = {silent = true}, desc = "Abrir nueva terminal en una ventana flotante" },
  { mode = {"n"}, lhs = "<leader>tb", rhs = "<cmd>ToggleTerm direction=tab<cr>", options = {silent = true}, desc = "Abrir nueva terminal en una pestaña" },
  { mode = {"n"}, lhs = "<leader>tt", rhs = "<cmd>ToggleTerm direction=vertical<cr>", options = {silent = true}, desc = "Iniciar Terminal verticalmente" },
  { mode = {"t"}, lhs = "<esc>", rhs = "<C-\\><C-n>", options = {silent = true}, desc = "Escapa de la terminal" }
}

M.start = function()

  local ok, terminal = pcall(require, "toggleterm")
  if not ok then return end
  
  local ok_keybinds, keybinds = pcall(require,"core.functions")
  if not ok_keybinds then return end

  terminal.setup(M.opts)

  keybinds.load_keybinds(M.maps)

end

return M
