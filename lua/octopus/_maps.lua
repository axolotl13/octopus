local keymap = function(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { desc = desc, silent = true })
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable
keymap("n", "<esc>", "<cmd>noh<cr>", "Clear highlight")
keymap("n", "<c-z>", "<nop>", "Disable ctrl+z")
keymap({ "n", "v" }, "q", "<nop>", "Disable Macro")
-- Cursor
keymap("n", "|", "^", "Move cursor beginning of line")
-- Spell
keymap("n", "<leader>,e", "<cmd>set spell!<cr>", "Toggle spell")
-- Diffmode
keymap("n", "<leader>dt", "<cmd>diffthis<cr>", "Diffthis")
keymap("n", "<leader>dQ", "<cmd>diffoff<cr>", "Diffoff")
-- Move line
keymap("n", "<a-up>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", "Move line up")
keymap("n", "<a-down>", "<cmd>execute 'move .+' . v:count1<cr>==", "Move line down")
keymap("v", "<a-up>", ":<c-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", "Move line up")
keymap("v", "<a-down>", ":<c-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", "Move line down")
keymap("n", "<c-d>", "<c-d>zz")
keymap("n", "<c-u>", "<c-u>zz")
-- Indent
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")
-- Switch Windows
keymap("n", "<c-l>", "<c-w>l", "Switch window right")
keymap("n", "<c-h>", "<c-w>h", "Switch window left")
keymap("n", "<c-k>", "<c-w>k", "Switch window up")
keymap("n", "<c-j>", "<c-w>j", "Switch window down")
-- Resize Windows
keymap("n", "<c-right>", ":vert resize +2<cr>", "Resize window right")
keymap("n", "<c-left>", ":vert resize -2<cr>", "Resize window left")
-- keymap("n", "<c-up>", ":resize +2<cr>", "Resize window up")
-- keymap("n", "<c-down>", ":resize -2<cr>", "Resize window down")
-- Save Files
keymap("n", "<c-s>", "<cmd>w!<cr>", "Save file")
keymap("i", "<c-s>", "<cmd>w!<cr><esc>", "Save file")
-- Buffers
keymap("n", "<leader>ba", "<cmd>%y+<cr>", "Copy buffer")
keymap("n", "<leader>bd", "<cmd>%d+<cr>", "Remove all text")
keymap("n", "<leader>bq", "<cmd>bd!<cr>", "Close buffer")
keymap("n", "<leader>bn", "<cmd>enew<cr>", "New buffer")
keymap("n", "<c-x>", "<cmd>qa!<cr>", "Close all buffer")
keymap("n", "<tab>", "<cmd>bnext<cr>", "Next buffer")
keymap("n", "<s-tab>", "<cmd>bprevious<cr>", "Previous buffer")
-- Tab
keymap("n", "<leader>tn", "<cmd>tabnew<cr>", "New tab")
keymap("n", "<leader>tN", "<cmd>tabnext<cr>", "Next tab")
keymap("n", "<leader>tP", "<cmd>tabprevious<cr>", "Previous tab")
keymap("n", "<leader>tq", "<cmd>tabclose<cr>", "Close tab")
-- Terminal
keymap("t", "<esc>", "<c-\\><c-n>", "Escape terminal mode")
-- Misc
keymap("n", "<leader>n", "<cmd>set rnu!<cr>", "Toggle relative number")
-- Lazy
keymap("n", "<leader>ps", "<cmd>Lazy<cr>", "Lazy")
keymap("n", "<leader>pu", "<cmd>Lazy update<cr>", "Lazy update")
keymap("n", "<leader>py", "<cmd>Lazy sync<cr>", "Lazy sync")
keymap("n", "<leader>pc", "<cmd>Lazy clean<cr>", "Lazy clean")
