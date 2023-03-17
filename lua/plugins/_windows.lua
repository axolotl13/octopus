return {
  "anuvyklack/windows.nvim",
  event = "VeryLazy",
  dependencies = {
    "anuvyklack/middleclass",
    "anuvyklack/animation.nvim",
  },
  opts = {
    autowidth = {
      enable = true,
      winwidth = 30,
    },
    ignore = {
      filetype = { "NvimTree", "spectre_panel" },
    },
    animation = {
      enable = true,
      duration = 220,
      fps = 60,
    },
  },
  keys = {
    { "<leader>ww", "<cmd>WindowsEqualize<cr>", desc = "[Windows] Igualar ventanas" },
  },
}
