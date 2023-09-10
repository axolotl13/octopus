return {
  "rcarriga/nvim-notify",
  opts = {
    render = "wrapped-compact",
    timeout = 2150,
    max_width = function()
      return math.floor(vim.o.columns * 0.60)
    end,
    stages = "fade",
  },
  init = function()
    vim.notify = require "notify"
  end,
}
