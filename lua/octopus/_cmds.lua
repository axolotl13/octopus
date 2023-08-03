local cmd = vim.api.nvim_create_autocmd

-- Especificar sangría para ciertos tipos de archivo
cmd("FileType", { pattern = "cpp", command = "setlocal shiftwidth=4 tabstop=4" })
cmd("FileType", { pattern = "python", command = "setlocal shiftwidth=4 tabstop=4" })
cmd("FileType", { pattern = "java", command = "setlocal shiftwidth=4 tabstop=4" })
cmd("FileType", { pattern = "sql", command = "setlocal shiftwidth=4 tabstop=4" })
cmd("FileType", { pattern = "xml", command = "setlocal shiftwidth=4 tabstop=4" })
cmd("FileType", { pattern = "sh", command = "setlocal shiftwidth=4 tabstop=4" })

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

-- Auto cerrar NvimTree
-- cmd("BufEnter", {
--   group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
--   pattern = "NvimTree_*",
--   callback = function()
--     local layout = vim.api.nvim_call_function("winlayout", {})
--     if
--       layout[1] == "leaf"
--       and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree"
--       and layout[3] == nil
--     then
--       vim.api.nvim_command [[confirm quit]]
--     end
--   end,
-- })
