return {
  {
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
    opts = {
      chunk = {
        enable = true,
        use_treesitter = true,
        notify = true,
        exclude_filetypes = {
          aerial = true,
          dashboard = true,
        },
        support_filetypes = {
          "*.lua",
          "*.js",
        },
        chars = {
          horizontal_line = "─",
          vertical_line = "│",
          left_top = "╭",
          left_bottom = "╰",
          right_arrow = ">",
        },
        style = {
          { fg = "#806d9c" },
        },
      },

      indent = {
        enable = true,
        use_treesitter = false,
        chars = {
          "│",
        },
      },

      line_num = {
        enable = true,
        use_treesitter = false,
        style = "#806d9c",
      },

      blank = {
        enable = true,
        chars = {
          "․",
        },
      },
    },
  },
}
