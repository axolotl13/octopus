local opts = {

  -- Designar atajos
  { mode = {""}, lhs = "<space>", rhs = "<nop>", options = {silent = true}, desc = "" },
  { mode = {"n"}, lhs = "<c-z>", rhs = "<nop>", options = {silent = true}, desc = "" },
  { mode = {"n"}, lhs = "<esc>", rhs = "<cmd>noh<cr>", options = {silent = true}, desc = "" },

  -- Opciones para el cursor
  { mode = {"n"}, lhs = "|", rhs = "^", options = {silent = true}, desc = "Mueve el cursor al inicio de la oración" },
  { mode = {"i"}, lhs = "<c-b>", rhs = "<ESC>^i", options = {silent = true}, desc = "Mueve el cursor al inicio de la oración" },
  { mode = {"i"}, lhs = "<c-e>", rhs = "<End>", options = {silent = true}, desc = "Mueve el cursor al final de la oración" },
  { mode = {"i"}, lhs = "<s-tab>", rhs = "<cmd>call search('[([{<]')<cr>", options = {silent = true}, desc = "Mueve el cursor a los siguientes signos" },

  -- Habilitar idioma
  { mode = {"n"}, lhs = "<leader>es", rhs = "<cmd>set spell<cr>", options = {silent = true}, desc = "Habilitar idioma en español" },
  { mode = {"n"}, lhs = "<leader>nes", rhs = "<cmd>set nospell<cr>", options = {silent = true}, desc = "Deshabilitar idioma en español" },

  -- Diferenciar archivos
  { mode = {"n"}, lhs = "<a-e>", rhs = "<cmd>diffthis<cr>", options = {silent = true}, desc = "Habilitar diferencias con el archivo actual" },
  { mode = {"n"}, lhs = "<a-q>", rhs = "<cmd>diffoff<cr>", options = {silent = true}, desc = "Deshabilitar diferencias con el archivo actual" },
  { mode = {"n"}, lhs = "<a-w>", rhs = "<cmd>diffput<cr>", options = {silent = true}, desc = "Copiar diferencia" },

  -- Mover texto
  { mode = {"n"}, lhs = "<a-up>", rhs = ":m .-2<cr>==", options = {silent = true}, desc = "Mover línea hacía arriba" },
  { mode = {"n"}, lhs = "<a-down>", rhs = ":m .+1<cr>==", options = {silent = true}, desc = "Mover línea hacía abajo" },
  { mode = {"x"}, lhs = "<a-up>", rhs = ":m \'<-2<CR>gv-gv", options = {silent = true}, desc = "Mover líneas hacía arriba" },
  { mode = {"x"}, lhs = "<a-down>", rhs = ":m \'>+1<CR>gv-gv", options = {silent = true}, desc = "Mover líneas hacía abajo" },

  -- Aplicar sangría
  { mode = {"v"}, lhs = "<", rhs = "<gv", options = {silent = true}, desc = "Aplica sangría hacía la izquierda" },
  { mode = {"v"}, lhs = ">", rhs = ">gv", options = {silent = true}, desc = "Aplica sangría hacía la derecha" },

  -- Moverse entre ventanas
  { mode = {"n"}, lhs = "<c-h>", rhs = "<c-w>h", options = {silent = true}, desc = "Moverse hacía la vista izquierda" },
  { mode = {"n"}, lhs = "<c-l>", rhs = "<c-w>l", options = {silent = true}, desc = "Moverse hacía la vista derecha" },
  { mode = {"n"}, lhs = "<c-k>", rhs = "<c-w>k", options = {silent = true}, desc = "Moverse hacía vista de arriba" },
  { mode = {"n"}, lhs = "<c-j>", rhs = "<c-w>j", options = {silent = true}, desc = "Moverse hacía vista de abajo" },

  -- Navegación entre bufferes
  { mode = {"n"}, lhs = "<tab>", rhs = "<cmd>bnext<cr>", options = {silent = true}, desc = "Moverse hacía el anterior buffer" },
  { mode = {"n"}, lhs = "<s-tab>", rhs = "<cmd>bprevious<cr>", options = {silent = true}, desc = "Moverse hacía el siguiente buffer" },
  { mode = {"n"}, lhs = "<c-s>", rhs = "<cmd>w<cr>", options = {silent = true}, desc = "Guarda archivo actual" },
  { mode = {"n"}, lhs = "<leader>ba", rhs = "<cmd>%y+<cr>", options = {silent = true}, desc = "Copiar todo el contenido del buffer actual" },
  { mode = {"n"}, lhs = "<leader>q", rhs = "<cmd>bd!<cr>", options = {silent = true}, desc = "Cerrar buffer" },
  { mode = {"n"}, lhs = "<leader>bn", rhs = "<cmd>enew<cr>", options = {silent = true}, desc = "Crear nuevo buffer" },
  { mode = {"n"}, lhs = "<c-x>", rhs = "<cmd>qa!<cr>", options = {silent = true}, desc = "Cerrar todos los bufferes actuales" },

  -- Navegación entre pestañas
  { mode = {"n"}, lhs = "<leader>tn", rhs = "<cmd>tabnew<cr>", options = {silent = true}, desc = "Añadir nueva pestaña" },
  { mode = {"n"}, lhs = "<leader>tj", rhs = "<cmd>tabprevious<cr>", options = {silent = true}, desc = "Moverse hacía la anterior pestaña" },
  { mode = {"n"}, lhs = "<leader>tk", rhs = "<cmd>tabnext<cr>", options = {silent = true}, desc = "Moverse hacía la siguiente pestaña" },
  { mode = {"n"}, lhs = "<leader>tq", rhs = "<cmd>tabclose<cr>", options = {silent = true}, desc = "Cerrar pestaña actual" },

  -- Packer Manager
  { mode = {"n"}, lhs = "<leader>pl", rhs = "<cmd>PackerStatus<cr>", options = {silent = true}, desc = "Mostrar estado de los plugins iniciados" },
  { mode = {"n"}, lhs = "<leader>ps", rhs = "<cmd>PackerSync<cr>", options = {silent = true}, desc = "Actualizar todos los plugins" },

  -- Gitsigns
  { mode = {"n"}, lhs = "<leader>gr", rhs = "<cmd>Gitsigns reset_buffer<cr>", options = {silent = true}, desc = "Deshacer todos los cambios del archivo actual" },
  { mode = {"n"}, lhs = "<leader>gs", rhs = "<cmd>Gitsigns stage_buffer<cr>", options = {silent = true}, desc = "Poner la línea actual en el área de stage" },
  { mode = {"n"}, lhs = "<leader>gu", rhs = "<cmd>Gitsigns reset_hunk<cr>", options = {silent = true}, desc = "Deshacer cambios en la línea actual" },
  { mode = {"n"}, lhs = "<leader>gp", rhs = "<cmd>Gitsigns preview_hunk<cr>", options = {silent = true}, desc = "Previsualizar cambios que se han hecho" },
  { mode = {"n"}, lhs = "<leader>g{", rhs = "<cmd>Gitsigns next_hunk<cr>", options = {silent = true}, desc = "Moverse hacía el siguiente cambio que se ha realizado" },
  { mode = {"n"}, lhs = "<leader>g}", rhs = "<cmd>Gitsigns prev_hunk<cr>", options = {silent = true}, desc = "Moverse hacía el anterior cambio que se ha realizado" },
  { mode = {"n"}, lhs = "<leader>gd", rhs = "<cmd>Gitsigns diffthis<cr>", options = {silent = true}, desc = "Ver los cambios posteriores que se habían hecho" },
  { mode = {"n"}, lhs = "<leader>gq", rhs = "<cmd>Gitsigns undo_stage_hunk<cr>", options = {silent = true}, desc = "Salir en el área de stage en la línea actual" },
  { mode = {"n"}, lhs = "<leader>gl", rhs = "<cmd>Gitsigns toggle_current_line_blame<cr>", options = {silent = true}, desc = "Habilitar línea de cambios por usuario" },
  { mode = {"n"}, lhs = "<leader>gh", rhs = "<cmd>Gitsigns toggle_deleted<cr>", options = {silent = true}, desc = "Ver las líneas borradas" },
  { mode = {"n"}, lhs = "<leader>gn", rhs = "<cmd>Gitsigns toggle_numhl<cr>", options = {silent = true}, desc = "Pintar numeros" },

}

return opts
