local ok, keybinds = pcall(require,"core.functions")
if not ok then return end

local opts = {
  { mode = {"n"}, lhs = "<leader>gr", rhs = "<cmd>Gitsigns reset_buffer<cr>", options = {silent = true}, desc = "Deshacer todos los cambios del archivo actual" },
  { mode = {"n"}, lhs = "<leader>gs", rhs = "<cmd>Gitsigns stage_buffer<cr>", options = {silent = true}, desc = "Poner la línea actual en el área de stage" },
  { mode = {"n"}, lhs = "<leader>gu", rhs = "<cmd>Gitsigns reset_hunk<cr>", options = {silent = true}, desc = "Deshacer cambios en la línea actual" },
  { mode = {"n"}, lhs = "<leader>gp", rhs = "<cmd>Gitsigns preview_hunk<cr>", options = {silent = true}, desc = "Previsualizar cambios que se han hecho" },
  { mode = {"n"}, lhs = "<leader>g{", rhs = "<cmd>Gitsigns next_hunk<cr>", options = {silent = true}, desc = "Moverse hacía el siguiente cambio que se ha realizado" },
  { mode = {"n"}, lhs = "<leader>g}", rhs = "<cmd>Gitsigns prev_hunk<cr>", options = {silent = true}, desc = "Moverse hacía el anterior cambio que se ha realizado" },
  { mode = {"n"}, lhs = "<leader>gd", rhs = "<cmd>Gitsigns diffthis<cr>", options = {silent = true}, desc = "Ver los cambios posteriores que se habían hecho" },
  { mode = {"n"}, lhs = "<leader>gq", rhs = "<cmd>Gitsigns undo_stage_hunk<cr>", options = {silent = true}, desc = "Salir en el área de stage en la línea actual" },
  { mode = {"n"}, lhs = "<leader>gl", rhs = "<cmd>Gitsigns toggle_current_line_blame<cr>", options = {silent = true}, desc = "Habilitar línea de cambios por usuario" },
  { mode = {"n"}, lhs = "<leader>gh", rhs = "<cmd>Gitsigns toggle_deleted<cr>", options = {silent = true}, desc = "Ver las líneas borradas" },
  { mode = {"n"}, lhs = "<leader>gn", rhs = "<cmd>Gitsigns toggle_numhl<cr>", options = {silent = true}, desc = "Pintar numeros" },
}

keybinds.load_keybinds(opts)
