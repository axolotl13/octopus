local ok, icons = pcall(require, "ui.icons")
if not ok then return end

local ok_colors, colors = pcall(require, "ui.colors")
if not ok_colors then return end

local M = {}

M.bufferline = {
  fill = {
    bg = {attribute = "bg", highlight = colors.default.dark},
    fg = {attribute = "fg", highlight = colors.default.cursor}
  },
  background = {
    bg = {attribute = "bg", highlight = colors.default.dark},
    fg = {attribute = "fg", highlight = colors.default.comment}
  },
  tab = {
    bg = {attribute = "bg", highlight = colors.default.dark},
    fg = {attribute = "fg", highlight = colors.default.comment}
  },
  tab_selected = {
    bg = {attribute = "bg", highlight = colors.default.dark},
    fg = {attribute = "bg", highlight = colors.default.cursor}
  },
  tab_close = {
    bg = {attribute = "bg", highlight = colors.default.dark},
    fg = {attribute = "fg", highlight = colors.default.error}
  },
  buffer_selected = {
    bg = {attribute = "fg", highlight = colors.default.cursor},
    fg = {attribute = "bg", highlight = colors.default.cursor},
    italic = false
  },
  buffer_visible = {
    bg = {attribute = "bg", highlight = colors.default.dark},
    fg = {attribute = "fg", highlight = colors.default.comment}
  },
  close_button = {
    bg = {attribute = "bg", highlight = colors.default.dark},
    fg = {attribute = "fg", highlight = colors.default.comment}
  },
  close_button_visible = {
    bg = {attribute = "bg", highlight = colors.default.dark},
    fg = {attribute = "fg", highlight = colors.default.comment}
  },
  close_button_selected = {
    bg = {attribute = "fg", highlight = colors.default.cursor},
    fg = {attribute = "fg", highlight = colors.default.error}
  },
  indicator_selected = {
    bg = {attribute = "fg", highlight = colors.default.cursor},
    fg = {attribute = "bg", highlight = colors.default.cursor}
  },
  modified = {
    bg = {attribute = "bg", highlight = colors.default.dark},
    fg = {attribute = "fg", highlight = colors.default.green}
  },
  modified_visible = {
    bg = {attribute = "bg", highlight = colors.default.dark},
    fg = {attribute = "fg", highlight = colors.default.green}
  },
  modified_selected = {
    bg = {attribute = "fg", highlight = colors.default.cursor},
    fg = {attribute = "fg", highlight = colors.default.green}
  },
  separator = {
    bg = {attribute = "bg", highlight = colors.default.dark},
    fg = {attribute = "bg", highlight = colors.default.dark}
  },
  separator_visible = {
    bg = {attribute = "bg", highlight = colors.default.dark},
    fg = {attribute = "bg", highlight = colors.default.dark}
  },
  separator_selected = {
    bg = {attribute = "bg", highlight = colors.default.dark},
    fg = {attribute = "bg", highlight = colors.default.dark}
  },
  pick = {
    bg = {attribute = "bg", highlight = colors.default.dark},
    fg = {attribute = "fg", highlight = colors.default.error}
  },
  pick_visible = {
    bg = {attribute = "bg", highlight = colors.default.dark},
    fg = {attribute = "fg", highlight = colors.default.error}
  },
  pick_selected = {
    bg = {attribute = "fg", highlight = colors.default.cursor},
    fg = {attribute = "fg", highlight = colors.default.error}
  },
  duplicate = {
    bg = {attribute = "bg", highlight = colors.default.dark},
    fg = {attribute = "fg", highlight = colors.default.comment},
    italic = true
  }
}

M.opts = {
  options = {
    middle_mouse_command = "vertical sbuffer %d",
    indicator = {icon = icons.buffer.indicator, style = "none"},
    buffer_close_icon = icons.buffer.tab_close,
    modified_icon = icons.buffer.modified,
    close_icon = icons.buffer.close,
    left_trunc_marker = icons.buffer.left,
    right_trunc_marker = icons.buffer.right,
    max_name_length = 20,
    max_prefix_length = 20,
    tab_size = 20,
    offsets = {{filetype = "NvimTree", text = ""}}, -- padding = "1"
    show_close_icon = false,
    persist_buffer_sort = true,
    separator_style = "thin",
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    hover = {
      enabled = true,
      delay = 200,
      reveal = {'close'}
    },
  },
  highlights = M.bufferline,
}

M.maps = {
  { mode = {"n"}, lhs = "<leader>bi", rhs = "<cmd>BufferLineSortByDirectory<cr>", options = {silent = true}, desc = "Ordernar buffer por directorio" },
  { mode = {"n"}, lhs = "<leader>be", rhs = "<cmd>BufferLineSortByExtension<cr>", options = {silent = true}, desc = "Ordernar buffer por extensiones" },
  { mode = {"n"}, lhs = "<A-right>", rhs = "<cmd>BufferLineMoveNext<cr>", options = {silent = true}, desc = "Mover buffer hacía la derecha" },
  { mode = {"n"}, lhs = "<A-left>", rhs = "<cmd>BufferLineMovePrev<cr>", options = {silent = true}, desc = "Mover buffer hacía la izquierda" },
  { mode = {"n"}, lhs = "<C-z>", rhs = function() vim.cmd("BufferLineCloseRight") vim.cmd("BufferLineCloseLeft") end, options = {silent = true}, desc = "Cerrar todos los bufferes excepto la actual" },
  { mode = {"n"}, lhs = "<A-1>", rhs = "<cmd>BufferLineGoToBuffer 1<cr>", options = {silent = true}, desc = "Mover al primer buffer" },
  { mode = {"n"}, lhs = "Ñ", rhs = "<cmd>BufferLinePick<cr>", options = {silent = true}, desc = "Pickear en bufferes actuales" }
}

M.start = function()

  local ok_bufferline, bufferline = pcall(require, "bufferline")
  if not ok_bufferline then return end

  local ok_keybinds, keybinds = pcall(require,"core.functions")
  if not ok_keybinds then return end

  bufferline.setup(M.opts)

  keybinds.load_keybinds(M.maps)

end

return M
