return {
  "rcarriga/nvim-notify",
  lazy = false,
  config = function()
    local notify = require("notify")
    local opts = {
      minimum_width = 40,
      timeout = 2000,
      stages = "fade",
      background_colour = "Normal"
    }

    notify.setup(opts)
    vim.notify = notify

  end
}

