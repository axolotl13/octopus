local opt = vim.opt
local g = vim.g

opt.background = "dark" -- Background color
opt.backspace:append { "nostop" } -- Don't stop backspace at insert
opt.backup = false -- Make backups before writing
opt.clipboard = "unnamedplus" -- System clipboard
opt.cursorline = true -- Highlight the text line of the cursor
opt.expandtab = true -- Enable the use of space in tab
opt.fileencoding = "utf-8" -- File content encoding for the buffer
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
opt.foldenable = true
opt.foldcolumn = "1"
opt.foldlevelstart = 99
opt.foldlevel = 99
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldtext = ""
opt.guicursor = "n:blinkon200,i-ci-ve:ver25" -- Enable cursor blink
opt.hidden = true -- Allows you to hide buffers with unsaved changes
opt.ignorecase = false -- Case insensitive searching
opt.laststatus = 3 -- Global statusline
opt.list = true -- Show invisible characters
opt.listchars = {
  eol = "↩",
  trail = "·",
  lead = "·",
  tab = "..",
}
opt.mouse = "a" -- Enable mouse support
opt.number = true -- Show numberline
opt.pumheight = 15 -- Height of the pop up menu
opt.relativenumber = true -- Show relative numberline
opt.scrolloff = 6 -- Number of lines to leave before/after the cursor when scrolling
opt.shiftwidth = 2 -- Number of space inserted for indentation
opt.shortmess:append { s = true, I = true, c = true } -- Disable search count wrap and startup messages
opt.showmode = false -- Disable showing modes in command line
opt.sidescrolloff = 6 -- Same but for side scrolling.
opt.smartcase = true -- Case sensitivie searching
opt.smartindent = true -- Smarter autoindentation
opt.smoothscroll = true
opt.spelllang = "en" -- Spellchecking in english by default
opt.splitbelow = true -- Splitting a new window below the current one
opt.splitright = true -- Splitting a new window at the right of the current one
opt.swapfile = false -- Ask what state to recover when opening a file that was not saved
opt.tabstop = 2 -- Number of space in a tab
opt.termguicolors = true -- Enable 24-bit RGB color
opt.timeoutlen = 300 -- Shorten key timeout length a little bit for which-key
opt.title = true -- Set terminal title
opt.undofile = true -- Enable persistent undo
opt.updatetime = 300 -- Length of time to wait before triggering the plugin
opt.whichwrap = "b,s,<,>,[,],h,l" -- Go to previous/next line
opt.wrap = false -- Disable wrapping of lines longer than the width of window
opt.writebackup = false -- Disable making a backup before overwriting a file

g.loaded_perl_provider = 0 -- Disable perl provider
g.loaded_ruby_provider = 0 -- Disable ruby provider
g.loaded_node_provider = 0 -- Disable node provider
