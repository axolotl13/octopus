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
      filetype = { "NvimTree", "spectre_panel", "DiffviewFiles" },
    },
    animation = {
      enable = true,
      duration = 220,
      fps = 60,
    },
  },
  keys = {
    { "<leader>wq", "<cmd>WindowsToggleAutowidth<cr>", desc = "[Windows] Des/habilitar windows" },
    { "<leader>we", "<cmd>WindowsMaximize<cr>", desc = "[Windows] Maximizar ventana actual" },
    { "<leader>ww", "<cmd>WindowsEqualize<cr>", desc = "[Windows] Igualar ventanas" },
  },
}
