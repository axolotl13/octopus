local keymap = vim.keymap.set

vim.g.mapleader = " "

keymap("", "<space>", "<nop>", { desc = "Desasignar espacio", silent = true })
keymap("n", "<c-z>", "<nop>", { desc = "Desasignar ctrl+z", silent = true })
-- keymap( { "n", "i" }, "<esc>", "<cmd>noh<cr>", "Desasignar esc" )
-- Cursor
keymap("n", "|", "^", { desc = "[Cursor] Mover cursor al inicio", silent = true })
-- Habilitar idioma
keymap("n", "<leader>es", "<cmd>set spell<cr>", { desc = "[Spell] Habilitar spell", silent = true })
keymap("n", "<leader>eq", "<cmd>set nospell<cr>", { desc = "[Spell] Deshabilitar spell", silent = true })
-- Diff
keymap("n", "<a-e>", "<cmd>diffthis<cr>", { desc = "[Diff] Habilitar diff en el buffer", silent = true })
keymap("n", "<a-q>", "<cmd>diffoff<cr>", { desc = "[Diff] Deshabilitar diff en el buffer", silent = true })
keymap("n", "<a-w>", "<cmd>diffput<cr>", { desc = "[Diff] Copiar diff en el buffer", silent = true })
-- Mover texto
keymap("n", "<a-up>", ":m .-2<cr>==", { desc = "Mover línea hacía arriba", silent = true })
keymap("n", "<a-down>", ":m .+1<cr>==", { desc = "Mover línea hacía abajo", silent = true })
keymap("x", "<a-up>", ":m '<-2<CR>gv-gv", { desc = "Mover líneas seleccionadas hacía arriba", silent = true })
keymap("x", "<a-down>", ":m '>+1<CR>gv-gv", { desc = "Mover líneas seleccionadas hacía abajo", silent = true })
-- Sangría
keymap("v", "<", "<gv", { desc = "Aplicar sangría a la izquierda", silent = true })
keymap("v", ">", ">gv", { desc = "Aplicar sangría a la derecha", silent = true })
-- Moverse entre ventana
keymap("n", "<c-h>", "<c-w>h", { desc = "[Window] Cambiar a la vista izquierda", silent = true })
keymap("n", "<c-l>", "<c-w>l", { desc = "[Window] Cambiar a la vista derecha", silent = true })
keymap("n", "<c-k>", "<c-w>k", { desc = "[Window] Cambiar a la vista de arriba", silent = true })
keymap("n", "<c-j>", "<c-w>j", { desc = "[Window] Cambiar a la vista de abajo", silent = true })
-- Redimensionar ventan
keymap("n", "<c-up>", ":resize +2<cr>", { desc = "[Window] Redimensionar hacía arriba", silent = true })
keymap("n", "<c-down>", ":resize -2<cr>", { desc = "[Window] Redimensionar hacía abajo", silent = true })
keymap(
  "n",
  "<c-left>",
  ":vertical resize -2<cr>",
  { desc = "[Window] Redimensionar hacía la izquierda", silent = true }
)
keymap(
  "n",
  "<c-right>",
  ":vertical resize +2<cr>",
  { desc = "[Window] Redimensionar hacía la derecha", silent = true }
)
-- Buffer
keymap("n", "<c-s>", "<cmd>w!<cr>", { desc = "[Save] Guarda archivo", silent = true })
keymap("i", "<c-s>", "<cmd>w!<cr><esc>", { desc = "[Save] Guarda archivo", silent = true })
keymap("n", "<tab>", "<cmd>bnext<cr>", { desc = "[Buffer] Cambiar al buffer anterior", silent = true })
keymap("n", "<s-tab>", "<cmd>bprevious<cr>", { desc = "[Buffer] Cambiar al buffer próximo", silent = true })
keymap("n", "<leader>ba", "<cmd>%y+<cr>", { desc = "[Buffer] Copiar contenido del buffer", silent = true })
keymap("n", "<leader>bq", "<cmd>bd!<cr>", { desc = "[Buffer] Cerrar buffer", silent = true })
keymap("n", "<leader>bn", "<cmd>enew<cr>", { desc = "[Buffer] Crear buffer nuevo", silent = true })
keymap("n", "<c-x>", "<cmd>qa!<cr>", { desc = "[Buffer] Cerrar todos los bufferes", silent = true })
-- Tabline
keymap("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "[Tabline] Añadir nuevo tabline", silent = true })
keymap("n", "<leader>tj", "<cmd>tabprevious<cr>", { desc = "[Tabline] Cambiar al tabline anterior", silent = true })
keymap("n", "<leader>tk", "<cmd>tabnext<cr>", { desc = "[Tabline] Cambiar al tabline próximo", silent = true })
keymap("n", "<leader>tq", "<cmd>tabclose<cr>", { desc = "[Tabline] Cerrar tabline", silent = true })
-- Terminal
keymap("t", "<esc>", "<C-\\><C-n>", { desc = "[Terminal] Escapa de la terminal", silent = true })
-- keymap( "n", "<leader>tt", "<cmd>15split term://fish<cr>", "[Terminal] Abrir terminal horizontal" )
-- Lazy
keymap("n", "<leader>ps", "<cmd>Lazy<cr>", { desc = "[Lazy] Abrir Lazy", silent = true })
-- ( "n", "<f5>", "<cmd>!python3 %<cr>", "Ejecutar Código Python"
