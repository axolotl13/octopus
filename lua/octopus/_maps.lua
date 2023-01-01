local opts = {
  -- Designar atajos
  {  "", "<space>", "<nop>", "" },
  {  "n", "<c-z>", "<nop>", "" },
  {  "n", "<esc>", "<cmd>noh<cr>", "" },

  -- Opciones para el cursor
  {  "n", "|", "^", "Mover el cursor al inicio" },
  {  "i", "<c-b>", "<ESC>^i", "Mover el cursor al inicio en modo insertar" },
  {  "i", "<c-e>", "<End>", "Mover el cursor al final en modo insertar" },
  {  "i", "<s-tab>", "<cmd>call search('[([{<]')<cr>", "Mover el cursor a los siguientes signos" },

  -- Habilitar idioma
  {  "n", "<leader>es", "<cmd>set spell<cr>", "Habilita idioma en español" },
  {  "n", "<leader>nes", "<cmd>set nospell<cr>", "Deshabilita idioma en español" },

  -- Diferenciar archivos
  {  "n", "<a-e>", "<cmd>diffthis<cr>", "Habilita diff en el buffer actual" },
  {  "n", "<a-q>", "<cmd>diffoff<cr>", "Deshabilita diff en el buffer actual" },
  {  "n", "<a-w>", "<cmd>diffput<cr>", "Copia diff en el buffer" },

  -- Mover texto
  {  "n", "<a-up>", ":m .-2<cr>==", "Mover línea hacía arriba" },
  {  "n", "<a-down>", ":m .+1<cr>==", "Mover línea hacía abajo" },
  {  "x", "<a-up>", ":m \'<-2<CR>gv-gv", "Mover líneas seleccionadas hacía arriba" },
  {  "x", "<a-down>", ":m \'>+1<CR>gv-gv", "Mover líneas seleccionadas hacía abajo" },

  -- Aplicar sangría
  {  "v", "<", "<gv", "Aplica sangría hacía la izquierda en modo visual" },
  {  "v", ">", ">gv", "Aplica sangría hacía la derecha en modo visual" },

  -- Moverse entre ventanas
  {  "n", "<c-h>", "<c-w>h", "Moverse hacía la vista izquierda" },
  {  "n", "<c-l>", "<c-w>l", "Moverse hacía la vista derecha" },
  {  "n", "<c-k>", "<c-w>k", "Moverse hacía la vista de arriba" },
  {  "n", "<c-j>", "<c-w>j", "Moverse hacía la vista de abajo" },

  -- Navegación entre bufferes
  {  "n", "<tab>", "<cmd>bnext<cr>", "Moverse hacía el anterior buffer" },
  {  "n", "<s-tab>", "<cmd>bprevious<cr>", "Moverse hacía el siguiente buffer" },
  {  "n", "<c-s>", "<cmd>w<cr>", "Guarda archivo actual" },
  {  "n", "<leader>ba", "<cmd>%y+<cr>", "Copiar todo el contenido del buffer actual" },
  {  "n", "<leader>bq", "<cmd>bd!<pr>", "Cerrar buffer actual" },
  {  "n", "<leader>bn", "<cmd>enew<cr>", "Crear nuevo buffer" },
  {  "n", "<c-x>", "<cmd>qa!<cr>", "Cerrar todos los bufferes actuales" },

  -- Navegación entre pestañas
  {  "n", "<leader>tn", "<cmd>tabnew<cr>", "Añadir nueva pestaña" },
  {  "n", "<leader>tj", "<cmd>tabprevious<cr>", "Moverse hacía la anterior pestaña" },
  {  "n", "<leader>tk", "<cmd>tabnext<cr>", "Moverse hacía la siguiente pestaña" },
  {  "n", "<leader>tq", "<cmd>tabclose<cr>", "Cerrar pestaña actual" },

  -- Lazy
  {  "n", "<leader>ps", "<cmd>Lazy<cr>", "Mostrar estado de los plugins" },
}

local map = vim.keymap.set

vim.g.mapleader = " "

for _, key in pairs(opts) do
  key.desc = key[4]
  map(key[1], key[2], key[3], { silent = true })
end
