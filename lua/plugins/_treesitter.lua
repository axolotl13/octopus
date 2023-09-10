return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-refactor",
    "HiPhish/rainbow-delimiters.nvim",
    {
      "kevinhwang91/nvim-ufo",
      init = function()
        vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
        vim.o.foldcolumn = "1"
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true
      end,
      dependencies = {
        "kevinhwang91/promise-async",
      },
      config = function()
        require("ufo").setup {
          provider_selector = function(bufnr, filetype, buftype)
            return { "treesitter", "indent" }
          end,
        }
      end,
      keys = {
        { "zR", "<cmd>require('ufo').openAllFolds<cr>", desc = "[UFO] Abrir fold" },
        { "zM", "<cmd>require('ufo').closeAllFolds<cr>", desc = "[UFO] Cerrar fold" },
      },
    },
  },
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = {
      "bash",
      "comment",
      "cpp",
      "css",
      "csv",
      "dockerfile",
      "fish",
      "gitattributes",
      "gitignore",
      "glimmer",
      "go",
      "html",
      "java",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "php",
      "python",
      "scss",
      "requirements",
      "rust",
      "tsx",
      "typescript",
      "vim",
      "xml",
      "yaml",
    },
    highlight = {
      enable = true,
      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
    },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "ga",
        node_incremental = "g+",
        -- scope_incremental = "gaa",
        node_decremental = "g-",
      },
    },
    refactor = {
      highlight_definitions = {
        enable = true,
      },
      highlight_current_scope = {
        enable = false,
      },
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
