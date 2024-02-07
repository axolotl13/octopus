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
      filetype = { "NvimTree", "spectre_panel", "DiffviewFiles", "gitcommit" },
    },
    animation = {
      enable = true,
      duration = 150,
      fps = 60,
    },
  },
  keys = {
    { "<leader>we", "<cmd>WindowsEqualize<cr>", desc = "[Windows] Igualar ventanas" },
    { "<leader>wm", "<cmd>WindowsMaximize<cr>", desc = "[Windows] Maximizar ventana actual" },
    { "<leader>wq", "<cmd>WindowsToggleAutowidth<cr>", desc = "[Windows] Des/habilitar windows" },
  },
}
