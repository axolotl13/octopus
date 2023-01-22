return {
  "williamboman/mason.nvim",
  dependencies = {
    { "williamboman/mason-lspconfig.nvim" }
  },
  config = function()
    local mason = require("mason")
    local mason_lsp = require("mason-lspconfig")
    local icons = require("ui.icons")

    local settings = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = icons.lsp.install,
          package_pending = icons.lsp.pending,
          package_uninstalled = icons.lsp.uninstall,
        },
        keymaps = {
          install_package = "i",
          update_package = "u",
          uninstall_package = "d",
          cancel_installation = "<C-c>",
        }
      },
      log_level = vim.log.levels.INFO,
      max_concurrent_installers = 4,
    }

    mason.setup(settings)
    mason_lsp.setup({
      automatic_installation = true
    })

  end,
  keys = { { "<leader>m", "<cmd>Mason<cr>", desc = "Mason" } },
}
