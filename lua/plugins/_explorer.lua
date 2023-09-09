return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
  },
  lazy = false,
  -- pin = true,
  opts = {
    hijack_cursor = true,
    disable_netrw = true,
    respect_buf_cwd = true,
    view = {
      debounce_delay = 30,
      width = 35,
      preserve_window_proportions = true,
    },
    renderer = {
      add_trailing = true,
      group_empty = true,
      highlight_git = true,
      highlight_diagnostics = true,
      full_name = false,
      highlight_opened_files = "icon",
      highlight_modified = "icon",
      root_folder_label = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" },
      indent_width = 2,
      indent_markers = {
        enable = true,
      },
      icons = {
        show = {
          modified = false,
        },
        glyphs = {
          default = require("ui.icons").global.default,
          symlink = require("ui.icons").global.symlink,
          bookmark = require("ui.icons").global.bookMark,
          modified = require("ui.icons").global.modified,
          folder = {
            arrow_open = require("ui.icons").explorer.arrow_open,
            arrow_closed = require("ui.icons").explorer.arrow_closed,
            default = require("ui.icons").explorer.default,
            open = require("ui.icons").explorer.open,
            empty = require("ui.icons").explorer.empty,
            empty_open = require("ui.icons").explorer.empty_open,
            symlink = require("ui.icons").explorer.symlink,
            symlink_open = require("ui.icons").explorer.symlink_open,
          },
          git = {
            unstaged = require("ui.icons").git.unstaged,
            staged = require("ui.icons").git.staged,
            unmerged = require("ui.icons").git.unmerged,
            renamed = require("ui.icons").git.renamed,
            untracked = require("ui.icons").git.untracked,
            deleted = require("ui.icons").git.deleted,
            ignored = require("ui.icons").git.ignored,
          },
        },
      },
    },
    update_focused_file = {
      enable = true,
      update_root = true,
      ignore_list = { "toggleterm", "diffview" },
    },
    diagnostics = {
      enable = true,
      show_on_dirs = false,
      debounce_delay = 100,
      icons = {
        hint = require("ui.icons").diagnostics.hint,
        info = require("ui.icons").diagnostics.info,
        warning = require("ui.icons").diagnostics.info,
        error = require("ui.icons").diagnostics.info,
      },
    },
    filters = {
      custom = {
        ".git",
        "node_modules",
        ".cache",
      },
      exclude = {
        "gitsigns",
        ".gitignore",
        ".env",
        ".plugins.lua",
      },
    },
    live_filter = { prefix = "[Filtro]: " },
    filesystem_watchers = {
      debounce_delay = 150,
    },
    git = {
      enable = true,
      ignore = true,
      timeout = 800,
    },
    modified = {
      enable = true,
    },
    actions = {
      change_dir = {
        global = true,
      },
      open_file = {
        quit_on_open = false,
        window_picker = {
          enable = true,
          exclude = {
            filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame", "toggleterm" },
            buftype = { "nofile", "terminal", "help" },
          },
        },
      },
    },
    ui = {
      confirm = {
        remove = false,
        trash = false,
      },
    },
  },
  keys = {
    { "ñ", "<cmd>NvimTreeToggle<cr> ", { desc = "[Explorer] Abrir el explorador de archivos" } },
    { "<leader>e", "<cmd>NvimTreeToggle<cr> ", { desc = "[Explorer] Abrir el explorador de archivos" } },
  },
}
