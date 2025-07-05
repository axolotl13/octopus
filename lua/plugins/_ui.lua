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
      custom_highlights = function(c)
        return {
          TreesitterContext = { bg = c.base },
          TreesitterContextBottom = { underline = true, sp = c.surface1 },
          TreesitterContextLineNumber = { bg = c.base },
          SnacksPicker = { fg = c.fg, bg = c.mantle },
          SnacksPickerTitle = { fg = c.mantle, bg = c.blue },
          SnacksPickerBorder = { fg = c.mantle, bg = c.mantle },
          SnacksPickerInput = { fg = c.fg, bg = c.mantle },
          SnacksPickerInputTitle = { fg = c.mantle, bg = c.peach },
          SnacksPickerInputBorder = { fg = c.mantle, bg = c.mantle },
          SnacksPickerPreview = { fg = c.fg, bg = c.crust },
          SnacksPickerPreviewBorder = { fg = c.crust, bg = c.crust },
          Folded = { fg = c.blue, bg = c.surface0 },
        }
      end,
      integrations = {
        blink_cmp = true,
        diffview = true,
        dropbar = true,
        grug_far = true,
        mason = true,
        markview = true,
        noice = true,
        nvim_surround = true,
        snacks = { enabled = true },
        which_key = true,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.opt.background = "dark"
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
      py = { icon = "", color = "#61afef", name = "Py" },
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
    lazy = true,
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
          glyphs = {
            default = require("octopus._icons").hl.Default,
            symlink = require("octopus._icons").hl.Symlink,
            bookmark = require("octopus._icons").hl.Bookmark,
            modified = require("octopus._icons").hl.FileModified,
            hidden = require("octopus._icons").hl.Hidden,
            folder = {
              arrow_open = require("octopus._icons").hl.ArrowOpen,
              arrow_closed = require("octopus._icons").hl.ArrowClose,
              default = require("octopus._icons").hl.Folder,
              open = require("octopus._icons").hl.FolderOpen,
              empty = require("octopus._icons").hl.Empty,
              empty_open = require("octopus._icons").hl.EmptyOpen,
              symlink = require("octopus._icons").hl.FolderSymlink,
              symlink_open = require("octopus._icons").hl.SymlinkOpen,
            },
            git = {
              unstaged = require("octopus._icons").hl.Unstaged,
              staged = require("octopus._icons").hl.Staged,
              unmerged = require("octopus._icons").hl.GitBranch,
              renamed = require("octopus._icons").hl.Renamed,
              untracked = require("octopus._icons").hl.Untracked,
              deleted = require("octopus._icons").hl.Delete,
              ignored = require("octopus._icons").hl.Ignored,
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
    specs = {
      {
        "akinsho/toggleterm.nvim",
        opts = {
          on_open = function(_)
            local nvimtree = require "nvim-tree.api"
            if nvimtree.tree.is_visible() then
              nvimtree.tree.toggle()
              nvimtree.tree.toggle(false, true)
            end
          end,
        },
      },
    },
  },
  {
    "Bekaboo/dropbar.nvim",
    event = "UIEnter",
    opts = { icons = { kinds = { symbols = require("octopus._icons").symbols } } },
  },
  { "MunifTanjim/nui.nvim", lazy = true },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        signature = {
          enabled = false,
          auto_open = {
            trigger = false,
          },
        },
        progress = {
          enabled = false,
        },
      },
      views = {
        cmdline_popup = {
          position = {
            row = 5,
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
          border = {
            style = "single",
          },
        },
        popupmenu = {
          relative = "editor",
          position = {
            row = 8,
            col = "50%",
          },
          size = {
            width = 60,
            height = 10,
          },
          border = {
            style = "single",
          },
          win_options = {
            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
          },
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            kind = "search_count",
          },
          opts = { skip = true },
        },
      },
    },
  },
  {
    "lewis6991/satellite.nvim",
    event = "VeryLazy",
    opts = {
      current_only = true,
      winblend = 40,
      excluded_filetypes = {
        "NvimTree",
        "terminal",
        "prompt",
        "snacks_picker_input",
        "snacks_picker_list",
        "snacks_picker_preview",
        "TelescopePrompt",
        "gitsigns-blame",
        "grug-far",
        "snacks_notif",
        "snacks_notif_history",
        "noice",
        "notify",
      },
      handlers = {
        gitsigns = {
          signs = {
            delete = "│",
          },
        },
      },
    },
  },
  {
    "zeioth/heirline-components.nvim",
    lazy = true,
    opts = { icons = require("octopus._icons").hl },
  },
  {
    "rebelot/heirline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = function()
      local lib = require "heirline-components.all"
      local condition = require "heirline-components.core.condition"

      return {
        tabline = {
          lib.component.tabline_conditional_padding {
            provider = function(self)
              return string.rep(" ", vim.api.nvim_win_get_width(self.winid))
            end,
            hl = { bg = "bg" },
          },
          lib.component.tabline_buffers {
            file_modified = {
              padding = { left = 1, right = 1 },
              condition = condition.is_file,
            },
            surround = false,
          },
          lib.component.fill { hl = { bg = "bg" } },
          lib.component.tabline_tabpages(),
        },
        statusline = {
          hl = { fg = "fg", bg = "bg" },
          { provider = " ", hl = { bg = "none" } },
          lib.component.mode {
            provider = " ",
            mode_text = {},
            surround = { separator = { "", "" } },
            hl = { bold = true },
          },
          lib.component.git_branch { padding = { left = 2 }, surround = { separator = "none" } },
          lib.component.file_info {
            filetype = false,
            filename = {},
            file_modified = { hl = { fg = "git_added" }, padding = { left = 1 } },
            file_read_only = {},
            padding = { left = 2 },
          },
          lib.component.virtual_env { surround = { separator = "none" }, padding = { right = 1 } },
          lib.component.git_diff(),
          lib.component.diagnostics(),
          lib.component.fill(),
          lib.component.cmd_info(),
          lib.component.lsp { on_click = false, surround = { separator = "none" }, padding = { right = 2, left = 2 } },
          lib.component.fill(),
          {
            provider = function()
              local fmt = vim.bo.fileformat
              if fmt ~= "" then
                local symbols = {
                  unix = "",
                  dos = "",
                  mac = "",
                }
                return symbols[fmt]
              end
            end,
            hl = { fg = "diag_INFO" },
          },
          lib.component.file_encoding { padding = { right = 2 } },
          lib.component.treesitter { surround = { separator = "none" }, padding = { right = 2 } },
          lib.component.file_info {
            file_icon = { padding = { left = 0 } },
            filename = false,
            file_modified = false,
            file_read_only = false,
            surround = { separator = "none" },
            padding = { right = 2 },
          },
          {
            provider = function()
              local function file_size_human_readable(file)
                local size = vim.fn.getfsize(file)
                if size <= 0 then
                  return ""
                end
                local suffixes = { "b", "k", "M", "G" }
                local i = 1
                while size > 1024 and i < #suffixes do
                  size = size / 1024
                  i = i + 1
                end
                return string.format(i == 1 and "%d%s  " or "󰆓 %.1f%s  ", size, suffixes[i])
              end

              local file = vim.fn.expand "%:p"
              if not file or file == "" then
                return ""
              end
              return file_size_human_readable(file)
            end,
            hl = { fg = "diag_HINT" },
          },
          lib.component.mode {
            provider = " %6(%l/%2L%):%2c",
            surround = {
              separator = { "", "" },
            },
            hl = { bold = true },
            padding = { right = 1 },
          },
          { provider = " ", hl = { bg = "none" } },
        },
      }
    end,
    config = function(_, opts)
      local heirline = require "heirline"
      local heirline_components = require "heirline-components.all"

      heirline_components.init.subscribe_to_events()
      heirline.load_colors(heirline_components.hl.get_colors())
      heirline.setup(opts)

      vim.api.nvim_create_autocmd({ "BufAdd", "BufEnter", "TabNewEntered", "BufDelete" }, {
        callback = function()
          if #vim.t.bufs > 1 then
            vim.o.showtabline = 2
          elseif vim.o.showtabline ~= 1 then
            vim.o.showtabline = 1
          end
        end,
      })
    end,
    keys = {
      {
        "<c-z>",
        "<cmd>lua require('heirline-components.buffer').close_all(true)<cr>",
        desc = "Close all buffer except current",
      },
      {
        "<tab>",
        "<cmd>lua require('heirline-components.buffer').nav(vim.v.count > 0 and vim.v.count or 1)<cr>",
        desc = "Next Buffer",
      },
      {
        "<s-tab>",
        "<cmd>lua require('heirline-components.buffer').nav(-(vim.v.count > 0 and vim.v.count or 1))<cr>",
        desc = "Previous Buffer",
      },
      {
        "<a-right>",
        "<cmd>lua require('heirline-components.buffer').move(vim.v.count > 0 and vim.v.count or 1)<cr>",
        desc = "Move Buffer right",
      },
      {
        "<a-left>",
        "<cmd>lua require('heirline-components.buffer').move(-(vim.v.count > 0 and vim.v.count or 1))<cr>",
        desc = "Move Buffer left",
      },
      {
        "<leader>bp",
        "<cmd>lua require('heirline-components.all').heirline.buffer_picker(function(bufnr) vim.api.nvim_win_set_buf(0, bufnr) end)<cr>",
        desc = "Pick Buffer",
      },
    },
  },
}
