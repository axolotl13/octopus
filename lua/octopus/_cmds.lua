local cmd = vim.api.nvim_create_autocmd

--  autocmd("FileType", {
--  pattern = "html",
--  command = "setlocal shiftwidth=2 tabstop=2"
-- })

-- Guardado automático
-- cmd({"InsertLeave", "TextChanged"}, {
--   pattern = { "*" },
--   command = "silent! wall",
-- })

-- Habilitar idioma para archivos markdown
vim.cmd([[autocmd FileType markdown setlocal spell]])

-- Deshabilitar auto comentario
cmd("BufEnter", { pattern = "*", command = "set fo-=c fo-=r fo-=o" } )

-- Deshabilitar los números de línea en la terminal
cmd("TermOpen", { group = init_group, command = "setlocal nonumber" } )
