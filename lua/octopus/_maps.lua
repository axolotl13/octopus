local keymap = function(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { desc = desc, silent = true })
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable
keymap("n", "<esc>", "<cmd>noh<cr>", "clear highlight")
keymap("n", "<c-z>", "<nop>", "disable ctrl+z")
keymap({ "n", "v" }, "q", "<nop>", "disable Macro")
-- Cursor
keymap("n", "|", "^", "move cursor beginning of line")
-- Spell
keymap("n", "<leader>,e", "<cmd>set spell!<cr>", "toggle spell")
-- Diffmode
keymap("n", "<leader>dt", "<cmd>diffthis<cr>", "diffthis")
keymap("n", "<leader>dQ", "<cmd>diffoff<cr>", "diffoff")
-- Move line
keymap("n", "<a-up>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", "move line up")
keymap("n", "<a-down>", "<cmd>execute 'move .+' . v:count1<cr>==", "move line down")
keymap("v", "<a-up>", ":<c-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", "move line up")
keymap("v", "<a-down>", ":<c-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", "move line down")
keymap("n", "<c-d>", "<c-d>zz")
keymap("n", "<c-u>", "<c-u>zz")
-- Indent
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")
-- Switch Windows
keymap("n", "<c-l>", "<c-w>l", "switch window right")
keymap("n", "<c-h>", "<c-w>h", "switch window left")
keymap("n", "<c-k>", "<c-w>k", "switch window up")
keymap("n", "<c-j>", "<c-w>j", "switch window down")
-- Resize Windows
keymap("n", "<c-right>", ":vert resize +2<cr>", "resize window right")
keymap("n", "<c-left>", ":vert resize -2<cr>", "resize window left")
-- keymap("n", "<c-up>", ":resize +2<cr>", "resize window up")
-- keymap("n", "<c-down>", ":resize -2<cr>", "resize window down")
-- Save Files
keymap("n", "<c-s>", "<cmd>w!<cr>", "save file")
keymap("i", "<c-s>", "<cmd>w!<cr><esc>", "save file")
-- Buffers
keymap("n", "<leader>ba", "<cmd>%y+<cr>", "copy buffer")
keymap("n", "<leader>bd", "<cmd>%d+<cr>", "remove all text")
keymap("n", "<leader>bq", "<cmd>bd!<cr>", "close buffer")
keymap("n", "<leader>bn", "<cmd>enew<cr>", "new buffer")
keymap("n", "<c-x>", "<cmd>qa!<cr>", "close all buffer")
keymap("n", "<tab>", "<cmd>bnext<cr>", "next buffer")
keymap("n", "<s-tab>", "<cmd>bprevious<cr>", "previous buffer")
-- Tab
keymap("n", "<leader>tn", "<cmd>tabnew<cr>", "new tab")
keymap("n", "<leader>tN", "<cmd>tabnext<cr>", "next tab")
keymap("n", "<leader>tP", "<cmd>tabprevious<cr>", "previous tab")
keymap("n", "<leader>tq", "<cmd>tabclose<cr>", "close tab")
-- Terminal
keymap("t", "<esc>", "<c-\\><c-n>", "escape terminal mode")
-- Misc
keymap("n", "<leader>n", "<cmd>set rnu!<cr>", "toggle relativenumber")
-- Lazy
keymap("n", "<leader>ps", "<cmd>Lazy<cr>", "lazy")
keymap("n", "<leader>pu", "<cmd>Lazy update<cr>", "lazy update")
keymap("n", "<leader>py", "<cmd>Lazy sync<cr>", "lazy sync")
keymap("n", "<leader>pc", "<cmd>Lazy clean<cr>", "lazy clean")
