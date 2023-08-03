return {
  {
    "ggandor/lightspeed.nvim",
    keys = { "f", "F", "s", "S", "t", "T" },
    opts = { substitute_chars = { ["\r"] = "ñ" } }, -- Enter end
  },
  {
    "kylechui/nvim-surround",
    -- keys = { "ysiw", "ys", "yss","ds", "cs" },
    event = "VeryLazy",
    config = true,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    ft = { "js", "jsx", "ts", "tsx", "css", "html" },
  },
  {
    "NvChad/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    ft = { "css", "html" },
    config = true,
    keys = { { "<leader>cc", "<cmd>ColorizerToggle<cr>", desc = "Habilitar ColorizerToggle" } },
  },
  {
    "SmiteshP/nvim-navic",
    opts = {
      icons = require("ui.icons").vscode,
      depth_limit = 5,
    },
    dependencies = {
      "neovim/nvim-lspconfig",
    },
  },
  {
    "rmagatti/session-lens",
    dependencies = {
      "rmagatti/auto-session",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      path_display = { "shorten" },
      -- theme = 'ivy',
      -- previewer = true
    },
    keys = {
      { "<a-z>", "<cmd>SearchSession<cr>", desc = "[Windows] Igualar ventanas" },
    },
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
  },
  {
    "chrisgrieser/nvim-spider",
    lazy = false,
    keys = {
      { "w", mode = { "n", "o", "x" }, "<cmd>lua require('spider').motion('w')<CR>", desc = "Spider-w" },
      { "e", mode = { "n", "o", "x" }, "<cmd>lua require('spider').motion('e')<CR>", desc = "Spider-e" },
      { "b", mode = { "n", "o", "x" }, "<cmd>lua require('spider').motion('b')<CR>", desc = "Spider-b" },
      { "ge", mode = { "n", "o", "x" }, "<cmd>lua require('spider').motion('ge')<CR>", desc = "Spider-ge" },
    },
  },
  -- Vim plugins
  {
    "tpope/vim-fugitive",
    cmd = "Git",
  },
  {
    "mg979/vim-visual-multi",
    keys = { "<c-n>", "<c-down>", "<c-up>", "<s-left>", "<s-right>" }, -- n, N, q, Q, -
  },
}
