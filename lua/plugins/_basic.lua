return {
  {
    "kylechui/nvim-surround",
    -- keys = { "ysiw", "ys", "yss","ds", "cs" },
    event = "VeryLazy",
    config = true,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = {
      "numToStr/Comment.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    lazy = true,
  },
  {
    "NvChad/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    config = true,
    keys = { { "<leader>cc", "<cmd>ColorizerToggle<cr>", desc = "Habilitar ColorizerToggle" } },
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
      { "<a-z>", "<cmd>SearchSession<cr>", desc = "[Session] Mostrar una lista de sesiones" },
    },
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
  },
  {
    "chrisgrieser/nvim-spider",
    keys = {
      { "w", mode = { "n", "o", "x" }, "<cmd>lua require('spider').motion('w')<CR>", desc = "Spider-w" },
      { "e", mode = { "n", "o", "x" }, "<cmd>lua require('spider').motion('e')<CR>", desc = "Spider-e" },
      { "b", mode = { "n", "o", "x" }, "<cmd>lua require('spider').motion('b')<CR>", desc = "Spider-b" },
      { "ge", mode = { "n", "o", "x" }, "<cmd>lua require('spider').motion('ge')<CR>", desc = "Spider-ge" },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    cmd = "MarkdownPreview",
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
