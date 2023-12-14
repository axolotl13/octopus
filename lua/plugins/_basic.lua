return {
  { "kylechui/nvim-surround", keys = { "ys", "ds", "cs" }, config = true },
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true, opts = { enable_autocmd = false } },
  { "mfussenegger/nvim-jdtls", ft = "java" },
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
    build = "cd app && yarn install",
    cmd = { "MarkdownPreview", "MarkdownPreviewToggle" },
    ft = { "markdown" },
    keys = {
      { "<leader>md", "<cmd>MarkdownPreviewToggle<cr>", desc = "Muestra el archivo markdown en un nvegador web" },
    },
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
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
    ft = { "python" },
    opts = {
      name = { "venv", ".venv" },
    },
    keys = { { "<leader>vv", "<cmd>VenvSelect<cr>", desc = "Selecciona el entorno virtual de Python" } },
  },
  {
    "utilyre/sentiment.nvim",
    event = "VeryLazy",
    config = true,
    init = function()
      vim.g.loaded_matchparen = 1
    end,
  },
  -- Vim plugins
  { "tpope/vim-fugitive", cmd = "Git" },
  {
    "mg979/vim-visual-multi",
    keys = { "<c-n>", "<c-down>", "<c-up>", "<s-left>", "<s-right>" }, -- n, N, q, Q, -
  },
}
