return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = {
        text = require("ui.icons").signs.add,
      },
      change = {
        text = require("ui.icons").signs.add,
      },
      delete = {
        text = require("ui.icons").signs.add,
      },
      topdelete = {
        text = require("ui.icons").signs.add,
      },
      changedelete = {
        text = require("ui.icons").signs.add,
      },
      untracked = {
        text = require("ui.icons").signs.add,
      },
    },
    signcolumn = true,
    numhl = false,
    linehl = false,
    word_diff = false,
    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },
    attach_to_untracked = false,
    current_line_blame = false,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol",
      delay = 1000,
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
      col = 1,
    },
    yadm = {
      enable = false,
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      map("n", "<leader>gr", gs.reset_buffer, "[Gitsigns] Deshacer todos los cambios del archivo actual")
      map("n", "<leader>gs", gs.stage_buffer, "[Gitsigns] Poner la línea actual en el área de stage")
      map("n", "<leader>gu", gs.reset_hunk, "[Gitsigns] Deshacer cambios en la línea actual")
      map("n", "<leader>gp", gs.preview_hunk, "[Gitsigns] Previsualizar cambios que se han hecho")
      map("n", "<leader>g{", gs.next_hunk, "[Gitsigns] Moverse hacía el siguiente cambio que se ha realizado")
      map("n", "<leader>g}", gs.prev_hunk, "[Gitsigns] Moverse hacía el anterior cambio que se ha realizado")
      map("n", "<leader>gd", gs.diffthis, "[Gitsigns] Ver los cambios posteriores que se habían hecho")
      map("n", "<leader>gq", gs.undo_stage_hunk, "[Gitsigns] Salir en el área de stage en la línea actual")
      map("n", "<leader>gl", gs.toggle_current_line_blame, "[Gitsigns] Habilitar línea de cambios por usuario")
      map("n", "<leader>gh", gs.toggle_deleted, "[Gitsigns] Ver las líneas borradas")
      map("n", "<leader>gn", gs.toggle_numhl, "[Gitsigns] Pintar numeros")
    end,
  },
}
