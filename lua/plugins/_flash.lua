return {
  "folke/flash.nvim",
  opts = {
    search = {
      multi_window = true,
      exclude = { "NvimTree", "terminal", "lazy", "mason", "DiffviewFiles", "DiffviewFilesHistory" },
    },
  },
  keys = {
    {
      "s",
      mode = { "n", "o", "x" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "S",
      mode = { "n", "o", "x" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash",
    },
    {
      "r",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
    {
      "R",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Treesitter Search",
    },
    {
      "<c-s>",
      mode = { "c" },
      function()
        require("flash").toggle()
      end,
      desc = "Toggle Flash Search",
    },
  },
}
