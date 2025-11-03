local M = {}

M.diag = {
  Error = "󰅜",
  Hint = "",
  Info = "󰋼",
  Warn = "",
}

M.git = {
  Branch = "",
  Add = "󰐗",
  Change = "󰙦",
  Delete = "󰍶",
  Ignored = "◌",
  Staged = "✓",
  Unstaged = "✗",
  Untracked = "🟊",
  Renamed = "➜",
}

M.common = {
  DefaultFile = "",
  BookmarkFilled = "",
  FileModified = "",
  ActiveTS = "󰫈",
  Bug = "",
  Bug_alt = "",
  Bookmark = "",
  Default = "",
  Folder = "",
  FolderOpen = "",
  Empty = "",
  EmptyOpen = "",
  FolderSymlink = "󰉒",
  SymlinkOpen = "",
}

M.kind = {
  Array = " ",
  Boolean = " ",
  Class = " ",
  Color = " ",
  Constant = " ",
  Constructor = " ",
  Enum = " ",
  EnumMember = " ",
  Event = "󱐌 ",
  Field = " ",
  File = " ",
  Folder = " ",
  Function = " ",
  Key = " ",
  Keyword = "󱕴 ",
  Interface = " ",
  Namespace = " ",
  Null = "󰢤 ",
  Number = " ",
  Method = " ",
  Module = "󰏗 ",
  Object = " ",
  Operator = " ",
  Package = " ",
  Property = " ",
  Reference = " ",
  Snippet = " ",
  String = " ",
  Struct = " ",
  Text = " ",
  TypeParameter = " ",
  Unit = " ",
  Variable = "󰂡 ",
  Value = "󰎠 ",
}

return M
