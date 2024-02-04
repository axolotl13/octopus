return {
  { "kylechui/nvim-surround", keys = { "ys", "ds", "cs" }, config = true },
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true, opts = { enable_autocmd = false } },
  { "mfussenegger/nvim-jdtls", ft = "java" },
  {
    "NvChad/nvim-colorizer.lua",
    cmd = { "ColorizerToggle" },
    opts = { user_default_options = { css = true } },
    keys = { { "<leader>cc", "<cmd>ColorizerToggle<cr>", desc = "[Colorizer] Habilitar highlighter" } },
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
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    cmd = { "MarkdownPreview", "MarkdownPreviewToggle" },
    ft = { "markdown" },
    keys = {
      {
        "<leader>md",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "[MarkdownPreview] Muestra una vista previa del archivo en un navegador web",
      },
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
    config = true,
    init = function()
      vim.g.loaded_matchparen = 1
    end,
  },
  {
    "Cassin01/wf.nvim",
    event = "VeryLazy",
    keys = function()
      local which_key = require "wf.builtin.which_key"
      return {
        {
          "<Leader>",
          which_key { text_insert_in_advance = "<Leader>" },
          desc = "[wf.nvim] which-key /",
        },
      }
    end,
    config = function()
      require("wf").setup()
    end,
  },
  -- { "mfussenegger/nvim-dap", event = "VeryLazy" },
  -- Vim plugins
  {
    "tpope/vim-fugitive",
    cmd = "Git",
    keys = { { "<leader>gc", "<cmd>Git commit<cr>", desc = "[Fugitive] Git commit" } },
  },
  {
    "mg979/vim-visual-multi",
    keys = { "<c-n>", "<c-down>", "<c-up>", "<s-left>", "<s-right>" }, -- n, N, q, Q, -
  },
}
