local ok_config, config = pcall(require, "plugins.explorer.config")
local ok_keybinds, keybinds = pcall(require, "plugins.explorer.keybinds")
if not ok_config and ok_keybinds then return end

vim.api.nvim_create_autocmd('BufEnter', {
  command = [[if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]],
  nested = true
})
