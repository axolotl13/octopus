return {
  "lewis6991/satellite.nvim",
  event = "VeryLazy",
  opts = {
    current_only = true,
    winblend = 20,
    zindex = 40,
    excluded_filetypes = { "NvimTree" },
    width = 2,
    handlers = {
      search = {
        enable = true,
      },
      diagnostic = {
        enable = true,
      },
      gitsigns = {
        enable = true,
        signs = {
          add = require("ui.icons").signs.add,
          change = require("ui.icons").signs.add,
          delete = require("ui.icons").signs.add,
        },
      },
      marks = {
        enable = false,
      },
    },
  },
}
