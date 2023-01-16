return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" }
  },
  cmd = "Telescope",
  config = function()
    local telescope = require("telescope")

    local opts = {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case"
        },
        mappings = {
          i = {
            ["<esc>"] = require("telescope.actions").close,
            ["<c-s>"] = require("telescope.actions").select_horizontal,
            ["<c-v>"] = require("telescope.actions").select_vertical,
            ["<c-n>"] = require("telescope.actions").cycle_history_next,
            ["<c-p>"] = require("telescope.actions").cycle_history_prev,
            ["<c-j>"] = require("telescope.actions").move_selection_next,
            ["<c-k>"] = require("telescope.actions").move_selection_previous,
            ["<pageup>"] = require("telescope.actions").results_scrolling_up,
            ["<pagedown>"] = require("telescope.actions").results_scrolling_down,
            ["<tab>"] = require("telescope.actions").toggle_selection + require("telescope.actions").move_selection_worse,
            ["<s-tab>"] = require("telescope.actions").toggle_selection +
                require("telescope.actions").move_selection_better,
          }
        },
        prompt_prefix = "  ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8
          },
          vertical = {
            mirror = false
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        use_less = true,
        path_display = {},
        set_env = { ["COLORTERM"] = "truecolor" },
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker
      }
    }

    telescope.setup(opts)

  end,
  keys = {
    { "<leader>sw", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "[Telescope] Buscar palabra dentro del buffer" },
    { "<leader>sx", "<cmd>Telescope command_history<cr>", desc = "[Telescope] Buscar comandos ejecutados" },
    { "<leader>ss", "<cmd>Telescope live_grep<cr>", desc = "[Telescope] Buscar palabra en todas las carpetas" },
    { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "[Telescope] Buscar archivo en todas las carpetas" },
    { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "[Telescope] Buscar diagnosticos dentro del buffer " },
    { "<leader>sc", "<cmd>Telescope git_commits<cr>", desc = "[Telescope] Buscar palabra dentro los commits" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "[Telescope] Buscar keymaps" },
    { "<leader>sh", "<cmd>Telescope oldfiles<cr>", desc = "[Telescope] Buscar en archivos históricos" },
    { "<leader>st", "<cmd>Telescope git_status<cr>", desc = "[Telescope] Buscar dentro de los estados en git" },
    { "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "[Telescope] Buscar branchs en git" },
    { "<leader>sm", "<cmd>Telescope fd cwd=$HOME<cr>", desc = "[Telescope] Buscar en HOME" },
    { "<leader>sn", "<cmd>Telescope notify<cr>", desc = "[Telescope] Buscar últimas notificaciones" },
    { "<leader>sq", "<cmd>Telescope buffers<cr>", desc = "[Telescope] Buscar en buffer actuales" },
    { "<leader>se", "<cmd>lua require('telescope.builtin').grep_string()<cr>",
      desc = "[Telescope] Buscar palabra seleccionada" }
  }
}
