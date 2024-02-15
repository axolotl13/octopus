return {
  "linux-cultist/venv-selector.nvim",
  dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
  init = function()
    vim.api.nvim_create_autocmd("VimEnter", {
      desc = "Auto select virtualenv",
      pattern = "*",
      callback = function()
        local venv = vim.fn.finddir("venv", vim.fn.getcwd() .. ";")
        if venv ~= "" then
          require("venv-selector").retrieve_from_cache()
        end
      end,
      once = true,
    })
  end,
  keys = { { "<leader>vv", "<cmd>VenvSelect<cr>", desc = "[Venv] Selecciona el entorno virtual de Python" } },
  opts = { name = { "venv", ".venv" } },
}
