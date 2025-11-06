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
    specs = {
      {
        "akinsho/bufferline.nvim",
        opts = function(_, opts)
          if (vim.g.colors_name or ""):find "catppuccin" then
            opts.highlights = require("catppuccin.special.bufferline").get_theme { styles = { "bold" } }
          end
        end,
      },
    },
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
    specs = {
      {
        "Saghen/blink.cmp",
        opts = {
          completion = {
            menu = {
              draw = {
                components = {
                  kind_icon = {
                    ellipsis = false,
                    text = function(ctx)
                      local icon = ctx.kind_icon
                      if vim.tbl_contains({ "Path" }, ctx.source_name) then
                        local dev_icon = require("nvim-web-devicons").get_icon(ctx.label)
                        if dev_icon then
                          icon = dev_icon
                        end
                      end
                      return icon .. ctx.icon_gap
                    end,
                    highlight = function(ctx)
                      local hl = ctx.kind_hl
                      if vim.tbl_contains({ "Path" }, ctx.source_name) then
                        local _, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                        if dev_hl then
                          hl = dev_hl
                        end
                      end
                      return hl
                    end,
                  },
                },
              },
            },
          },
        },
      },
      {
        "OXY2DEV/markview.nvim",
        opts = { preview = { icon_provider = "devicons" } },
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "VeryLazy",
    opts = {
      options = {
        indicator = { style = "none" },
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icons = require "octopus._icons"
          local icon = level:match "error" and icons.common.Bug or icons.diag.Hint
          return count .. " " .. icon
        end,
        offsets = { { filetype = "NvimTree", separator = false } },
        separator_style = "thin",
        always_show_bufferline = false,
        hover = { enabled = true, delay = 200, reveal = { "close" } },
      },
    },
    keys = {
      { "<a-left>", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer left" },
      { "<a-right>", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer right" },
      { "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Pick buffer" },
      { "<leader>bP", "<cmd>BufferLineTogglePin<cr>", desc = "Pin buffer" },
      { "<c-z>", "<cmd>BufferLineCloseOthers<cr>", desc = "Close all buffer except current" },
    },
  },
  {
    "tiagovla/scope.nvim",
    opts = {},
    specs = {
      {
        "stevearc/resession.nvim",
        opts = {
          buf_filter = function(bufnr)
            local buftype = vim.bo[bufnr].buftype
            if buftype == "help" then
              return true
            end
            if buftype ~= "" and buftype ~= "acwrite" then
              return false
            end
            if vim.api.nvim_buf_get_name(bufnr) == "" then
              return false
            end

            return true
          end,
          extensions = { scope = {} },
        },
      },
    },
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
        indent_markers = { enable = true },
        icons = {
          glyphs = {
            default = require("octopus._icons").common.Default,
            bookmark = require("octopus._icons").common.Bookmark,
            modified = require("octopus._icons").common.FileModified,
            folder = {
              default = require("octopus._icons").common.Folder,
              open = require("octopus._icons").common.FolderOpen,
              empty_open = require("octopus._icons").common.EmptyOpen,
              symlink = require("octopus._icons").common.FolderSymlink,
            },
            git = {
              unmerged = require("octopus._icons").git.Branch,
              untracked = require("octopus._icons").git.Untracked,
              deleted = require("octopus._icons").git.Delete,
            },
          },
        },
      },
      update_focused_file = { enable = true, update_root = { enable = true } },
      diagnostics = {
        enable = true,
        icons = {
          hint = require("octopus._icons").diag.Hint,
          info = require("octopus._icons").diag.Info,
          warning = require("octopus._icons").diag.Warn,
          error = require("octopus._icons").diag.Error,
        },
      },
      modified = { enable = true },
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
      actions = { change_dir = { global = true }, open_file = { quit_on_open = true } },
      tab = { sync = { open = true } },
      ui = { confirm = { trash = false } },
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
        "folke/which-key.nvim",
        opts = function(_, opts)
          table.insert(opts.spec, { { "<leader>e", icon = { icon = "󰉌 ", color = "orange" } } })
        end,
      },
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
    opts = {
      icons = { kinds = { symbols = require("octopus._icons").kind } },
      bar = {
        attach_events = {
          "BufEnter",
          "BufWinEnter",
          "BufWritePost",
          "FileType",
          "LspAttach",
        },
      },
    },
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
        },
        signature = { enabled = false, auto_open = { trigger = false } },
        progress = { enabled = false },
      },
      views = {
        cmdline_popup = {
          position = { row = 5, col = "50%" },
          size = { width = 60, height = "auto" },
          border = { style = "single" },
        },
        popupmenu = {
          relative = "editor",
          position = { row = 8, col = "50%" },
          size = { width = 60, height = 10 },
          border = { style = "single" },
          win_options = { winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" } },
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
      handlers = { gitsigns = { signs = { delete = "│" } } },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { { "mode", icon = "", separator = { right = "" } } },
        lualine_b = {
          "branch",
          {
            "diff",
            symbols = { added = "󰐗 ", modified = "󰙦 ", removed = "󰍶 " },
          },
          "diagnostics",
        },
        lualine_c = {
          {
            "filename",
            path = 4,
            symbols = { modified = "", readonly = "" },
          },
          "filesize",
        },
        lualine_x = {
          "selectioncount",
          { "lsp_status", icon = "" },
          "encoding",
          { "fileformat", symbols = { unix = "" } },
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "%5(%l/%2L%):%2c" },
      },
      extensions = { "lazy", "man", "mason", "nvim-tree", "toggleterm" },
    },
  },
  {
    "linux-cultist/venv-selector.nvim",
    opts = {
      options = {
        enable_default_searches = false,
        notify_user_on_venv_activation = true,
      },
      search = {
        venv = {
          command = "fd '/bin/python$' . --full-path --color never -HI -a -L",
        },
      },
    },
    keys = { { "<leader>,v", "<cmd>VenvSelect<cr>", desc = "Select virtual environment" } },
    specs = {
      {
        "nvim-lualine/lualine.nvim",
        opts = function(_, opts)
          table.insert(opts.sections.lualine_x, 1, {
            function()
              local venv_path = require("venv-selector").venv()
              if not venv_path or venv_path == "" then
                return ""
              end

              local venv_name = vim.fn.fnamemodify(venv_path, ":t")
              if not venv_name then
                return ""
              end

              local output = "🐍 " .. venv_name .. " "
              return output
            end,
            color = { fg = "#ebbcba" },
            cond = function()
              return os.getenv "VIRTUAL_ENV" ~= nil
            end,
          })
        end,
      },
    },
  },
}
