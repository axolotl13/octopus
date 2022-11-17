local M = {}

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

return M
