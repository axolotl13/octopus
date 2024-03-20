return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "HiPhish/rainbow-delimiters.nvim",
    {
      "nvim-treesitter/nvim-treesitter-context",
      opts = { max_lines = 3 },
    },
    {
      "kevinhwang91/nvim-ufo",
      dependencies = { "kevinhwang91/promise-async" },
      init = function()
        vim.o.foldcolumn = "1"
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true
      end,
      opts = {
        provider_selector = function(_, _, _)
          return { "treesitter", "indent" }
        end,
      },
      keys = {
        { "zR", "<cmd>require('ufo').openAllFolds<cr>", desc = "[UFO] Abrir fold" },
        { "zM", "<cmd>require('ufo').closeAllFolds<cr>", desc = "[UFO] Cerrar fold" },
      },
    },
  },
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  opts = {
    ensure_installed = {
      "bash",
      "bibtex",
      "comment",
      "cpp",
      "css",
      "csv",
      "dockerfile",
      "fish",
      "gitattributes",
      "git_config",
      "gitignore",
      "glimmer",
      "go",
      "html",
      "java",
      "javascript",
      "json",
      "latex",
      "lua",
      "markdown",
      "markdown_inline",
      "php",
      "python",
      "scss",
      "sql",
      "ssh_config",
      "requirements",
      "rst",
      "rust",
      "ruby",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "xml",
      "yaml",
    },
    highlight = {
      enable = true,
      disable = function(_, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
    },
    indent = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "ga",
        node_incremental = "g+",
        node_decremental = "g-",
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
