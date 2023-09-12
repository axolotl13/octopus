return {
  "NvChad/nvterm",
  dependencies = {
    {
      "chomosuke/term-edit.nvim",
      opts = {
        prompt_end = "> ",
      },
    },
  },
  opts = {
    terminals = {
      horizontal = { location = "rightbelow", split_ratio = 0.3 },
    },
  },
  keys = {
    {
      "<leader>tt",
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      desc = "Abre una terminal horizontalmente",
    },
  },
}
