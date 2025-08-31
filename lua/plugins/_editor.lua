return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spec = {
        {
          { "<leader>b", group = "Buffer" },
          { "<leader>c", icon = { icon = " ", color = "gray" } },
          { "<leader>d", group = "Diff", icon = { icon = " ", color = "green" } },
          { "<leader>e", icon = { icon = "󰉌 ", color = "orange" } },
          { "<leader>g", group = "Git" },
          { "<leader>i", group = "ia", icon = { icon = "󱙺 ", color = "orange" } },
          { "<leader>p", group = "Lazy", icon = { icon = "󰒲 ", color = "cyan" } },
          { "<leader>r", group = "Replace", icon = "󰛔 " },
          { "<leader>s", group = "Search" },
          { "<leader>t", group = "Tabs" },
          { "<leader>x", group = "Session" },
          { "<leader>,", group = "More", icon = { icon = "󰍻 ", color = "red" } },
          { "z", group = "fold" },
        },
      },
      plugins = {
        register = false,
        spelling = {
          enabled = false,
        },
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = {
      count_chars = { "₁", "₂", "₃", "₄", "₅", "₆", "₇", "₈", "₉", ["+"] = "₊" },
      signs = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "┃", show_count = true },
        topdelete = { text = "┃", show_count = true },
        changedelete = { text = "┃", show_count = true },
        untracked = { text = "┃" },
      },
      signs_staged = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "┃" },
        topdelete = { text = "┃" },
        changedelete = { text = "┃" },
        untracked = { text = "┃" },
      },
      current_line_blame_opts = { ignore_whitespace = true },
      max_file_length = 20000,
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        map({ "n", "v" }, "<leader>gg", gs.stage_hunk, "Stage git hunk")
        map({ "n", "v" }, "<leader>gu", gs.reset_hunk, "Reset git hunk")
        map("n", "<leader>ga", gs.stage_buffer, "Stage git buffer")
        map("n", "<leader>gq", gs.undo_stage_hunk, "Unstage git hunk")
        map("n", "<leader>gr", gs.reset_buffer, "Reset git buffer")
        map("n", "<leader>g}", gs.next_hunk, "Next git hunk")
        map("n", "<leader>g{", gs.prev_hunk, "Previous git hunk")
        map("n", "<leader>gp", gs.preview_hunk, "Preview git hunk")
        map("n", "<leader>gd", gs.diffthis, "View git diff")
        map("n", "<leader>gt", gs.blame, "View git blame")
        map("n", "<leader>gl", gs.toggle_current_line_blame, "Toggle git blame line")
        map("n", "<leader>gh", gs.toggle_deleted, "Toggle git show deleted")
        map("n", "<leader>gn", gs.toggle_numhl, "Toggle numhl")
      end,
    },
  },
  {
    "tpope/vim-fugitive",
    cmd = "Git",
    keys = { { "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" } },
  },
  { "nvim-lua/plenary.nvim", lazy = true },
  {
    "OXY2DEV/markview.nvim",
    ft = { "markdown" },
    opts = {},
    keys = { { "<leader>,m", "<cmd>Markview<cr>", desc = "Toggle Markview" } },
  },
  {
    "folke/flash.nvim",
    opts = {
      search = {
        exclude = {
          "NvimTree",
          "mason",
          "lazy",
          "codecompanion",
          "grug-far",
          "notify",
          "snacks_notif",
          "snacks_notif_history",
          "terminal",
          "fugitive",
          "flash_prompt",
          function(win)
            return not vim.api.nvim_win_get_config(win).focusable
          end,
        },
      },
      modes = { char = { keys = { "f", "F", "t", "T" } } },
    },
    keys = {
      {
        "s",
        mode = { "n", "o", "x" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
    specs = {
      {
        "folke/snacks.nvim",
        opts = {
          picker = {
            win = {
              input = {
                keys = {
                  ["<a-s>"] = { "flash", mode = { "n", "i" } },
                  ["s"] = { "flash" },
                },
              },
            },
            actions = {
              flash = function(picker)
                require("flash").jump {
                  pattern = "^",
                  label = { after = { 0, 0 } },
                  search = {
                    mode = "search",
                    exclude = {
                      function(win)
                        return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "snacks_picker_list"
                      end,
                    },
                  },
                  action = function(match)
                    local idx = picker.list:row2idx(match.pos[1])
                    picker.list:_move(idx, true, true)
                  end,
                }
              end,
            },
          },
        },
      },
    },
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { size = 1.5 * 1024 * 1024 },
      image = {},
      indent = {
        scope = {
          underline = true,
          only_current = true,
        },
        animate = { enabled = false },
        filter = function(buf)
          local included_filetypes = {
            html = true,
            java = true,
            javascript = true,
            lua = true,
            python = true,
            sh = true,
            rust = true,
            tsx = true,
            typescript = true,
            xml = true,
          }
          local filetype = vim.bo[buf].filetype
          return vim.g.snacks_indent ~= false
            and vim.b[buf].snacks_indent ~= false
            and vim.bo[buf].buftype == ""
            and included_filetypes[filetype]
        end,
      },
      lazygit = {},
      notifier = {},
      picker = {
        prompt = "  ",
        win = {
          input = {
            keys = {
              ["<c-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
              ["<c-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
              ["<c-f>"] = { "list_scroll_down", mode = { "i", "n" } },
              ["<c-b>"] = { "list_scroll_up", mode = { "i", "n" } },
              ["<tab>"] = { "list_down", mode = { "i", "n" } },
              ["<s-Tab>"] = { "list_up", mode = { "i", "n" } },
              ["<c-n>"] = { "select_and_next", mode = { "i", "n" } },
              ["<c-p>"] = { "select_and_prev", mode = { "i", "n" } },
            },
          },
          list = {
            keys = {
              ["<c-d>"] = { "scroll_down", mode = { "n" } },
              ["<c-u>"] = { "scroll_up", mode = { "n" } },
            },
          },
          preview = {
            wo = {
              foldenable = false,
              signcolumn = "no",
              winbar = "",
              statuscolumn = "",
            },
          },
        },
        exclude = {
          ".git",
          "node_modules",
          "venv",
          ".venv",
          "__pycache__",
        },
      },
      statuscolumn = {
        folds = {
          open = true,
          git_hl = true,
        },
      },
      zen = { toggles = { dim = false } },
      styles = {
        zen = {
          backdrop = { transparent = false, blend = 90 },
        },
      },
    },
    config = function(_, opts)
      require("snacks").setup(opts)
      local notify = vim.notify
      vim.notify = notify
    end,
    keys = {
      {
        "<leader>sB",
        function()
          Snacks.picker.git_branches()
        end,
        desc = "Git Branches",
      },
      {
        "<leader>sc",
        function()
          Snacks.picker.git_log()
        end,
        desc = "Git Log",
      },
      {
        "<leader>sS",
        function()
          Snacks.picker.git_status()
        end,
        desc = "Git Status",
      },
      {
        "<leader>sT",
        function()
          Snacks.picker.git_stash()
        end,
        desc = "Git Stash",
      },
      {
        "<leader>sD",
        function()
          Snacks.picker.git_diff()
        end,
        desc = "Git Diff (Hunks)",
      },
      {
        "<leader>sf",
        function()
          Snacks.picker.files()
        end,
        desc = "Find Files",
      },
      {
        "<leader>sb",
        function()
          Snacks.picker.buffers()
        end,
        desc = "Buffers",
      },
      {
        "<leader>ss",
        function()
          Snacks.picker.grep()
        end,
        desc = "Grep",
      },
      {
        "<leader>sW",
        mode = { "n", "x" },
        function()
          Snacks.picker.grep_word()
        end,
        desc = "Visual selection or word",
      },
      {
        "<leader>sw",
        function()
          Snacks.picker.lines()
        end,
        desc = "Buffer lines",
      },
      {
        "<leader>sx",
        function()
          Snacks.picker.command_history()
        end,
        desc = "Command History",
      },
      {
        "<leader>sP",
        function()
          Snacks.picker.projects()
        end,
        desc = "Projects",
      },
      {
        "<leader>sr",
        function()
          Snacks.picker.recent()
        end,
        desc = "Recent",
      },
      {
        "<leader>sd",
        function()
          Snacks.picker.diagnostics_buffer()
        end,
        desc = "Buffer Diagnostics",
      },
      {
        "<leader>si",
        function()
          Snacks.picker.icons()
        end,
        desc = "Icons",
      },
      {
        "<leader>sk",
        function()
          Snacks.picker.keymaps()
        end,
        desc = "Keymaps",
      },
      {
        "<leader>sl",
        function()
          Snacks.picker.lazy()
        end,
        desc = "Search for Plugin Spec",
      },
      {
        "<leader>su",
        function()
          Snacks.picker.undo()
        end,
        desc = "Undo History",
      },
      {
        "<leader>st",
        function()
          Snacks.picker.colorschemes()
        end,
        desc = "Colorschemes",
      },
      {
        "<leader>sy",
        function()
          Snacks.picker.lsp_symbols()
        end,
        desc = "LSP Symbol",
      },
      {
        "<leader>sn",
        function()
          Snacks.picker.notifications()
        end,
        desc = "Notifications",
      },
      {
        "<leader>,l",
        function()
          Snacks.lazygit()
        end,
        desc = "Lazygit",
      },
      {
        "<leader>z",
        function()
          Snacks.zen()
        end,
        desc = "Toggle Zen Mode",
      },
    },
    specs = {
      {
        "olimorris/codecompanion.nvim",
        opts = {
          strategies = {
            chat = {
              slash_commands = {
                ["file"] = {
                  opts = { provider = "snacks", contains_code = true },
                },
                ["buffer"] = {
                  opts = { provider = "snacks", contains_code = true },
                },
                ["symbols"] = {
                  opts = { provider = "snacks", contains_code = true },
                },
              },
            },
          },
        },
      },
    },
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    opts = {
      enhanced_diff_hl = true,
      view = {
        default = { winbar_info = true },
        file_history = { winbar_info = true },
      },
    },
    keys = {
      { "<leader>do", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
      { "<leader>dq", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
      { "<leader>df", "<cmd>DiffviewToggleFiles<cr>", desc = "Toggle file panel" },
      { "<leader>dh", "<cmd>DiffviewFileHistory<cr>", desc = "History current branch" },
      { "<leader>dd", "<cmd>DiffviewFileHistory %<cr>", desc = "History current file" },
    },
  },
  {
    "HakonHarnes/img-clip.nvim",
    ft = { "markdown", "html", "tex" },
    opts = {},
    keys = { { "<leader>,P", "<cmd>PasteImage<cr>", desc = "Paste image from clipboard" } },
  },
  {
    "danymat/neogen",
    opts = {},
    keys = { { "<leader>,n", "<cmd>lua require('neogen').generate()<cr>", desc = "Generate Annotations" } },
  },
  {
    "linux-cultist/venv-selector.nvim",
    branch = "regexp",
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
    keys = { { "<leader>,v", "<cmd>VenvSelect<cr>", desc = "Select Venv" } },
  },
  {
    "brenoprata10/nvim-highlight-colors",
    opts = {},
    keys = { { "<leader>c", "<cmd>HighlightColors Toggle<cr>", desc = "Toggle Highlight Colors" } },
  },
  { "nvzone/volt", lazy = true },
  {
    "nvzone/minty",
    keys = {
      { "<leader>,s", "<cmd>Shades<cr>", desc = "Enable Shades" },
      { "<leader>,c", "<cmd>Huefy<cr>", desc = "Enable ColorPick" },
    },
  },
  {
    "CRAG666/code_runner.nvim",
    dependencies = { "akinsho/toggleterm.nvim" },
    cmd = { "RunCode", "RunFile" },
    opts = {},
    keys = { { "<f5>", "<cmd>RunCode<cr>", desc = "Run Code" } },
  },
  {
    "akinsho/toggleterm.nvim",
    opts = {
      autochdir = true,
      start_in_insert = true,
      highlights = {
        Normal = { link = "Normal" },
      },
    },
    keys = { { "<leader>tt", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle Terminal" } },
    specs = { { "CRAG666/code_runner.nvim", opts = { mode = "toggleterm" } } },
  },
  {
    "stevearc/resession.nvim",
    lazy = false,
    opts = {
      autosave = {
        enabled = true,
        notify = false,
      },
    },
    config = function(_, opts)
      local resession = require "resession"
      resession.setup(opts)

      local function get_session_name()
        local name = vim.fn.getcwd()
        local branch = vim.trim(vim.fn.system "git branch --show-current")
        if vim.v.shell_error == 0 then
          return name .. branch
        else
          return name
        end
      end
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          if vim.fn.argc(-1) == 0 then
            resession.load(get_session_name(), { dir = "session", silence_errors = true })
          end
        end,
        nested = true,
      })
      vim.api.nvim_create_autocmd("VimLeavePre", {
        callback = function()
          resession.save(get_session_name(), { dir = "session", notify = false })
        end,
      })
    end,
    keys = {
      { "<leader>xs", "<cmd>lua require('resession').save()<cr>", desc = "Save Session" },
      { "<leader>xl", "<cmd>lua require('resession').load()<cr>", desc = "Load Session" },
      { "<leader>xd", "<cmd>lua require('resession').delete()<cr>", desc = "Delete Session" },
    },
  },
  {
    "MagicDuck/grug-far.nvim",
    opts = {},
    keys = {
      {
        "<leader>rr",
        function()
          local grug = require "grug-far"
          grug.open {
            transient = true,
          }
        end,
        desc = "Replace",
      },
      {
        "<leader>rw",
        function()
          local grug = require "grug-far"
          local ext = vim.bo.buftype == "" and vim.fn.expand "cword"
          if ext ~= "" then
            grug.open {
              transient = true,
              prefills = { search = vim.fn.expand "<cword>" },
            }
          else
            vim.notify("No word under cursor", vim.log.levels.WARN, { title = "Grug-far" })
          end
        end,
        desc = "Replace current word",
      },
      {
        "<leader>rf",
        function()
          local grug = require "grug-far"
          local ext = vim.bo.buftype == "" and vim.fn.expand "%"
          grug.open {
            transient = true,
            prefills = { paths = ext },
          }
        end,
        desc = "Replace file",
      },
      {
        "<leader>rW",
        function()
          local grug = require "grug-far"
          local ext = vim.bo.buftype == "" and vim.fn.expand "%"
          grug.open {
            transient = true,
            prefills = { paths = ext, search = vim.fn.expand "<cword>" },
          }
        end,
        desc = "Replace current word in file",
      },
    },
    specs = {
      {
        "saghen/blink.cmp",
        opts = {
          enabled = function()
            return not vim.tbl_contains({ "grug-far" }, vim.bo.filetype)
          end,
        },
      },
    },
  },
  { "b0o/SchemaStore.nvim", lazy = true },
  {
    "brianhuster/live-preview.nvim",
    opts = { sync_scroll = true },
    keys = { { "<leader>,p", "<cmd>LivePreview start<cr>", desc = "Live Preview" } },
  },
  {
    "hat0uma/csvview.nvim",
    cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
    opts = {},
    keys = {
      { "<leader>,XX", "<cmd>CsvViewToggle<cr>", desc = "Toggle CSV View" },
      { "<leader>,XY", "<cmd>CsvViewToggle display_mode=border header_lnum=1<cr>", desc = "Toggle CSV View" },
    },
  },
}
