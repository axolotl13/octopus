return {
  {
    "kylechui/nvim-surround",
    keys = {
      { "ys", mode = "n" },
      { "ds", mode = "n" },
      { "cs", mode = "n" },
    },
    opts = {},
  },
  { "mfussenegger/nvim-jdtls", ft = "java" },
  { "b0o/schemastore.nvim", lazy = true },
  { "tzachar/local-highlight.nvim", event = "VeryLazy", opts = {} },
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    keys = { { "<leader>nn", "<cmd>lua require('neogen').generate()<cr>", desc = "[Neogen] Generar anotaciones" } },
    opts = {},
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
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = { lsp = { progress = { enabled = false } } },
  },
  {
    "HakonHarnes/img-clip.nvim",
    keys = { { "<leader>pi", "<cmd>PasteImage<cr>", desc = "[Image] Paste clipboard Image" } },
    opts = {},
  },
  -- { "mfussenegger/nvim-dap", event = "VeryLazy" },
  -- Vim plugins
  {
    "mg979/vim-visual-multi",
    keys = {
      { "<c-n>", mode = "n" },
      { "<c-up>", mode = "n" },
      { "<c-down>", mode = "n" },
      { "<s-left>", mode = "n" },
      { "<s-right>", mode = "n" },
    },
  },
  {
    "tpope/vim-fugitive",
    cmd = "Git",
    keys = { { "<leader>gc", "<cmd>Git commit<cr>", desc = "[Fugitive] Git commit" } },
  },
}
