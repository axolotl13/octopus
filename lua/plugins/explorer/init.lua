local modules = { "nvim-tree", "plugins.explorer.config", "plugins.explorer.keybinds" }
local mods, ok = {}, nil

for _, module in pairs(modules) do
  ok, mods[_] = pcall(require, module)
  if not ok then return end
end

mods[1].setup(mods[2])

vim.api.nvim_create_autocmd('BufEnter', {
  command = [[if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]],
  nested = true
})
