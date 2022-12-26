local ok, icons = pcall(require, "ui.icons")
if not ok then return end

local M = {}

M.opts = {
  disable_netrw = true,
  hijack_cursor = true,
  open_on_tab = false,
  update_cwd = true,
  respect_buf_cwd = true,
  view = {
    width = 35,
    -- preserve_window_proportions = true,
    mappings = {custom_only = false, list = {}},
  },
  renderer = {
    add_trailing = true,
    group_empty = true,
    highlight_git = true,
    highlight_opened_files = "icon",
    indent_width = 1,
    root_folder_modifier = table.concat {":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??"},
    indent_markers = {
      enable = false,
      icons = {corner = "└ ", edge = "│ ", item = "│ ", none = "  "}
    },
    icons = {
      symlink_arrow = icons.global.symlink_arrow,
      show = {file = true, folder = true, folder_arrow = true, git = true},
      glyphs = {
        default = icons.global.default,
        symlink = icons.global.symlink,
        folder = {
          arrow_open = icons.explorer.arrow_open,
          arrow_closed = icons.explorer.arrow_closed,
          default = icons.explorer.default,
          open = icons.explorer.open,
          empty = icons.explorer.empty,
          empty_open = icons.explorer.empty_open,
          symlink = icons.explorer.symlink,
          symlink_open = icons.explorer.symlink_open
        },
        git = {
          unstaged = icons.git.unstaged,
          staged = icons.git.staged,
          unmerged = icons.git.unmerged,
          renamed = icons.git.renamed,
          untracked = icons.git.untracked,
          deleted = icons.git.deleted,
          ignored = icons.git.ignored
        }
      }
    },
    special_files = {"Cargo.toml", "Makefile", "README.md", "readme.md"}
  },
  update_focused_file = {enable = true, ignore_list = {}},
  ignore_ft_on_setup = {},
  system_open = {cmd = nil, args = {}},
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    icons = {
      hint = icons.diagnostics.hint,
      info = icons.diagnostics.info,
      warning = icons.diagnostics.info,
      error = icons.diagnostics.info
    }
  },
  filters = {
    dotfiles = false,
    custom = {".git", "node_modules", ".cache"},
    exclude = {".gitignore", "gitsigns", ".pending.lua"}
  },
  git = {enable = true, ignore = true, timeout = 500},
  actions = {
    use_system_clipboard = true,
    change_dir = {enable = true, global = true, restrict_above_cwd = false},
    open_file = {
      quit_on_open = false,
      window_picker = {
        enable = true,
        exclude = {
          filetype = {"notify", "packer", "qf", "diff", "fugitive", "fugitiveblame", "toggleterm"},
          buftype = {"nofile", "terminal", "help"}
        }
      }
    },
    remove_file = {close_window = true}
  },
  trash = {require_confirm = false},
  live_filter = {prefix = "Filtro: "}
}

M.maps = {
  { mode = {"n"}, lhs = "ñ", rhs = "<cmd>NvimTreeToggle<cr>", options = {silent = true}, desc = "Explorador de archivos" },
}

M.explorer_keybinds = function()

  local ok, keybinds = pcall(require,"core.functions")
  if not ok then return end

  return keybinds.load_keybinds(M.maps)

end

M.start = function()

  local ok, explorer = pcall(require, "nvim-tree")
  if not ok then return end

  explorer.setup(M.opts)

  M.explorer_keybinds()

  vim.api.nvim_create_autocmd('BufEnter', {
    command = [[if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]],
    nested = true
  })

end

return M
