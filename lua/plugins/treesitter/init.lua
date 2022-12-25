local M = {}

M.opts = {
  ensure_installed = {
    "bash",
    "comment",
    "cpp",
    "css",
    "dockerfile",
    "fish",
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
    "yaml"
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
  indent = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "ga",
      node_incremental = "g+",
      -- scope_incremental = "gaa",
      node_decremental = "g-"
    }
  },
  rainbow = {
    enable = true,
    disable = {"html"},
    extended_mode = false,
    max_file_lines = nil
  },
  -- refactor = {highlight_definitions = {enable = true}, highlight_current_scope = {enable = false}},
  -- context_commentstring = {enable = true, enable_autocmd = false},
  autotag = {
    enable = true,
    filetypes = { "html", "xml" }
  }
}


M.start = function()
  
  local ok, treesitter = pcall(require, "nvim-treesitter.configs")
  if not ok then return end

  treesitter.setup(M.opts)

end

return M
