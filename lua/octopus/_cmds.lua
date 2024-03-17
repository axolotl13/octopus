local autocmd = vim.api.nvim_create_autocmd

-- Especificar sangría para ciertos tipos de archivo
autocmd("FileType", { pattern = "cpp", command = "setlocal shiftwidth=4 tabstop=4" })
autocmd("FileType", { pattern = "python", command = "setlocal shiftwidth=4 tabstop=4" })
autocmd("FileType", { pattern = "java", command = "setlocal shiftwidth=4 tabstop=4" })
autocmd("FileType", { pattern = "sql", command = "setlocal shiftwidth=4 tabstop=4" })
autocmd("FileType", { pattern = "xml", command = "setlocal shiftwidth=4 tabstop=4" })
autocmd("FileType", { pattern = "sh", command = "setlocal shiftwidth=4 tabstop=4" })
autocmd("FileType", { pattern = "markdown", command = "setlocal spell colorcolumn=80" })

-- Guardado automático
-- cmd({"InsertLeave", "TextChanged"}, {
--   pattern = { "*" },
--   command = "silent! wall",
-- })

-- Deshabilitar auto comentario
autocmd("BufEnter", { pattern = "*", command = "setlocal fo-=c fo-=r fo-=o" })

-- Deshabilitar los números de línea en la terminal
autocmd("TermOpen", { pattern = "*", command = "setlocal nonumber norelativenumber" })
autocmd("TermOpen", { pattern = "*", command = "startinsert" })
