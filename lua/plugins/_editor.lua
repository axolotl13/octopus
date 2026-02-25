return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "helix",
      spec = {
        {
          { "<leader>b", group = "buffer" },
          { "<leader>d", group = "diff", icon = { icon = " ", color = "green" } },
          { "<leader>p", group = "lazy", icon = { icon = "󰒲 ", color = "cyan" } },
          { "<leader>t", group = "tabs" },
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

        map({ "n", "v" }, "<leader>gg", gs.stage_hunk, "Stage/unstage git hunk")
        map({ "n", "v" }, "<leader>gu", gs.reset_hunk, "Reset git hunk")
        map("n", "<leader>ga", gs.stage_buffer, "Stage git buffer")
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
    specs = {
      {
        "folke/which-key.nvim",
        opts = function(_, opts)
          table.insert(opts.spec, { { "<leader>g", group = "git" } })
        end,
      },
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
    keys = { { "<leader>,m", "<cmd>Markview<cr>", desc = "Toggle markview" } },
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
        desc = "Toggle flash search",
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
          snacks.toggle.zoom():map "<f12>"
        end,
      })
    end,
    keys = {
      {
        "<leader>sB",
        function()
          require("snacks").picker.git_branches()
        end,
        desc = "Git branches",
      },
      {
        "<leader>sc",
        function()
          require("snacks").picker.git_log()
        end,
        desc = "Git log",
      },
      {
        "<leader>sS",
        function()
          require("snacks").picker.git_status()
        end,
        desc = "Git status",
      },
      {
        "<leader>sm",
        function()
          require("snacks").picker.marks()
        end,
        desc = "Marks",
      },
      {
        "<leader>sT",
        function()
          require("snacks").picker.git_stash()
        end,
        desc = "Git stash",
      },
      {
        "<leader>sD",
        function()
          require("snacks").picker.git_diff()
        end,
        desc = "Git diff (hunks)",
      },
      {
        "<leader>gL",
        function()
          require("snacks").git.blame_line()
        end,
        desc = "Git blame line",
      },
      {
        "<leader>gw",
        mode = { "n", "v" },
        function()
          require("snacks").gitbrowse()
        end,
        desc = "Git browse",
      },
      {
        "<leader>sf",
        function()
          require("snacks").picker.files()
        end,
        desc = "Find files",
      },
      {
        "<leader>sF",
        function()
          require("snacks").picker.files { cwd = vim.fn.stdpath "config" }
        end,
        desc = "Find config file",
      },
      {
        "<leader>sb",
        function()
          require("snacks").picker.buffers()
        end,
        desc = "Buffers",
      },
      {
        "<leader>ss",
        function()
          require("snacks").picker.grep()
        end,
        desc = "Grep",
      },
      {
        "<leader>sW",
        mode = { "n", "x" },
        function()
          require("snacks").picker.grep_word()
        end,
        desc = "Visual selection or word",
      },
      {
        "<leader>sw",
        function()
          require("snacks").picker.lines()
        end,
        desc = "Buffer lines",
      },
      {
        "<leader>sx",
        function()
          require("snacks").picker.command_history()
        end,
        desc = "Command history",
      },
      {
        "<leader>sP",
        function()
          require("snacks").picker.projects()
        end,
        desc = "Projects",
      },
      {
        "<leader>sr",
        function()
          require("snacks").picker.recent()
        end,
        desc = "Recent",
      },
      {
        "<leader>sd",
        function()
          require("snacks").picker.diagnostics_buffer()
        end,
        desc = "Buffer diagnostics",
      },
      {
        "<leader>si",
        function()
          require("snacks").picker.icons()
        end,
        desc = "Icons",
      },
      {
        "<leader>sk",
        function()
          require("snacks").picker.keymaps()
        end,
        desc = "Keymaps",
      },
      {
        "<leader>sl",
        function()
          require("snacks").picker.lazy()
        end,
        desc = "Search for plugin spec",
      },
      {
        "<leader>su",
        function()
          require("snacks").picker.undo()
        end,
        desc = "Undo history",
      },
      {
        "<leader>st",
        function()
          require("snacks").picker.colorschemes()
        end,
        desc = "Colorschemes",
      },
      {
        "<leader>sn",
        function()
          require("snacks").picker.notifications()
        end,
        desc = "Notifications",
      },
      {
        "<leader>,l",
        function()
          require("snacks").lazygit()
        end,
        desc = "Lazygit",
      },
      {
        "<leader>se",
        function()
          require("snacks").explorer()
        end,
        desc = "Toggle explorer",
      },
    },
    specs = {
      {
        "folke/which-key.nvim",
        opts = function(_, opts)
          table.insert(opts.spec, {
            { "<leader>s", group = "search" },
            { "<leader>,", group = "more", icon = { icon = " ", color = "red" } },
          })
        end,
      },
      {
        "olimorris/codecompanion.nvim",
        opts = { display = { action_palette = { provider = "snacks" } } },
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
      { "<leader>do", "<cmd>DiffviewOpen<cr>", desc = "Open [diffview]" },
      { "<leader>dq", "<cmd>DiffviewClose<cr>", desc = "Close [diffview]" },
      { "<leader>df", "<cmd>DiffviewToggleFiles<cr>", desc = "Toggle file panel [diffview]" },
      { "<leader>dh", "<cmd>DiffviewFileHistory<cr>", desc = "History current branch [diffview]" },
      { "<leader>dd", "<cmd>DiffviewFileHistory %<cr>", desc = "History current file [diffview]" },
    },
  },
  {
    "HakonHarnes/img-clip.nvim",
    ft = { "markdown", "html", "tex" },
    opts = {},
    keys = { { "<leader>,P", "<cmd>PasteImage<cr>", desc = "Paste image from clipboard [img-clip]" } },
    specs = {
      {
        "folke/snacks.nvim",
        keys = {
          {
            "<leader>sI",
            function()
              require("snacks").picker.files {
                ft = { "jpg", "jpeg", "png", "webp" },
                confirm = function(self, item, _)
                  self:close()
                  require("img-clip").paste_image({}, "./" .. item.file)
                end,
              }
            end,
            desc = "Insert image from file [img-clip]",
          },
        },
      },
    },
  },
  {
    "brenoprata10/nvim-highlight-colors",
    opts = {},
    keys = { { "<leader>c", "<cmd>HighlightColors Toggle<cr>", desc = "Toggle color highlight" } },
    specs = {
      {
        "folke/which-key.nvim",
        opts = function(_, opts)
          table.insert(opts.spec, { { "<leader>c", icon = { icon = " ", color = "gray" } } })
        end,
      },
    },
  },
  {
    "CRAG666/code_runner.nvim",
    dependencies = { "akinsho/toggleterm.nvim" },
    cmd = { "RunCode", "RunFile" },
    opts = {},
    keys = { { "<f5>", "<cmd>RunCode<cr>", desc = "Run code" } },
  },
  {
    "akinsho/toggleterm.nvim",
    opts = {
      autochdir = true,
      start_in_insert = true,
      highlights = { Normal = { link = "Normal" } },
    },
    keys = { { "<leader>tt", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle terminal" } },
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
      { "<leader>xs", "<cmd>lua require('resession').save()<cr>", desc = "Save session" },
      { "<leader>xt", "<cmd>lua require('resession').save_tab()<cr>", desc = "Save tab session" },
      { "<leader>xl", "<cmd>lua require('resession').load()<cr>", desc = "Load session" },
      { "<leader>xd", "<cmd>lua require('resession').delete()<cr>", desc = "Delete session" },
    },
    specs = {
      {
        "folke/which-key.nvim",
        opts = function(_, opts)
          table.insert(opts.spec, { { "<leader>x", group = "session" } })
        end,
      },
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
        desc = "Replace",
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
        desc = "Replace current word",
      },
      {
        "<leader>rf",
        function()
          local ext = vim.bo.buftype == "" and vim.fn.expand "%"
          require("grug-far").open { transient = true, prefills = { paths = ext } }
        end,
        desc = "Replace file",
      },
      {
        "<leader>rW",
        function()
          local ext = vim.bo.buftype == "" and vim.fn.expand "%"
          require("grug-far").open { transient = true, prefills = { paths = ext, search = vim.fn.expand "<cword>" } }
        end,
        desc = "Replace current word in file",
      },
    },
    specs = {
      {
        "folke/which-key.nvim",
        opts = function(_, opts)
          table.insert(opts.spec, { { "<leader>r", group = "replace", icon = "󰛔 " } })
        end,
      },
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
    keys = { { "<leader>,p", "<cmd>LivePreview start<cr>", desc = "Live preview" } },
  },
  {
    "hat0uma/csvview.nvim",
    cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
    opts = {},
    keys = {
      { "<leader>,xx", "<cmd>CsvViewToggle<cr>", desc = "Toggle csv view" },
      { "<leader>,xy", "<cmd>CsvViewToggle display_mode=border header_lnum=1<cr>", desc = "Toggle csv view options" },
    },
  },
  {
    "benlubas/molten-nvim",
    version = "^1.0.0",
    build = ":UpdateRemotePlugins",
    keys = {
      { "<leader>mi", "<cmd>MoltenInit<cr>", desc = "Initialize molten" },
      { "<leader>mw", "<cmd>noautocmd MoltenEnterOutput<cr>", desc = "Open output window" },
      { "<leader>mq", "<cmd>MoltenDeinit<cr>", desc = "Close molten" },
      { "<leader>mn", "<cmd>MoltenNext<cr>", desc = "Jump to the next code" },
      { "<leader>mp", "<cmd>MoltenPrev<cr>", desc = "Jump to the previous code" },
      { "<leader>mr", "<cmd>MoltenReevaluateCell<cr>", desc = "Re-eval cel" },
      { "<leader>mh", "<cmd>MoltenHideOutput<cr>", desc = "Close output window" },
      { "<leader>md", "<cmd>MoltenDelete<cr>", desc = "Delete molten cell" },
      { "<leader>ml", "<cmd>MoltenEvaluateLine<cr>", desc = "Evaluate line" },
      { "<leader>ms", mode = { "x" }, ":<c-u>MoltenEvaluateVisual<cr>gv", desc = "Execute visual selection" },
    },
    specs = {
      {
        "folke/which-key.nvim",
        opts = function(_, opts)
          table.insert(opts.spec, { { "<leader>m", group = "molten", icon = { icon = " ", color = "blue" } } })
        end,
      },
    },
  },
}
