local M = {}

M.opts = {
  minimum_width = 40,
  timeout = 600,
  stages = "slide",
  background_colour = "Normal"
}

M.start = function()

  local ok, notify = pcall(require, "notify")
  if not ok then return end

  notify.setup(M.opts)

  vim.notify = notify

end

return M
