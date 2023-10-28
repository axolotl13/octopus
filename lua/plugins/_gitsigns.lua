return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  opts = {
    signs = {
      add = { text = "│" }, --┃
      change = { text = "│" },
      delete = { text = "│" },
      topdelete = { text = "│" },
      changedelete = { text = "│" },
      untracked = { text = "│" },
    },
    attach_to_untracked = false,
    current_line_blame = false,
    current_line_blame_opts = {
      delay = 1000,
      ignore_whitespace = true,
    },
    max_file_length = 20000,
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      map("n", "<leader>gg", gs.stage_hunk, "[Gitsigns] Poner la línea actual al stage")
      map("n", "<leader>gu", gs.reset_hunk, "[Gitsigns] Deshacer cambios en la línea actual")
      map("n", "<leader>ga", gs.stage_buffer, "[Gitsigns] Poner las líneas actuales en el área de stage")
      map("n", "<leader>gq", gs.undo_stage_hunk, "[Gitsigns] Salir en el área de stage en la línea actual")
      map("n", "<leader>gr", gs.reset_buffer, "[Gitsigns] Deshacer todos los cambios del archivo actual")
      map("n", "<leader>g{", gs.next_hunk, "[Gitsigns] Moverse hacía el siguiente cambio que se ha realizado")
      map("n", "<leader>g}", gs.prev_hunk, "[Gitsigns] Moverse hacía el anterior cambio que se ha realizado")
      map("n", "<leader>gp", gs.preview_hunk, "[Gitsigns] Previsualizar cambios que se han hecho")
      map("n", "<leader>gd", gs.diffthis, "[Gitsigns] Ver los cambios posteriores que se habían hecho")
      map("n", "<leader>gl", gs.toggle_current_line_blame, "[Gitsigns] Habilitar línea de cambios por usuario")
      map("n", "<leader>gh", gs.toggle_deleted, "[Gitsigns] Ver las líneas borradas")
      map("n", "<leader>gn", gs.toggle_numhl, "[Gitsigns] Pintar numeros")
    end,
  },
}
