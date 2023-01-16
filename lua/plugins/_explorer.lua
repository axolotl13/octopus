return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    { "kyazdani42/nvim-web-devicons" }
  },
  cmd = "NvimTreeToggle",
  -- pin = true,
  opts = {
    disable_netrw = true,
    hijack_cursor = true,
    respect_buf_cwd = true,
    view = {
      width = 35,
      -- preserve_window_proportions = true,
      mappings = {
        custom_only = false,
        list = {
          { key = "d", action = "trash" },
        }
      },
    },
    renderer = {
      add_trailing = true,
      group_empty = true,
      highlight_git = true,
      highlight_opened_files = "icon",
      highlight_modified = "icon",
      root_folder_label = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" },
      indent_width = 1,
      indent_markers = {
        enable = false,
        icons = {
          corner = "└",
          edge = "│",
          item = "│",
          bottom = "─",
          none = " "
        }
      },
      icons = {
        symlink_arrow = require("ui.icons").global.symlink_arrow,
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
          modified = false,
        },
        glyphs = {
          default = require("ui.icons").global.default,
          symlink = require("ui.icons").global.symlink,
          modified = require("ui.icons").global.modified,
          folder = {
            arrow_open = require("ui.icons").explorer.arrow_open,
            arrow_closed = require("ui.icons").explorer.arrow_closed,
            default = require("ui.icons").explorer.default,
            open = require("ui.icons").explorer.open,
            empty = require("ui.icons").explorer.empty,
            empty_open = require("ui.icons").explorer.empty_open,
            symlink = require("ui.icons").explorer.symlink,
            symlink_open = require("ui.icons").explorer.symlink_open
          },
          git = {
            unstaged = require("ui.icons").git.unstaged,
            staged = require("ui.icons").git.staged,
            unmerged = require("ui.icons").git.unmerged,
            renamed = require("ui.icons").git.renamed,
            untracked = require("ui.icons").git.untracked,
            deleted = require("ui.icons").git.deleted,
            ignored = require("ui.icons").git.ignored
          }
        }
      },
      special_files = {
        "Cargo.toml",
        "Makefile",
        "README.md",
        "readme.md"
      }
    },
    update_focused_file = {
      enable = true,
      debounce_delay = 15,
      update_root = true,
      ignore_list = {}
    },
    ignore_ft_on_setup = {},
    system_open = {
      cmd = nil,
      args = {}
    },
    diagnostics = {
      enable = true,
      show_on_dirs = false,
      icons = {
        hint = require("ui.icons").diagnostics.hint,
        info = require("ui.icons").diagnostics.info,
        warning = require("ui.icons").diagnostics.info,
        error = require("ui.icons").diagnostics.info
      }
    },
    filters = {
      dotfiles = false,
      custom = {
        ".git",
        "node_modules",
        ".cache"
      },
      exclude = {
        ".gitignore",
        ".plugins.lua",
      }
    },
    git = {
      enable = true,
      ignore = true,
      timeout = 500
    },
    modified = {
      enable = true,
      show_on_dirs = true,
      show_on_open_dirs = true,
    },
    actions = {
      use_system_clipboard = true,
      change_dir = {
        enable = true,
        global = true,
        restrict_above_cwd = false
      },
      open_file = {
        quit_on_open = false,
        window_picker = {
          enable = true,
          exclude = {
            filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame", "toggleterm" },
            buftype = { "nofile", "terminal", "help" }
          }
        }
      },
      remove_file = { close_window = true }
    },
    trash = { require_confirm = false },
    live_filter = { prefix = "Filtro: " }
  },
  keys = {
    { "ñ", "<cmd>NvimTreeToggle<cr>", { desc = "[Explorer] Abrir el explorador de archivos" } }
  },
}
