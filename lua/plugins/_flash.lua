return {
  "folke/flash.nvim",
  opts = {
    search = {
      multi_window = true,
      exclude = {
        "NvimTree",
        "terminal",
        "lazy",
        "mason",
        "DiffviewFiles",
        "DiffviewFilesHistory",
        "notify",
        "cmp_menu",
        "flash_prompt",
        "fugitive",
        function(win)
          return not vim.api.nvim_win_get_config(win).focusable
        end,
      },
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
  },
}
