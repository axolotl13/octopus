local opts = {
  -- Designar atajos
  { "", "<space>", "<nop>", "Designar espacio" },
  { "n", "<c-z>", "<nop>", "Designar ctrl + z" },
  { "n", "<esc>", "<cmd>noh<cr>", "Designar esc" },

  -- Opciones para el cursor
  { "n", "|", "^", "[Cursor] Mover al inicio" },
  { "i", "<c-b>", "<ESC>^i", "[Cursor] Mover inicio en modo insertar" },
  { "i", "<c-e>", "<End>", "[Cursor] Mover al final en modo insertar" },
  --[[ { "i", "<s-tab>", "<cmd>call search('[([{<]')<cr>", "[Cursor] Mover a los siguientes signos" }, ]]

  -- Habilitar idioma
  { "n", "<leader>es", "<cmd>set spell<cr>", "[Spell] Habilitar idioma en español" },
  { "n", "<leader>nes", "<cmd>set nospell<cr>", "[Spell] Deshabilitar idioma en español" },

  -- Diferenciar archivos
  { "n", "<a-e>", "<cmd>diffthis<cr>", "[Diff] Habilitar diferencia en el buffer actual" },
  { "n", "<a-q>", "<cmd>diffoff<cr>", "[Diff] Deshabilitar diferencia en el buffer actual" },
  { "n", "<a-w>", "<cmd>diffput<cr>", "[Diff] Copia diferencia en el buffer" },

  -- Mover texto
  { "n", "<a-up>", ":m .-2<cr>==", "Mover línea hacía arriba" },
  { "n", "<a-down>", ":m .+1<cr>==", "Mover línea hacía abajo" },
  { "x", "<a-up>", ":m '<-2<CR>gv-gv", "Mover líneas seleccionadas hacía arriba" },
  { "x", "<a-down>", ":m '>+1<CR>gv-gv", "Mover líneas seleccionadas hacía abajo" },

  -- Aplicar sangría
  { "v", "<", "<gv", "Aplica sangría hacía la izquierda en modo visual" },
  { "v", ">", ">gv", "Aplica sangría hacía la derecha en modo visual" },

  -- Moverse entre ventanas
  { "n", "<c-h>", "<c-w>h", "[Window] Moverse hacía la vista izquierda" },
  { "n", "<c-l>", "<c-w>l", "[Window] Moverse hacía la vista derecha" },
  { "n", "<c-k>", "<c-w>k", "[Window] Moverse hacía la vista de arriba" },
  { "n", "<c-j>", "<c-w>j", "[Window] Moverse hacía la vista de abajo" },

  -- Redimensionar ventana
  { "n", "<c-up>", ":resize +2<cr>", "[Window] Redimensionar vista hacía arriba" },
  { "n", "<c-down>", ":resize -2<cr>", "[Window] Redimensionar vista hacía abajo" },
  { "n", "<c-left>", ":vertical resize -2<cr>", "[Window] Redimensionar vista hacía la izquierda" },
  { "n", "<c-right>", ":vertical resize +2<cr>", "[Window] Redimensionar vista hacía la derecha" },

  -- Navegación entre bufferes
  { "n", "<tab>", "<cmd>bnext<cr>", "[Buffer] Moverse hacía el anterior buffer" },
  { "n", "<s-tab>", "<cmd>bprevious<cr>", "[Buffer] Moverse hacía el siguiente buffer" },
  { "n", "<c-s>", "<cmd>w!<cr>", "[Save] Guarda archivo actual" },
  { "i", "<c-s>", "<cmd>w<cr><esc>", "[Save] Guarda archivo actual en modo insertar" },
  { "n", "<leader>ba", "<cmd>%y+<cr>", "[Buffer] Copiar todo el contenido del buffer actual" },
  { "n", "<leader>bq", "<cmd>bd!<cr>", "[Buffer] Cerrar buffer actual" },
  { "n", "<leader>bn", "<cmd>enew<cr>", "[Buffer] Crear nuevo buffer" },
  { "n", "<c-x>", "<cmd>qa!<cr>", "[Buffer] Cerrar todos los bufferes actuales" },

  -- Navegación entre pestañas
  { "n", "<leader>tn", "<cmd>tabnew<cr>", "[Pestaña] Añadir nueva pestaña" },
  { "n", "<leader>tj", "<cmd>tabprevious<cr>", "[Pestaña] Moverse hacía la anterior pestaña" },
  { "n", "<leader>tk", "<cmd>tabnext<cr>", "[Pestaña] Moverse hacía la siguiente pestaña" },
  { "n", "<leader>tq", "<cmd>tabclose<cr>", "[Pestaña] Cerrar pestaña actual" },

  -- Terminal
  { "t", "<esc>", "<C-\\><C-n>", "Escapa de la terminal" },

  -- Lazy
  { "n", "<leader>ps", "<cmd>Lazy<cr>", "Mostrar estado de los plugins" },
  { "v", "<leader>re", ":'<,'>SnipRun<cr>", "[SnipRun] Ejecutar bloque de código" },
}

vim.g.mapleader = " "

for _, key in pairs(opts) do
  vim.keymap.set(key[1], key[2], key[3], { desc = key[4], silent = true })
end
