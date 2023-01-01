local cmd = vim.api.nvim_create_autocmd

--  autocmd("FileType", {
--  pattern = "html",
--  command = "setlocal shiftwidth=2 tabstop=2"
-- })

-- Auto save
-- autocmd({"InsertLeave", "TextChanged"}, {
--   pattern = { "*" },
--   command = "silent! wall",
-- })

-- Habilitar spell para archivos markdown
vim.cmd([[autocmd FileType markdown setlocal spell]])

-- Deshabilitar auto comentario
cmd("BufEnter", { pattern = "*", command = "set fo-=c fo-=r fo-=o" } )

-- Deshabilitar los números de línea en la terminal
cmd("TermOpen", { group = init_group, command = "setlocal nonumber" } )

-- Mostrar la línea del cursor solo en la ventana activa
cmd({ "InsertLeave", "WinEnter" }, {
  callback = function()
    local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
    if ok and cl then
      vim.wo.cursorline = true
      vim.api.nvim_win_del_var(0, "auto-cursorline")
    end
  end,
})
cmd({ "InsertEnter", "WinLeave" }, {
  callback = function()
    local cl = vim.wo.cursorline
    if cl then
      vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
      vim.wo.cursorline = false
    end
  end,
})
