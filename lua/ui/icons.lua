local icons = {
  packer = {
    working = "",
    error = "✗ ",
    done = " ",
    removed = " ",
    moved = "",
  },
  global = {
    default = "",
    prefix = "",
    symlink = "",
    symlink_arrow = "  ",
  },
  explorer = {
    -- arrow_closed = "",
    -- arrow_open = "",
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
    symlink_open = "",
  },
  git = {
    add = "",
    change = "柳",
    unstaged = "✗",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = "",
    deleted = "",
    ignored = "◌",
  },
  diagnostics = {
    hint = "", -- 
    info = "", -- 
    -- warning = "",
    -- error = "", 
  },
  signs = {
    add = "┃", -- ┃ │
    -- delete = "━",
    -- top_delete = "🭶",
    -- change_delete = "═",
  },

}

return icons
