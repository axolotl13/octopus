return {
  "lewis6991/satellite.nvim",
  event = "VeryLazy",
  commit = "5d33376287e384f04b84962a20d90bd10a9dac86",
  opts = {
    current_only = true,
    winblend = 40,
    zindex = 40,
    excluded_filetypes = { "NvimTree", "terminal", "spectre_panel" },
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
