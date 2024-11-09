return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spec = {
        {
          { "<leader>b", group = "Buffer" },
          { "<leader>d", group = "Diffview", icon = { icon = "󰕛 ", color = "green" } },
          { "<leader>e", icon = { icon = "󰉌 ", color = "orange" } },
          { "<leader>p", group = "Lazy", icon = { icon = "󰒲 ", color = "cyan" } },
          { "<leader>t", group = "Tabs" },
          { "<leader>,", group = "Misc", icon = { icon = " ", color = "pink" } },
          { "z", group = "fold" },
        },
      },
      plugins = {
        register = false,
        spelling = {
          enabled = false,
        },
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show { global = false }
        end,
        desc = "Buffer local keymaps",
      },
    },
  },
}
