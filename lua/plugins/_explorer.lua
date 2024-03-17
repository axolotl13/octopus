return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    hijack_cursor = true,
    disable_netrw = true,
    respect_buf_cwd = true,
    view = {
      centralize_selection = true,
      debounce_delay = 30,
      width = 35,
      preserve_window_proportions = true,
    },
    renderer = {
      add_trailing = true,
      group_empty = true,
      full_name = false,
      indent_width = 2,
      root_folder_label = ":t:gs?$?/..?",
      highlight_git = "all",
      highlight_diagnostics = "all",
      highlight_opened_files = "icon",
      highlight_modified = "icon",
      highlight_bookmarks = "icon",
      indent_markers = {
        enable = true,
      },
      icons = {
        show = {
          modified = false,
        },
        glyphs = {
          default = require("ui.icons").gl.default,
          symlink = require("ui.icons").gl.symlink,
          bookmark = require("ui.icons").gl.bookmark,
          modified = require("ui.icons").bl.modified,
          folder = {
            arrow_open = require("ui.icons").fl.arrow_open,
            arrow_closed = require("ui.icons").fl.arrow_closed,
            default = require("ui.icons").fl.defaultf,
            open = require("ui.icons").fl.open,
            empty = require("ui.icons").fl.empty,
            empty_open = require("ui.icons").fl.empty_open,
            symlink = require("ui.icons").fl.symlink,
            symlink_open = require("ui.icons").fl.symlink,
          },
          git = {
            unstaged = require("ui.icons").gt.unstaged,
            staged = require("ui.icons").gt.staged,
            unmerged = require("ui.icons").gt.unmerged,
            renamed = require("ui.icons").gt.renamed,
            untracked = require("ui.icons").gt.untracked,
            deleted = require("ui.icons").gt.deletedf,
            ignored = require("ui.icons").gt.ignored,
          },
        },
      },
    },
    update_focused_file = {
      enable = true,
      update_root = true,
      ignore_list = { "diffview" },
    },
    diagnostics = {
      enable = true,
      show_on_dirs = false,
      debounce_delay = 100,
      icons = {
        hint = require("ui.icons").dg.hint,
        info = require("ui.icons").dg.bugf,
        warning = require("ui.icons").dg.bugf,
        error = require("ui.icons").dg.bugf,
      },
    },
    modified = {
      enable = true,
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
        "lua/extra",
      },
    },
    actions = {
      change_dir = {
        global = true,
      },
      open_file = {
        quit_on_open = false,
        window_picker = {
          exclude = {
            filetype = { "notify", "qf", "diff", "fugitive", "fugitiveblame" },
            buftype = { "nofile", "terminal", "help" },
          },
        },
      },
    },
    tab = {
      sync = {
        open = true,
      },
    },
    ui = {
      confirm = {
        remove = false,
        trash = false,
      },
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("BufEnter", {
      group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
      pattern = "NvimTree_*",
      callback = function()
        local layout = vim.api.nvim_call_function("winlayout", {})
        if
          layout[1] == "leaf"
          and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree"
          and layout[3] == nil
        then
          vim.api.nvim_command [[confirm quit]]
        end
      end,
    })
  end,
  keys = { { "ñ", "<cmd>NvimTreeToggle<cr> ", { desc = "[Explorer] Abrir el explorador de archivos" } } },
}
