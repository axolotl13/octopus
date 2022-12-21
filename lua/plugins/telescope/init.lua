local M = {}

M.opts = {
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
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-k>"] = require("telescope.actions").move_selection_previous,
        ["<PageUp>"] = require("telescope.actions").results_scrolling_up,
        ["<PageDown>"] = require("telescope.actions").results_scrolling_down,
        ["<Tab>"] = require("telescope.actions").toggle_selection + require("telescope.actions").move_selection_worse,
        ["<S-Tab>"] = require("telescope.actions").toggle_selection + require("telescope.actions").move_selection_better,
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
    file_ignore_patterns = {"node_modules"},
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = {["COLORTERM"] = "truecolor"},
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker
  }
}

M.maps = {
  { mode = {"n"}, lhs = "<leader>fi", rhs = "<cmd>Telescope current_buffer_fuzzy_find<cr>", options = {silent = true}, desc = "Buscar palabra dentro del buffer" },
  { mode = {"n"}, lhs = "<leader>fs", rhs = "<cmd>Telescope live_grep<cr>", options = {silent = true}, desc = "Buscar palabra en todas las carpetas" },
  { mode = {"n"}, lhs = "<leader>ff", rhs = "<cmd>Telescope find_files<cr>", options = {silent = true}, desc = "Buscar archivos en todas las carpetas" },
  { mode = {"n"}, lhs = "<leader>fd", rhs = "<cmd>Telescope diagnostics<cr>", options = {silent = true}, desc = "Buscar diagnosticos dentro del buffer " },
  { mode = {"n"}, lhs = "<leader>fc", rhs = "<cmd>Telescope git_commits<cr>", options = {silent = true}, desc = "Buscar commits dentro del buffer" },
  { mode = {"n"}, lhs = "<leader>fk", rhs = "<cmd>Telescope keymaps<cr>", options = {silent = true}, desc = "Buscar keymaps" },
  { mode = {"n"}, lhs = "<leader>fh", rhs = "<cmd>Telescope oldfiles<cr>", options = {silent = true}, desc = "Buscar en archivos historicos" },
  { mode = {"n"}, lhs = "<leader>fg", rhs = "<cmd>Telescope git_status<cr>", options = {silent = true}, desc = "Buscar acerca de estados en git" },
  { mode = {"n"}, lhs = "<leader>fb", rhs = "<cmd>Telescope git_branches<cr>", options = {silent = true}, desc = "Buscar branchs en git" },
  { mode = {"n"}, lhs = "<leader>fh", rhs = "<cmd>Telescope fd cwd=$HOME<cr>", options = {silent = true}, desc = "Buscar en HOME" },
  { mode = {"n"}, lhs = "<leader>fn", rhs = "<cmd>Telescope notify<cr>", options = {silent = true}, desc = "Buscar últimas notificaciones" }
}

M.start = function()

  local ok_telescope, telescope = pcall(require, "telescope")
  if not ok_telescope then return end

  local ok_keybinds, keybinds = pcall(require,"core.functions")
  if not ok_keybinds then return end

  telescope.setup(M.opts)

  keybinds.load_keybinds(M.maps)
  -- telescope.load_extension("projects")
  -- telescope.load_extension("notify")
end

return M
