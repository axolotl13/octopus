local ok_buffer, buffer = pcall(require, "bufferline")
local ok_icons, icons = pcall(require, "ui.icons")
if not ok_buffer and ok_icons then return end

colors = {
  cursor = "Cursor",
  black = "ColorColumn",
  darker = "CursorColumn",
  dark = "NormalFloat",
  comment = "Comment",
  light = "ModeMsg",
  error = "Error",
  green = "String",
  magenta = "Identifier",
  red = "DiffDelete",
  add = "DiffAdd",
  change = "DiffChange",
  orange = "Constant",
  cyan = "Keyword",
  blue = "Directory"
}

local bufferline = {
  fill = {
    bg = {attribute = "bg", highlight = colors.dark},
    fg = {attribute = "fg", highlight = colors.cursor}
  },
  background = {
    bg = {attribute = "bg", highlight = colors.dark},
    fg = {attribute = "fg", highlight = colors.comment}
  },
  tab = {
    bg = {attribute = "bg", highlight = colors.dark},
    fg = {attribute = "fg", highlight = colors.comment}
  },
  tab_selected = {
    bg = {attribute = "bg", highlight = colors.dark},
    fg = {attribute = "bg", highlight = colors.cursor}
  },
  tab_close = {
    bg = {attribute = "bg", highlight = colors.dark},
    fg = {attribute = "fg", highlight = colors.error}
  },
  buffer_selected = {
    bg = {attribute = "fg", highlight = colors.cursor},
    fg = {attribute = "bg", highlight = colors.cursor},
    italic = false
  },
  buffer_visible = {
    bg = {attribute = "bg", highlight = colors.dark},
    fg = {attribute = "fg", highlight = colors.comment}
  },
  close_button = {
    bg = {attribute = "bg", highlight = colors.dark},
    fg = {attribute = "fg", highlight = colors.comment}
  },
  close_button_visible = {
    bg = {attribute = "bg", highlight = colors.dark},
    fg = {attribute = "fg", highlight = colors.comment}
  },
  close_button_selected = {
    bg = {attribute = "fg", highlight = colors.cursor},
    fg = {attribute = "fg", highlight = colors.error}
  },
  indicator_selected = {
    bg = {attribute = "fg", highlight = colors.cursor},
    fg = {attribute = "bg", highlight = colors.cursor}
  },
  modified = {
    bg = {attribute = "bg", highlight = colors.dark},
    fg = {attribute = "fg", highlight = colors.green}
  },
  modified_visible = {
    bg = {attribute = "bg", highlight = colors.dark},
    fg = {attribute = "fg", highlight = colors.green}
  },
  modified_selected = {
    bg = {attribute = "fg", highlight = colors.cursor},
    fg = {attribute = "fg", highlight = colors.green}
  },
  separator = {
    bg = {attribute = "bg", highlight = colors.dark},
    fg = {attribute = "bg", highlight = colors.dark}
  },
  separator_visible = {
    bg = {attribute = "bg", highlight = colors.dark},
    fg = {attribute = "bg", highlight = colors.dark}
  },
  separator_selected = {
    bg = {attribute = "bg", highlight = colors.dark},
    fg = {attribute = "bg", highlight = colors.dark}
  },
  pick = {
    bg = {attribute = "bg", highlight = colors.dark},
    fg = {attribute = "fg", highlight = colors.error}
  },
  pick_visible = {
    bg = {attribute = "bg", highlight = colors.dark},
    fg = {attribute = "fg", highlight = colors.error}
  },
  pick_selected = {
    bg = {attribute = "fg", highlight = colors.cursor},
    fg = {attribute = "fg", highlight = colors.error}
  },
  duplicate = {
    bg = {attribute = "bg", highlight = colors.dark},
    fg = {attribute = "fg", highlight = colors.comment},
    italic = true
  }
}

local opts = {
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
  highlights = bufferline,
}

buffer.setup(opts)
