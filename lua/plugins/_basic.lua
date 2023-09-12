return {
  {
    "kylechui/nvim-surround",
    -- keys = { "ysiw", "ys", "yss","ds", "cs" },
    event = "VeryLazy",
    config = true,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
  },
  {
    "uga-rosa/ccc.nvim",
    cmd = { "CccHighlighterToggle", "CccPick" },
    config = true,
    keys = {
      { "<leader>cc", "<cmd>CccHighlighterToggle<cr>", desc = "Habilitar CccHighlighterToggle" },
      { "<leader>cp", "<cmd>CccPick<cr>", desc = "Habilitar CccPick" },
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
  {
    "tzachar/local-highlight.nvim",
    init = function()
      vim.api.nvim_create_autocmd("BufRead", {
        pattern = { "*.*" },
        callback = function(data)
          require("local-highlight").attach(data.buf)
        end,
      })
    end,
    opts = {
      disable_file_types = { "tex" },
      hlgroup = "Search",
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
