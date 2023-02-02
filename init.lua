if vim.fn.has("nvim-0.8") ~= 1 then
  vim.notify("Please upgrade your Neovim base installation", vim.log.levels.WARN)
  vim.wait(5000, function()
    return false
  end)
  vim.cmd "cquit"
end

require("octopus")
