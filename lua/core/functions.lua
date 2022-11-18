local g = vim.g

local M = {}

-- Deshabilitar plugins innecesarios
M.disable_options = function()

  local ok, disable = pcall(require,"core.disable")
  if not ok then return end

  for _, option in pairs(disable) do
    g["loaded_" .. option] = 1
  end

end

-- Cargar opciones para nvim
M.setup_options = function()

  local opt = vim.opt
  local ok, setup = pcall(require,"core.setup")
  if not ok then return end

  for _, option in pairs(setup) do
    opt[_] = option
  end

  opt.shortmess:append("sI")
  opt.shortmess = opt.shortmess + {c = true}

end

-- Carga combinaciones de teclas
M.keybinds_options = function()

  local map = vim.keymap.set
  local ok, keybinds = pcall(require,"core.keybinds")
  if not ok then return end

  g.mapleader = " "
  
  for _, key in pairs(keybinds) do
    key.options.desc = key.desc
    map(key.mode, key.lhs, key.rhs, key.options)
  end


end

return M
