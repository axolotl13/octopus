local cmd = vim.api.nvim_create_autocmd

-- Especificar sangría para ciertos tipos de archivo
cmd("FileType", { pattern = "cpp", command = "setlocal shiftwidth=4 tabstop=4" })
cmd("FileType", { pattern = "python", command = "setlocal shiftwidth=4 tabstop=4" })
cmd("FileType", { pattern = "java", command = "setlocal shiftwidth=4 tabstop=4" })
cmd("FileType", { pattern = "sql", command = "setlocal shiftwidth=4 tabstop=4" })
cmd("FileType", { pattern = "xml", command = "setlocal shiftwidth=4 tabstop=4" })

-- Guardado automático
-- cmd({"InsertLeave", "TextChanged"}, {
--   pattern = { "*" },
--   command = "silent! wall",
-- })

-- Habilitar idioma para archivos markdown
vim.cmd([[autocmd FileType markdown setlocal spell]])

-- Deshabilitar auto comentario
cmd("BufEnter", { pattern = "*", command = "set fo-=c fo-=r fo-=o" })

-- Deshabilitar los números de línea en la terminal
cmd("TermOpen", { group = init_group, command = "setlocal nonumber" })
