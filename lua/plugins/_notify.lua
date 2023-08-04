return {
  "rcarriga/nvim-notify",
  opts = {
    minimum_width = 40,
    timeout = 2000,
    stages = "fade",
    background_colour = "Normal",
  },
  init = function()
    vim.notify = require("notify")
  end,
}
