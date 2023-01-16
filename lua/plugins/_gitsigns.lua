return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  opts = {
    signs = {
      add = {
        hl = "GitSignsAdd",
        text = require("ui.icons").signs.add,
        numhl = "GitSignsAddNr",
        linehl = "GitSignsAddLn"
      },
      change = {
        hl = "GitSignsChange",
        text = require("ui.icons").signs.add,
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn"
      },
      delete = {
        hl = "GitSignsDelete",
        text = require("ui.icons").signs.add,
        numhl = "GitSignsDeleteNr",
        linehl = "GitSignsDeleteLn"
      },
      topdelete = {
        hl = "GitSignsDelete",
        text = require("ui.icons").signs.add,
        numhl = "GitSignsDeleteNr",
        linehl = "GitSignsDeleteLn"
      },
      changedelete = {
        hl = "GitSignsChange",
        text = require("ui.icons").signs.add,
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn"
      }
    },
    signcolumn = true,
    numhl = false,
    linehl = false,
    word_diff = false,
    watch_gitdir = {
      interval = 1000, follow_files = true
    },
    attach_to_untracked = false,
    current_line_blame = false,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol",
      delay = 500
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
  },
  keys = {
    { "<leader>gr", "<cmd>Gitsigns reset_buffer<cr>", desc = "[Gitsigns] Deshacer todos los cambios del archivo actual" },
    { "<leader>gs", "<cmd>Gitsigns stage_buffer<cr>", desc = "[Gitsigns] Poner la línea actual en el área de stage" },
    { "<leader>gu", "<cmd>Gitsigns reset_hunk<cr>", desc = "[Gitsigns] Deshacer cambios en la línea actual" },
    { "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "[Gitsigns] Previsualizar cambios que se han hecho" },
    { "<leader>g{", "<cmd>Gitsigns next_hunk<cr>",
      desc = "[Gitsigns] Moverse hacía el siguiente cambio que se ha realizado" },
    { "<leader>g}", "<cmd>Gitsigns prev_hunk<cr>",
      desc = "[Gitsigns] Moverse hacía el anterior cambio que se ha realizado" },
    { "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "[Gitsigns] Ver los cambios posteriores que se habían hecho" },
    { "<leader>gq", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "[Gitsigns] Salir en el área de stage en la línea actual" },
    { "<leader>gl", "<cmd>Gitsigns toggle_current_line_blame<cr>",
      desc = "[Gitsigns] Habilitar línea de cambios por usuario" },
    { "<leader>gh", "<cmd>Gitsigns toggle_deleted<cr>", desc = "[Gitsigns] Ver las líneas borradas" },
    { "<leader>gn", "<cmd>Gitsigns toggle_numhl<cr>", desc = "[Gitsigns] Pintar numeros" },
  }
}
