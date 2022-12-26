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
    arrow_closed = "",
    arrow_open = "",
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
  buffer = {
    indicator = "▎",
    tab_close = "",
    modified = "●",
    close = "",
    left = "",
    right = "",
  },
  kinds_icons = {
    Array = "",
    Boolean = "",
    Class = "",
    Color = "",
    Constant = "",
    Constructor = "",
    Enum = "練",
    EnumMember = "",
    Event = "🗲",
    Field = "",
    File = "",
    Folder = "",
    Function = "",
    Interface = "ﰮ",
    Keyword = "",
    Null = "ﳠ",
    Namespace = "",
    Number = "",
    Method = "",
    Module = "",
    Object = "",
    Operator = "",
    Package = "ﰪ",
    Property = "",
    Reference = "",
    Snippet = "",
    String = "",
    Struct = "פּ",
    Text = "",
    TypeParameter = "",
    Unit = "",
    Value = "",
    Variable = ""
  }
}

return icons
