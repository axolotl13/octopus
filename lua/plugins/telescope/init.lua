local N = {}

local mods = {"telescope", "telescope.actions", "telescope.previewers", "telescope.sorters"}
local ok, l = nil, {}

for _, mod in ipairs(mods) do
  ok, l[_] = pcall(require, mod)
  if not ok then
    return
  end
end

local telescope, actions, view, sorter = l[1], l[2], l[3], l[4]

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
        ["<esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,
        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
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
    file_sorter = sorter.get_fuzzy_file,
    file_ignore_patterns = {"node_modules"},
    generic_sorter = sorter.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = {["COLORTERM"] = "truecolor"},
    file_previewer = view.vim_buffer_cat.new,
    grep_previewer = view.vim_buffer_vimgrep.new,
    qflist_previewer = view.vim_buffer_qflist.new,
    buffer_previewer_maker = view.buffer_previewer_maker
  }
}

telescope.setup(opts)
-- telescope.load_extension("projects")
-- telescope.load_extension("notify")
