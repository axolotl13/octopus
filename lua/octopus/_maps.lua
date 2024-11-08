local map = function(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { desc = desc, silent = true })
end

vim.g.mapleader = " "

-- Disable
map("n", "<esc>", "<cmd>noh<cr>", "General clear highlight")
map("n", "<c-z>", "<nop>", "Disable Ctrl+Z")
-- Cursor
map("n", "|", "^", "Move cursor beginning of line")
-- Spell
map("n", "<leader>,e", "<cmd>set spell<cr>", "Enable Spell")
map("n", "<leader>,q", "<cmd>set nospell<cr>", "Disable Spell")
-- Diffmode
map("n", "<leader>dt", "<cmd>diffthis<cr>", "Diffthis")
map("n", "<leader>dz", "<cmd>diffoff<cr>", "Diffoff")
map("n", "<leader>du", "<cmd>diffput<cr>", "Diffput")
-- Move line
map("n", "<a-up>", ":m .-2<cr>==", "Move line up")
map("n", "<a-down>", ":m .+1<cr>==", "Move line down")
map("x", "<a-up>", ":m '<-2<CR>gv-gv", "Move line up")
map("x", "<a-down>", ":m '>+1<CR>gv-gv", "Move line down")
-- Indent
map("v", "<", "<gv")
map("v", ">", ">gv")
-- Switch Windows
map("n", "<c-l>", "<C-w>l", "Switch window right")
map("n", "<c-h>", "<C-w>h", "Switch window left")
map("n", "<c-k>", "<C-w>k", "Switch window up")
map("n", "<c-j>", "<C-w>j", "Switch window down")
-- Resize Windows
map("n", "<c-right>", ":vert resize +2<cr>", "Resize window right")
map("n", "<c-left>", ":vert resize -2<cr>", "Resize window left")
-- ( "n", "<c-up>", ":resize +2<cr>", "Resize window up" )
-- ( "n", "<c-down>", ":resize -2<cr>", "Resize window down" )
-- Save Files
map("n", "<c-s>", "<cmd>w!<cr>", "Save File")
map("i", "<c-s>", "<cmd>w!<cr><esc>", "Save File")
-- Buffers
map("n", "<leader>ba", "<cmd>%y+<cr>", "Copy Buffer")
map("n", "<leader>bq", "<cmd>bd!<cr>", "Close Buffer")
map("n", "<leader>bn", "<cmd>enew<cr>", "New Buffer")
map("n", "<c-x>", "<cmd>qa!<cr>", "Close all buffer")
map("n", "<tab>", "<cmd>bnext<cr>", "Next Buffer")
map("n", "<s-tab>", "<cmd>bprevious<cr>", "Previous Buffer")
-- Tab
map("n", "<leader>tn", "<cmd>tabnew<cr>", "New Tab")
map("n", "<leader>tk", "<cmd>tabnext<cr>", "Next Tab")
map("n", "<leader>tj", "<cmd>tabprevious<cr>", "Previous Tab")
map("n", "<leader>tq", "<cmd>tabclose<cr>", "Close Tab")
-- Terminal
map("t", "<esc>", "<C-\\><C-n>", "Escape terminal mode")
-- Misc
map("n", "<leader>n", "<cmd>set rnu!<cr>", "Toggle Relativenumber")
