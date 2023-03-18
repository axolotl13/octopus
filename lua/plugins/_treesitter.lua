return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter-refactor" },
    { "RRethy/nvim-treesitter-textsubjects" },
    { "HiPhish/nvim-ts-rainbow2" },
  },
  event = "BufReadPost",
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    local opts = {
      ensure_installed = {
        "bash",
        "comment",
        "cpp",
        "css",
        "dockerfile",
        "fish",
        "gitignore",
        "go",
        "html",
        "java",
        "javascript",
        "json",
        "lua",
        "markdown",
        "php",
        "python",
        "rust",
        "scss",
        "tsx",
        "typescript",
        "vim",
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
      textsubjects = {
        enable = true,
        prev_selection = ",",
        keymaps = {
          ["."] = "textsubjects-smart",
          [";"] = "textsubjects-container-outer",
        },
      },
      rainbow = {
        enable = true,
        disable = { "html" },
        extended_mode = false,
        max_file_lines = nil,
      },
      refactor = {
        highlight_definitions = {
          enable = true,
        },
        highlight_current_scope = {
          enable = false,
        },
        smart_rename = {
          enable = true,
          keymaps = {
            smart_rename = "grr",
          },
        },
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      --[[ autotag = {
        enable = true,
        filetypes = { "html", "xml" }
      } ]]
    }
    treesitter.setup(opts)
  end,
}
