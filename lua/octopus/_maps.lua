local keymap = function(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { desc = desc, silent = true })
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable
keymap("n", "<esc>", "<cmd>noh<cr>", "Clear Highlight")
keymap("n", "<c-z>", "<nop>", "Disable ctrl+z")
keymap({"n", "v"}, "q", "<nop>", "Disable Macro")
-- Cursor
keymap("n", "|", "^", "Move Cursor Beginning of Line")
-- Spell
keymap("n", "<leader>,e", "<cmd>set spell!<cr>", "Toggle Spell")
-- Diffmode
keymap("n", "<leader>dt", "<cmd>diffthis<cr>", "DiffThis")
keymap("n", "<leader>dQ", "<cmd>diffoff<cr>", "DiffOff")
-- Move line
keymap("n", "<a-up>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", "Move Line Up")
keymap("n", "<a-down>", "<cmd>execute 'move .+' . v:count1<cr>==", "Move Line Down")
keymap("v", "<a-up>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", "Move Line Up")
keymap("v", "<a-down>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", "Move Line Down")
keymap("n", "<c-d>", "<c-d>zz")
keymap("n", "<c-u>", "<c-u>zz")
-- Indent
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")
-- Switch Windows
keymap("n", "<c-l>", "<c-w>l", "Switch Window Right")
keymap("n", "<c-h>", "<c-w>h", "Switch Window Left")
keymap("n", "<c-k>", "<c-w>k", "Switch Window Up")
keymap("n", "<c-j>", "<c-w>j", "Switch Window Down")
-- Resize Windows
keymap("n", "<c-right>", ":vert resize +2<cr>", "Resize Window Right")
keymap("n", "<c-left>", ":vert resize -2<cr>", "Resize Window Left")
-- map("n", "<c-up>", ":resize +2<cr>", "Resize Window Up")
-- map("n", "<c-down>", ":resize -2<cr>", "Resize Window Down")
-- Save Files
keymap("n", "<c-s>", "<cmd>w!<cr>", "Save File")
keymap("i", "<c-s>", "<cmd>w!<cr><esc>", "Save File")
-- Buffers
keymap("n", "<leader>ba", "<cmd>%y+<cr>", "Copy Buffer")
keymap("n", "<leader>bd", "<cmd>%d+<cr>", "Remove All Text")
keymap("n", "<leader>bq", "<cmd>bd!<cr>", "Close Buffer")
keymap("n", "<leader>bn", "<cmd>enew<cr>", "New Buffer")
keymap("n", "<c-x>", "<cmd>qa!<cr>", "Close All Buffer")
keymap("n", "<tab>", "<cmd>bnext<cr>", "Next Buffer")
keymap("n", "<s-tab>", "<cmd>bprevious<cr>", "Previous Buffer")
-- Tab
keymap("n", "<leader>tn", "<cmd>tabnew<cr>", "New Tab")
keymap("n", "<leader>tN", "<cmd>tabnext<cr>", "Next Tab")
keymap("n", "<leader>tP", "<cmd>tabprevious<cr>", "Previous Tab")
keymap("n", "<leader>tq", "<cmd>tabclose<cr>", "Close Tab")
-- Terminal
keymap("t", "<esc>", "<c-\\><c-n>", "Escape Terminal Mode")
-- Misc
keymap("n", "<leader>n", "<cmd>set rnu!<cr>", "Toggle Relativenumber")
-- Lazy
keymap("n", "<leader>ps", "<cmd>Lazy<cr>", "Lazy")
keymap("n", "<leader>pu", "<cmd>Lazy update<cr>", "Lazy Update")
keymap("n", "<leader>py", "<cmd>Lazy sync<cr>", "Lazy Sync")
keymap("n", "<leader>pc", "<cmd>Lazy clean<cr>", "Lazy Clean")
