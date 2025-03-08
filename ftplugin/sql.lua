vim.opt.shiftwidth = 4

vim.api.nvim_create_autocmd("Filetype", {
  desc = "Disable left and right arrows",
  pattern = "sql",
  callback = function()
    vim.keymap.del("i", "<left>", { buffer = true })
    vim.keymap.del("i", "<right>", { buffer = true })
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Load sqls.nvim with sqls",
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client.name == "sqls" then
      require("sqls").on_attach(client, args.buf)
    end
  end,
})
