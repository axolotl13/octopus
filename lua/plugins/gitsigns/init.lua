local ok, icons = pcall(require, "ui.icons")
if not ok then return end

local M = {}

M.opts = {
  signs = {
    add = {
      hl = 'GitSignsAdd',
      text = icons.signs.add,
      numhl = 'GitSignsAddNr',
      linehl = 'GitSignsAddLn'
    },
    change = {
      hl = 'GitSignsChange',
      text = icons.signs.add,
      numhl = 'GitSignsChangeNr',
      linehl = 'GitSignsChangeLn'
    },
    delete = {
      hl = 'GitSignsDelete',
      text = icons.signs.add,
      numhl = 'GitSignsDeleteNr',
      linehl = 'GitSignsDeleteLn'
    },
    topdelete = {
      hl = 'GitSignsDelete',
      text = icons.signs.add,
      numhl = 'GitSignsDeleteNr',
      linehl = 'GitSignsDeleteLn'
    },
    changedelete = {
      hl = 'GitSignsChange',
      text = icons.signs.add,
      numhl = 'GitSignsChangeNr',
      linehl = 'GitSignsChangeLn'
    }
  },
  signcolumn = true,
  numhl = false,
  linehl = false,
  word_diff = false,
  watch_gitdir = {interval = 1000, follow_files = true},
  attach_to_untracked = false,
  current_line_blame = false,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol",
    delay = 1000
    -- ignore_whitespace = false,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil,
  max_file_length = 20000,
  preview_config = {
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  }
}

M.maps = {
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

M.start = function()

  local ok_gitsigns, gitsigns = pcall(require, "gitsigns")
  if not ok_gitsigns then return end

  local ok_keybinds, keybinds = pcall(require, "core.functions")
  if not ok_keybinds then return end

  gitsigns.setup(M.opts)

  keybinds.load_keybinds(M.maps)

end

return M
