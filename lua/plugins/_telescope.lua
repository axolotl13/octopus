return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      enabled = vim.fn.executable "make" == 1,
      lazy = true,
    },
    { "benfowler/telescope-luasnip.nvim", lazy = true },
  },
  cmd = "Telescope",
  opts = {
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
          ["<c-u>"] = false,
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
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    },
    pickers = {
      find_files = {
        find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
      },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension "fzf"
    require("telescope").load_extension "luasnip"
  end,
  keys = {
    {
      "<leader>sw",
      "<cmd>Telescope current_buffer_fuzzy_find<cr>",
      desc = "[Telescope] Buscar palabra dentro del buffer",
    },
    { "<leader>sx", "<cmd>Telescope command_history<cr>", desc = "[Telescope] Buscar comandos ejecutados" },
    { "<leader>ss", "<cmd>Telescope live_grep<cr>", desc = "[Telescope] Buscar palabra en todas las carpetas" },
    { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "[Telescope] Buscar archivo en todas las carpetas" },
    { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "[Telescope] Buscar diagnosticos dentro del buffer " },
    { "<leader>sc", "<cmd>Telescope git_commits<cr>", desc = "[Telescope] Buscar palabra dentro los commits" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "[Telescope] Buscar keymaps" },
    { "<leader>so", "<cmd>Telescope oldfiles<cr>", desc = "[Telescope] Buscar en archivos históricos" },
    { "<leader>st", "<cmd>Telescope git_status<cr>", desc = "[Telescope] Buscar dentro de los estados en git" },
    { "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "[Telescope] Buscar branchs en git" },
    { "<leader>sm", "<cmd>Telescope fd cwd=$HOME<cr>", desc = "[Telescope] Buscar en HOME" },
    { "<leader>sn", "<cmd>Telescope notify<cr>", desc = "[Telescope] Buscar últimas notificaciones" },
    { "<leader>sq", "<cmd>Telescope buffers<cr>", desc = "[Telescope] Buscar en buffer actuales" },
    { "<leader>sl", "<cmd>Telescope luasnip<cr>", desc = "[Telescope] Buscar snippets" },
    {
      "<leader>se",
      "<cmd>lua require('telescope.builtin').grep_string()<cr>",
      desc = "[Telescope] Buscar palabra seleccionada",
    },
  },
}
