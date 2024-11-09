return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      background = {
        light = "latte",
        dark = "macchiato",
      },
      integrations = {
        mason = true,
        nvim_surround = true,
        telescope = {
          enabled = true,
          style = "nvchad",
        },
        which_key = true,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd [[colorscheme catppuccin]]
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    opts = {
      cnf = { icon = "󱙌", color = "#898998", name = "Cnf" },
      css = { icon = "", color = "#61afef", name = "Css" },
      db = { icon = "󱘲", color = "#ff75a0", name = "Db" },
      js = { icon = "󰌞", color = "#ebcb8b", name = "Js" },
      md = { icon = "", color = "#898998", name = "Md" },
      sh = { icon = "", color = "#6d9086", name = "Sh" },
      sql = { icon = "󱘲", color = "#ff75a0", name = "Sql" },
      ts = { icon = "", color = "#519aba", name = "Ts" },
      tsx = { icon = "", color = "#519aba", name = "Tsx" },
      jpg = { icon = "", color = "#bd77dc", name = "Jpg" },
      jpeg = { icon = "", color = "#bd77dc", name = "Jpeg" },
      key = { icon = "", color = "#7a0d21", name = "Key" },
      pem = { icon = "", color = "#e8274b", name = "Pem" },
      png = { icon = "", color = "#bd77dc", name = "Png" },
      svg = { icon = "", color = "#ffb13b", name = "Svg" },
      yaml = { icon = "", color = "#ebcb8b", name = "Yaml" },
      yml = { icon = "", color = "#ebcb8b", name = "Yml" },
      webp = { icon = "", color = "#a1b7ee", name = "Webp" },
      [".gitignore"] = { icon = "", color = "#6d8086", name = "GitIgnore" },
      ["package.json"] = { icon = "", color = "#e8274b", name = "PackageJson" },
      ["package-lock.json"] = { icon = "", color = "#7a0d21", name = "PackageLockJson" },
    },
    config = function(_, opts)
      require("nvim-web-devicons").set_icon(opts)
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      hijack_cursor = true,
      disable_netrw = true,
      prefer_startup_root = true,
      respect_buf_cwd = true,
      view = {
        centralize_selection = true,
        preserve_window_proportions = true,
        width = 35,
      },
      renderer = {
        add_trailing = true,
        group_empty = false,
        full_name = false,
        root_folder_label = ":t:gs?$?/..?",
        hidden_display = "simple",
        highlight_git = "all",
        highlight_diagnostics = "all",
        highlight_opened_files = "icon",
        highlight_modified = "icon",
        highlight_hidden = "name",
        highlight_bookmarks = "icon",
        indent_markers = {
          enable = true,
        },
        icons = {
          show = {
            modified = false,
          },
          glyphs = {
            default = require("octopus._icons").hl.default,
            symlink = require("octopus._icons").hl.symlink,
            bookmark = require("octopus._icons").hl.bookmark,
            modified = require("octopus._icons").hl.modified,
            hidden = require("octopus._icons").hl.hidden,
            folder = {
              arrow_open = require("octopus._icons").hl.open,
              arrow_closed = require("octopus._icons").hl.close,
              default = require("octopus._icons").hl.folder,
              open = require("octopus._icons").hl.folderopen,
              empty = require("octopus._icons").hl.empty,
              empty_open = require("octopus._icons").hl.emptyopen,
              symlink = require("octopus._icons").hl.foldersymlink,
              symlink_open = require("octopus._icons").hl.foldersymlink,
            },
            git = {
              unstaged = require("octopus._icons").hl.unstaged,
              staged = require("octopus._icons").hl.staged,
              unmerged = require("octopus._icons").hl.branch,
              renamed = require("octopus._icons").hl.renamed,
              untracked = require("octopus._icons").hl.untracked,
              deleted = require("octopus._icons").hl.delete,
              ignored = require("octopus._icons").hl.ignored,
            },
          },
        },
      },
      update_focused_file = {
        enable = true,
        update_root = {
          enable = true,
        },
      },
      diagnostics = {
        enable = true,
        icons = {
          hint = require("octopus._icons").hl.DiagnosticHint,
          info = require("octopus._icons").hl.DiagnosticInfo,
          warning = require("octopus._icons").hl.DiagnosticWarn,
          error = require("octopus._icons").hl.DiagnosticError,
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
        },
      },
      actions = {
        change_dir = {
          global = true,
        },
        open_file = {
          quit_on_open = true,
        },
      },
      tab = {
        sync = {
          open = true,
        },
      },
      ui = {
        confirm = {
          trash = false,
        },
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "NvimTree_*",
        callback = function()
          local layout = vim.fn.winlayout()
          if layout[1] == "leaf" and vim.bo[vim.fn.winbufnr(layout[2])].filetype == "NvimTree" and not layout[3] then
            vim.cmd "confirm quit"
          end
        end,
      })
    end,
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Open Explorer" },
      { "ñ", "<cmd>NvimTreeToggle<cr>", desc = "Open Explorer" },
      { "Ñ", "<cmd>NvimTreeFocus<cr>", desc = "Focus Explorer" },
    },
  },
}
