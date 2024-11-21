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
        }
      end,
      integrations = {
        diffview = true,
        dropbar = true,
        mason = true,
        noice = true,
        notify = true,
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
          show = {
            modified = false,
          },
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
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = {
      indent = {
        char = "▏",
      },
      scope = {
        char = "▏",
        show_start = true,
        show_end = false,
        include = {
          node_type = {
            ["*"] = {
              "argument_list",
              "arguments",
              "assignment_statement",
              "Block",
              "chunk",
              "class",
              "ContainerDecl",
              "dictionary",
              "do_block",
              "do_statement",
              "element",
              "except",
              "FnCallArguments",
              "for",
              "for_statement",
              "function",
              "function_declaration",
              "function_definition",
              "if_statement",
              "IfExpr",
              "IfStatement",
              "import",
              "InitList",
              "jsx_self_closing_element",
              "list_literal",
              "method",
              "object",
              "ParamDeclList",
              "repeat_statement",
              "return_statement",
              "selector",
              "SwitchExpr",
              "table",
              "table_constructor",
              "try",
              "tuple",
              "type",
              "var",
              "while",
              "while_statement",
              "with",
            },
          },
        },
        exclude = {
          language = { "fish", "yaml" },
        },
      },
      exclude = {
        filetypes = {
          "markdown",
          "text",
          "tex",
        },
      },
    },
    keys = { { "<leader>,i", "<cmd>IBLToggle<cr>", desc = "Toggle IndentBlankline" } },
  },
  {
    "rcarriga/nvim-notify",
    lazy = true,
    opts = {
      render = "wrapped-compact",
      timeout = 2150,
      max_width = function()
        return math.floor(vim.o.columns * 0.60)
      end,
      stages = "static",
    },
    init = function()
      vim.notify = require "notify"
    end,
  },
  {
    "Bekaboo/dropbar.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = {
      icons = {
        kinds = {
          symbols = require("octopus._icons").vs,
        },
      },
    },
    init = function()
      vim.opt.mousemoveevent = true
    end,
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
            style = "double",
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
            style = "double",
            padding = { 0, 1 },
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
        "TelescopePrompt",
        "gitsigns-blame",
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
      local env = require "heirline-components.core.env"
      local core_utils = require "heirline-components.core.utils"
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
        statuscolumn = {
          init = function(self)
            self.bufnr = vim.api.nvim_get_current_buf()
          end,
          lib.component.foldcolumn { foldcolumn = { padding = { right = 0 } } },
          lib.component.numbercolumn(),
          lib.component.signcolumn {
            signcolumn = { padding = { right = 0 } },
            on_click = {
              name = "sign_click",
              callback = function(...)
                local args = core_utils.statuscolumn_clickargs(...)
                if args.sign and args.sign.name and env.sign_handlers[args.sign.name] then
                  env.sign_handlers[args.sign.name](args)
                end
                vim.cmd ":silent! Gitsigns preview_hunk"
              end,
            },
          },
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
          lib.component.lsp { surround = { separator = "none" }, padding = { right = 2, left = 2 } },
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
          lib.component.file_encoding { hl = { fg = "diag_INFO" }, padding = { right = 2 } },
          lib.component.treesitter { surround = { separator = "none" }, padding = { right = 2 } },
          lib.component.file_info {
            file_icon = { padding = { left = 0 } },
            filename = false,
            file_modified = false,
            file_read_only = false,
            surround = { separator = "none" },
            padding = { right = 2 },
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
