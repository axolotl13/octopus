return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spec = {
        {
          { "<leader>b", group = "Buffer" },
          { "<leader>d", group = "Diffview", icon = { icon = "󰕛 ", color = "green" } },
          { "<leader>e", icon = { icon = "󰉌 ", color = "orange" } },
          { "<leader>g", group = "Git" },
          { "<leader>p", group = "Lazy", icon = { icon = "󰒲 ", color = "cyan" } },
          { "<leader>s", group = "Search" },
          { "<leader>t", group = "Tabs" },
          { "<leader>,", group = "Misc", icon = { icon = " ", color = "pink" } },
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
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show { global = false }
        end,
        desc = "Buffer local keymaps",
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = {
      signs = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "┃" },
        topdelete = { text = "┃" },
        changedelete = { text = "┃" },
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
      current_line_blame_opts = {
        ignore_whitespace = true,
      },
      max_file_length = 20000,
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        map("n", "<leader>gg", gs.stage_hunk, "Stage git hunk")
        map("n", "<leader>gu", gs.reset_hunk, "Reset git hunk")
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
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    enabled = vim.fn.executable "make" == 1,
    lazy = true,
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    opts = function()
      return {
        defaults = {
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
          mappings = {
            i = {
              ["<esc>"] = require("telescope.actions").close,
              ["<c-n>"] = require("telescope.actions").cycle_history_next,
              ["<c-p>"] = require("telescope.actions").cycle_history_prev,
            },
          },
          prompt_prefix = "  ",
          selection_caret = "  ",
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
              results_width = 0.8,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          file_ignore_patterns = { "node_modules" },
        },
        pickers = {
          find_files = {
            find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
          },
          colorscheme = {
            enable_preview = true,
          },
        },
        extensions = {},
      }
    end,
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension "fzf"
    end,
    keys = {
      {
        "<leader>sw",
        "<cmd>Telescope current_buffer_fuzzy_find<cr>",
        desc = "Search words in current buffer",
      },
      { "<leader>sx", "<cmd>Telescope command_history<cr>", desc = "Search command history" },
      { "<leader>ss", "<cmd>Telescope live_grep<cr>", desc = "Search words" },
      { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Search files" },
      { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Search diagnostics" },
      { "<leader>sc", "<cmd>Telescope git_commits<cr>", desc = "Git commits (repository)" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Search keymaps" },
      { "<leader>so", "<cmd>Telescope oldfiles<cr>", desc = "Search history" },
      { "<leader>st", "<cmd>Telescope git_status<cr>", desc = "Git status" },
      { "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "Git branches" },
      { "<leader>sm", "<cmd>Telescope fd cwd=$HOME<cr>", desc = "Search files in HOME" },
      { "<leader>sn", "<cmd>Telescope notify<cr>", desc = "Search notifications" },
      { "<leader>sq", "<cmd>Telescope buffers<cr>", desc = "Search buffers" },
      { "<leader>sr", "<cmd>Telescope colorscheme<cr>", desc = "Search themes" },
      { "<leader>se", "<cmd>Telescope grep_string<cr>", desc = "Search words under cursor" },
    },
  },
  {
    "OXY2DEV/markview.nvim",
    ft = "markdown",
    config = true,
    keys = { { "<leader>,v", "<cmd>Markview<cr>", desc = "Toggle Markview" } },
  },
  {
    "folke/flash.nvim",
    opts = {
      search = {
        exclude = {
          "NvimTree",
          "mason",
          "lazy",
          "notify",
          "terminal",
          "cmp_menu",
          "fugitive",
          "flash_prompt",
          function(win)
            return not vim.api.nvim_win_get_config(win).focusable
          end,
        },
      },
      modes = {
        char = {
          keys = { "f", "F", "t", "T" },
        },
      },
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
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash treesitter",
      },
    },
  },
  {
    "folke/zen-mode.nvim",
    opts = {
      plugins = {
        options = {
          laststatus = 0,
        },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Enable ZenMode" } },
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    opts = {
      enhanced_diff_hl = true,
      view = {
        default = {
          winbar_info = true,
        },
        file_history = {
          winbar_info = true,
        },
      },
    },
    keys = {
      { "<leader>do", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
      { "<leader>dq", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
      { "<leader>df", "<cmd>DiffviewToggleFiles<cr>", desc = "Toggle file panel" },
      { "<leader>dh", "<cmd>DiffviewFileHistory<cr>", desc = "History current branch" },
      { "<leader>dd", "<cmd>DiffviewFileHistory %<cr>", desc = "History current file" },
    },
  }
}
