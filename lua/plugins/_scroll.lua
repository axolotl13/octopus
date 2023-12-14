return {
  "declancm/cinnamon.nvim",
  event = "VeryLazy",
  opts = {
    extra_keymaps = true,
    extended_keymaps = true,
    hide_cursor = true,
  },
  keys = {
    {
      "<ScrollWheelUp>",
      mode = { "n", "x" },
      "<cmd>lua Scroll('<ScrollWheelUp>')<cr>",
      desc = "[Scroll] Scrollear hacía arriba",
    },
    {
      "<ScrollWheelDown>",
      mode = { "n", "x" },
      "<cmd>lua Scroll('<ScrollWheelDown>')<cr>",
      desc = "[Scroll] Scrollear hacía abajo",
    },
  },
}
