return {
  { "kylechui/nvim-surround", opts = {}, keys = { "ys", "ds", "cs" } },
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
  { "mfussenegger/nvim-jdtls", ft = "java" },
  { "tzachar/local-highlight.nvim", event = "VeryLazy", opts = {} },
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = {},
    keys = { { "<leader>nn", "<cmd>lua require('neogen').generate()<cr>", desc = "[Neogen] Generar anotaciones" } },
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = { user_default_options = { css = true } },
    keys = { { "<leader>cc", "<cmd>ColorizerToggle<cr>", desc = "[Colorizer] Habilitar highlighter" } },
  },
  {
    "chrisgrieser/nvim-spider",
    keys = {
      { "w", mode = { "n", "o", "x" }, "<cmd>lua require('spider').motion('w')<CR>", desc = "Spider-w" },
      { "e", mode = { "n", "o", "x" }, "<cmd>lua require('spider').motion('e')<CR>", desc = "Spider-e" },
      { "b", mode = { "n", "o", "x" }, "<cmd>lua require('spider').motion('b')<CR>", desc = "Spider-b" },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = "markdown",
    keys = {
      {
        "<leader>md",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "[MarkdownPreview] Muestra una vista previa del archivo en un navegador web",
      },
    },
  },
  {
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
  },
  {
    "CRAG666/code_runner.nvim",
    config = true,
    cmd = { "RunCode", "RunFile" },
    keys = {
      { "<f5>", "<cmd>RunCode<cr>", desc = "Ejecuta el código actual" },
      -- { "<leader>rf", "<cmd>RunFile<cr>", desc = "Ejecuta el código actual" },
    },
  },
  {
    "utilyre/sentiment.nvim",
    event = "VeryLazy",
    init = function()
      vim.g.loaded_matchparen = 1
    end,
    opts = {},
  },
  {
    "Cassin01/wf.nvim",
    lazy = true,
    keys = function()
      return {
        {
          "<Leader>",
          require "wf.builtin.which_key" { text_insert_in_advance = "<Leader>" },
          desc = "[wf] which-key /",
        },
      }
    end,
    opts = { theme = "space" },
  },
  {
    "folke/zen-mode.nvim",
    keys = { { "<leader>zz", "<cmd>ZenMode<cr>", desc = "[ZenMode] Habilitar ZenMode" } },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = { lsp = { progress = { enabled = false } } },
  },
  { "HakonHarnes/img-clip.nvim", ft = { "markdown", "html", "tex" }, opts = {} },
  -- { "mfussenegger/nvim-dap", event = "VeryLazy" },
  -- Vim plugins
  { "mg979/vim-visual-multi", keys = { "<c-n>", "<c-down>", "<c-up>", "<s-left>", "<s-right>" } },
  {
    "tpope/vim-fugitive",
    cmd = "Git",
    keys = { { "<leader>gc", "<cmd>Git commit<cr>", desc = "[Fugitive] Git commit" } },
  },
}
