local map = function(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { desc = desc, silent = true })
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable
map("n", "<esc>", "<cmd>noh<cr>", "General Clear Highlight")
map("n", "<c-z>", "<nop>", "Disable Ctrl+Z")
map("n", "q", "<nop>", "Disable Macro")
map("v", "q", "<nop>", "Disable Macro")
-- Cursor
map("n", "|", "^", "Move Cursor Beginning of Line")
-- Spell
map("n", "<leader>,e", "<cmd>set spell<cr>", "Enable Spell")
map("n", "<leader>,q", "<cmd>set nospell<cr>", "Disable Spell")
-- Diffmode
map("n", "<leader>dt", "<cmd>diffthis<cr>", "DiffThis")
map("n", "<leader>dz", "<cmd>diffoff<cr>", "DiffOff")
map("n", "<leader>du", "<cmd>diffput<cr>", "DiffPut")
-- Move line
map("n", "<a-up>", ":m .-2<cr>==", "Move Line Up")
map("n", "<a-down>", ":m .+1<cr>==", "Move Line Down")
map("x", "<a-up>", ":m '<-2<CR>gv-gv", "Move Line Up")
map("x", "<a-down>", ":m '>+1<CR>gv-gv", "Move Line Down")
-- Indent
map("v", "<", "<gv")
map("v", ">", ">gv")
-- Switch Windows
map("n", "<c-l>", "<C-w>l", "Switch Window Right")
map("n", "<c-h>", "<C-w>h", "Switch Window Left")
map("n", "<c-k>", "<C-w>k", "Switch Window Up")
map("n", "<c-j>", "<C-w>j", "Switch Window Down")
-- Resize Windows
map("n", "<c-right>", ":vert resize +2<cr>", "Resize Window Right")
map("n", "<c-left>", ":vert resize -2<cr>", "Resize Window Left")
-- map("n", "<c-up>", ":resize +2<cr>", "Resize Window Up")
-- map("n", "<c-down>", ":resize -2<cr>", "Resize Window Down")
-- Save Files
map("n", "<c-s>", "<cmd>w!<cr>", "Save File")
map("i", "<c-s>", "<cmd>w!<cr><esc>", "Save File")
-- Buffers
map("n", "<leader>ba", "<cmd>%y+<cr>", "Copy Buffer")
map("n", "<leader>bq", "<cmd>bd!<cr>", "Close Buffer")
map("n", "<leader>bn", "<cmd>enew<cr>", "New Buffer")
map("n", "<c-x>", "<cmd>qa!<cr>", "Close All Buffer")
-- map("n", "<tab>", "<cmd>bnext<cr>", "Next Buffer")
-- map("n", "<s-tab>", "<cmd>bprevious<cr>", "Previous Buffer")
-- Tab
map("n", "<leader>tn", "<cmd>tabnew<cr>", "New Tab")
map("n", "<leader>tk", "<cmd>tabnext<cr>", "Next Tab")
map("n", "<leader>tj", "<cmd>tabprevious<cr>", "Previous Tab")
map("n", "<leader>tq", "<cmd>tabclose<cr>", "Close Tab")
-- Terminal
map("t", "<esc>", "<C-\\><C-n>", "Escape Terminal Mode")
-- Misc
map("n", "<leader>n", "<cmd>set rnu!<cr>", "Toggle Relativenumber")
-- Lazy
map("n", "<leader>ps", "<cmd>Lazy<cr>", "Lazy")
map("n", "<leader>pu", "<cmd>Lazy update<cr>", "Lazy Update")
map("n", "<leader>py", "<cmd>Lazy sync<cr>", "Lazy Sync")
map("n", "<leader>pc", "<cmd>Lazy clean<cr>", "Lazy Clean")
