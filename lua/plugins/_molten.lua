package.path = package.path .. ";" .. vim.fn.expand "$HOME" .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand "$HOME" .. "/.luarocks/share/lua/5.1/?.lua;"
-- pacman -Sy lua51
-- luarocks --local --lua-version=5.1 install magick

vim.g.python3_host_prog = vim.fn.expand "$HOME" .. "/Documentos/Python/Jupyter/venv/bin/python3"

return {
  "benlubas/molten-nvim",
  version = "^1.0.0",
  dependencies = {
    "3rd/image.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    ft = "markdown",
    opts = {
      integrations = {
        markdown = {
          clear_in_insert_mode = true,
          only_render_image_at_cursor = true,
        },
        neorg = { enabled = false },
      },
      max_width = 100,
      max_height = 30,
      max_height_window_percentage = math.huge,
      max_width_window_percentage = math.huge,
      window_overlap_clear_enabled = true,
    },
  },
  build = ":UpdateRemotePlugins",
  init = function()
    vim.g.molten_image_provider = "image.nvim"
    vim.g.molten_output_win_max_height = 20
  end,
  keys = {
    { "<leader>mi", "<cmd>MoltenInit<cr>", desc = "[Molten] Iniciar Molten" },
    { "<leader>mq", "<cmd>MoltenDeinit<cr>", desc = "[Molten] Cerrar Molten" },
    { "<leader>ml", "<cmd>MoltenNext<cr>", desc = "[Molten] Saltar al siguiente código" },
    { "<leader>mh", "<cmd>MoltenPrev<cr>", desc = "[Molten] Saltar al anterior código" },
    { "<leader>mr", "<cmd>MoltenEvaluateLine<cr>", desc = "[Molten] Evaluar línea actual" },
    { "<leader>mp", "<cmd>MoltenInit python3<cr>", desc = "[Molten] Iniciar Molten con Python" },
    { "<leader>mr", mode = "x", ":<c-u>MoltenEvaluateVisual<cr>gv", desc = "[Molten] Evaluar bloque" },
  },
}
