local icons_ok, icons = pcall(require, "ui.icons")
local gitsigns_ok, gitsigns = pcall(require, "gitsigns")
if not gitsigns_ok and icons_ok then return end

local opts = {
  signs = {
    add = {
      hl = 'GitSignsAdd',
      text = icons.signs.add,
      numhl = 'GitSignsAddNr',
      linehl = 'GitSignsAddLn'
    },
    change = {
      hl = 'GitSignsChange',
      text = icons.signs.add,
      numhl = 'GitSignsChangeNr',
      linehl = 'GitSignsChangeLn'
    },
    delete = {
      hl = 'GitSignsDelete',
      text = icons.signs.add,
      numhl = 'GitSignsDeleteNr',
      linehl = 'GitSignsDeleteLn'
    },
    topdelete = {
      hl = 'GitSignsDelete',
      text = icons.signs.add,
      numhl = 'GitSignsDeleteNr',
      linehl = 'GitSignsDeleteLn'
    },
    changedelete = {
      hl = 'GitSignsChange',
      text = icons.signs.add,
      numhl = 'GitSignsChangeNr',
      linehl = 'GitSignsChangeLn'
    }
  },
  signcolumn = true,
  numhl = false,
  linehl = false,
  word_diff = false,
  watch_gitdir = {interval = 1000, follow_files = true},
  attach_to_untracked = false,
  current_line_blame = false,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol",
    delay = 1000
    -- ignore_whitespace = false,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil,
  max_file_length = 20000,
  preview_config = {
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  }
}

gitsigns.setup(opts)
