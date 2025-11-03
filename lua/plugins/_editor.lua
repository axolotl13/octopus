return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "helix",
      spec = {
        {
          { "<leader>b", group = "buffer" },
          { "<leader>c", icon = { icon = " ", color = "gray" } },
          { "<leader>d", group = "diff", icon = { icon = " ", color = "green" } },
          { "<leader>e", icon = { icon = "󰉌 ", color = "orange" } },
          { "<leader>g", group = "git" },
          { "<leader>i", group = "ia", icon = { icon = "󱙺 ", color = "orange" } },
          { "<leader>p", group = "lazy", icon = { icon = "󰒲 ", color = "cyan" } },
          { "<leader>r", group = "replace", icon = "󰛔 " },
          { "<leader>s", group = "search" },
          { "<leader>t", group = "tabs" },
          { "<leader>x", group = "session" },
          { "<leader>,", group = "more", icon = { icon = " ", color = "red" } },
          { "[", group = "prev" },
          { "]", group = "next" },
          { "g", group = "goto" },
          { "z", group = "fold" },
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

        map({ "n", "v" }, "<leader>gg", gs.stage_hunk, "stage/unstage git hunk")
        map({ "n", "v" }, "<leader>gu", gs.reset_hunk, "reset git hunk")
        map("n", "<leader>ga", gs.stage_buffer, "stage git buffer")
        map("n", "<leader>gr", gs.reset_buffer, "reset git buffer")
        map("n", "<leader>g}", gs.next_hunk, "next git hunk")
        map("n", "<leader>g{", gs.prev_hunk, "previous git hunk")
        map("n", "<leader>gp", gs.preview_hunk, "preview git hunk")
        map("n", "<leader>gd", gs.diffthis, "view git diff")
        map("n", "<leader>gt", gs.blame, "view git blame")
        map("n", "<leader>gl", gs.toggle_current_line_blame, "toggle git blame line")
        map("n", "<leader>gh", gs.toggle_deleted, "toggle git show deleted")
        map("n", "<leader>gn", gs.toggle_numhl, "toggle numhl")
      end,
    },
  },
  {
    "tpope/vim-fugitive",
    cmd = "Git",
    keys = { { "<leader>gc", "<cmd>Git commit<cr>", desc = "git commit" } },
  },
  { "nvim-lua/plenary.nvim", lazy = true },
  {
    "OXY2DEV/markview.nvim",
    ft = { "markdown" },
    opts = {},
    keys = { { "<leader>,m", "<cmd>Markview<cr>", desc = "toggle markview" } },
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
        desc = "flash",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "toggle flash search",
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
      bigfile = {},
      image = {},
      indent = {
        scope = {
          underline = true,
          only_current = true,
        },
        animate = { enabled = true },
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
      input = {},
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
      scroll = { enabled = true },
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
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          local snacks = require "snacks"

          snacks.toggle.option("spell", { name = "Spelling" }):map "<leader>,e"
          snacks.toggle.option("wrap", { name = "Wrap" }):map "<leader>,w"
          snacks.toggle.option("relativenumber", { name = "Relative Number" }):map "<leader>n"
          snacks.toggle.diagnostics():map "<leader>,d"
          snacks.toggle
            .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
            :map "<leader>,c"
          snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map "<leader>,b"
          snacks.toggle.inlay_hints():map "gh"
          snacks.toggle.animate():map "<leader>,a"
          snacks.toggle.indent():map "<leader>,i"
          snacks.toggle.scroll():map "<leader>,s"
          snacks.toggle.zen():map "<leader>z"
        end,
      })
    end,
    keys = {
      {
        "<leader>sB",
        function()
          require("snacks").picker.git_branches()
        end,
        desc = "git branches",
      },
      {
        "<leader>sc",
        function()
          require("snacks").picker.git_log()
        end,
        desc = "git log",
      },
      {
        "<leader>sS",
        function()
          require("snacks").picker.git_status()
        end,
        desc = "git status",
      },
      {
        "<leader>sm",
        function()
          require("snacks").picker.marks()
        end,
        desc = "marks",
      },
      {
        "<leader>sT",
        function()
          require("snacks").picker.git_stash()
        end,
        desc = "git stash",
      },
      {
        "<leader>sD",
        function()
          require("snacks").picker.git_diff()
        end,
        desc = "git diff (hunks)",
      },
      {
        "<leader>gL",
        function()
          require("snacks").git.blame_line()
        end,
        desc = "git blame line",
      },
      {
        "<leader>gw",
        function()
          require("snacks").gitbrowse()
        end,
        desc = "git browse",
      },
      {
        "<leader>sf",
        function()
          require("snacks").picker.files()
        end,
        desc = "find files",
      },
      {
        "<leader>sb",
        function()
          require("snacks").picker.buffers()
        end,
        desc = "buffers",
      },
      {
        "<leader>ss",
        function()
          require("snacks").picker.grep()
        end,
        desc = "grep",
      },
      {
        "<leader>sW",
        mode = { "n", "x" },
        function()
          require("snacks").picker.grep_word()
        end,
        desc = "visual selection or word",
      },
      {
        "<leader>sw",
        function()
          require("snacks").picker.lines()
        end,
        desc = "buffer lines",
      },
      {
        "<leader>sx",
        function()
          require("snacks").picker.command_history()
        end,
        desc = "command history",
      },
      {
        "<leader>sP",
        function()
          require("snacks").picker.projects()
        end,
        desc = "projects",
      },
      {
        "<leader>sr",
        function()
          require("snacks").picker.recent()
        end,
        desc = "recent",
      },
      {
        "<leader>sd",
        function()
          require("snacks").picker.diagnostics_buffer()
        end,
        desc = "buffer diagnostics",
      },
      {
        "<leader>si",
        function()
          require("snacks").picker.icons()
        end,
        desc = "icons",
      },
      {
        "<leader>sk",
        function()
          require("snacks").picker.keymaps()
        end,
        desc = "keymaps",
      },
      {
        "<leader>sl",
        function()
          require("snacks").picker.lazy()
        end,
        desc = "search for plugin spec",
      },
      {
        "<leader>su",
        function()
          require("snacks").picker.undo()
        end,
        desc = "undo history",
      },
      {
        "<leader>st",
        function()
          require("snacks").picker.colorschemes()
        end,
        desc = "colorschemes",
      },
      {
        "<leader>sn",
        function()
          require("snacks").picker.notifications()
        end,
        desc = "notifications",
      },
      {
        "<leader>,l",
        function()
          require("snacks").lazygit()
        end,
        desc = "lazygit",
      },
      {
        "<leader>se",
        function()
          require("snacks").explorer()
        end,
        desc = "toggle explorer",
      },
    },
    specs = {
      {
        "neovim/nvim-lspconfig",
        keys = {
          {
            "grd",
            function()
              require("snacks").picker.lsp_definitions()
            end,
            desc = "goto definition",
          },
          {
            "grD",
            function()
              require("snacks").picker.lsp_declarations()
            end,
            desc = "goto declaration",
          },
          {
            "grr",
            function()
              require("snacks").picker.lsp_references()
            end,
            desc = "references",
          },
          {
            "gri",
            function()
              require("snacks").picker.lsp_implementations()
            end,
            desc = "goto implementation",
          },
          {
            "grt",
            function()
              require("snacks").picker.lsp_type_definitions()
            end,
            desc = "goto type definition",
          },
          {
            "gry",
            function()
              require("snacks").picker.lsp_symbols()
            end,
            desc = "lsp symbols",
          },
        },
      },
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
      { "<leader>do", "<cmd>DiffviewOpen<cr>", desc = "open (diffview)" },
      { "<leader>dq", "<cmd>DiffviewClose<cr>", desc = "close (diffview)" },
      { "<leader>df", "<cmd>DiffviewToggleFiles<cr>", desc = "toggle file panel (diffview)" },
      { "<leader>dh", "<cmd>DiffviewFileHistory<cr>", desc = "history current branch (diffview)" },
      { "<leader>dd", "<cmd>DiffviewFileHistory %<cr>", desc = "history current file (diffview)" },
    },
  },
  {
    "HakonHarnes/img-clip.nvim",
    ft = { "markdown", "html", "tex" },
    opts = {},
    keys = { { "<leader>,P", "<cmd>PasteImage<cr>", desc = "paste image from clipboard (img-clip)" } },
    specs = {
      {
        "folke/snacks.nvim",
        keys = {
          {
            "<leader>sI",
            function()
              Snacks.picker.files {
                ft = { "jpg", "jpeg", "png", "webp" },
                confirm = function(self, item, _)
                  self:close()
                  require("img-clip").paste_image({}, "./" .. item.file)
                end,
              }
            end,
            desc = "insert image from file (img-clip)",
          },
        },
      },
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
    keys = { { "<leader>,v", "<cmd>VenvSelect<cr>", desc = "select virtual environment" } },
  },
  {
    "brenoprata10/nvim-highlight-colors",
    opts = {},
    keys = { { "<leader>c", "<cmd>HighlightColors Toggle<cr>", desc = "toggle highlight colors" } },
  },
  {
    "CRAG666/code_runner.nvim",
    dependencies = { "akinsho/toggleterm.nvim" },
    cmd = { "RunCode", "RunFile" },
    opts = {},
    keys = { { "<f5>", "<cmd>RunCode<cr>", desc = "run code" } },
  },
  {
    "akinsho/toggleterm.nvim",
    opts = {
      autochdir = true,
      start_in_insert = true,
      highlights = { Normal = { link = "Normal" } },
    },
    keys = { { "<leader>tt", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "toggle terminal" } },
    specs = { { "CRAG666/code_runner.nvim", opts = { mode = "toggleterm" } } },
  },
  {
    "stevearc/resession.nvim",
    lazy = false,
    opts = {},
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
      { "<leader>xs", "<cmd>lua require('resession').save()<cr>", desc = "save session" },
      { "<leader>xt", "<cmd>lua require('resession').save_tab()<cr>", desc = "save tab session" },
      { "<leader>xl", "<cmd>lua require('resession').load()<cr>", desc = "load session" },
      { "<leader>xd", "<cmd>lua require('resession').delete()<cr>", desc = "delete session" },
    },
  },
  {
    "MagicDuck/grug-far.nvim",
    opts = {},
    keys = {
      {
        "<leader>rr",
        function()
          require("grug-far").open { transient = true }
        end,
        desc = "replace",
      },
      {
        "<leader>rw",
        function()
          local ext = vim.bo.buftype == "" and vim.fn.expand "cword"
          if ext ~= "" then
            require("grug-far").open { transient = true, prefills = { search = vim.fn.expand "<cword>" } }
          else
            vim.notify("No word under cursor", vim.log.levels.WARN, { title = "Grug-far" })
          end
        end,
        desc = "replace current word",
      },
      {
        "<leader>rf",
        function()
          local ext = vim.bo.buftype == "" and vim.fn.expand "%"
          require("grug-far").open { transient = true, prefills = { paths = ext } }
        end,
        desc = "replace file",
      },
      {
        "<leader>rW",
        function()
          local ext = vim.bo.buftype == "" and vim.fn.expand "%"
          require("grug-far").open { transient = true, prefills = { paths = ext, search = vim.fn.expand "<cword>" } }
        end,
        desc = "replace current word in file",
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
    keys = { { "<leader>,p", "<cmd>LivePreview start<cr>", desc = "live preview" } },
  },
  {
    "hat0uma/csvview.nvim",
    cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
    opts = {},
    keys = {
      { "<leader>,xx", "<cmd>CsvViewToggle<cr>", desc = "toggle csv view" },
      { "<leader>,xy", "<cmd>CsvViewToggle display_mode=border header_lnum=1<cr>", desc = "toggle csv view options" },
    },
  },
}
