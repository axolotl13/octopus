local ok, icons = pcall(require, "ui.icons")
if not ok then return end

local M = {}

M.opts = {
  icons = {
    folder_closed = icons.folder.default,
    folder_open = icons.folder.open
  },
  signs = {
    fold_closed = "", 
    fold_open = ""
  },
  file_panel = {
    listing_style = "list",
    win_config = {
      position = "left", 
      width = 32
    }
  },
  file_history_panel = {
    log_options = {
      single_file = {
        diff_merges = "combined"
      },
      multi_file = {
        diff_merges = "first-parent"
      }
    },
    win_config = {
      position = "bottom", height = 16
    }
  },
  commit_log_panel = {
    win_config = {}
  },
  default_args = {
    DiffviewOpen = {},
    DiffviewFileHistory = {}
  },
  keymaps = {
    disable_defaults = false
  }
}

M.maps = {
  { mode = {"n"}, lhs = "<leader>do", rhs = "<cmd>DiffviewOpen<cr>", options = { silent = true }, desc = "Abre DiffviewOpen" },
  { mode = {"n"}, lhs = "<leader>dq", rhs = "<cmd>DiffviewClose<cr>", options = { silent = true }, desc = "Cierra Diffview" },
  { mode = {"n"}, lhs = "<leader>dh", rhs = "<cmd>DiffviewFileHistory<cr>", options = { silent = true }, desc = "Abre DiffviewFileHistory" },
  { mode = {"n"}, lhs = "<leader>de", rhs = "<cmd>DiffviewToggleFiles<cr>", options = { silent = true }, desc = "DiffviewToggleFiles" },
}

M.diffview_keybinds = function()

  local ok, keybinds = pcall(require,"core.functions")
  if not ok then return end

  return keybinds.load_keybinds(M.maps)

end

M.start = function()

  local ok, diffview = pcall(require, "diffview")
  if not ok then return end

  diffview.setup(M.opts)

  M.diffview_keybinds()

end

return M
