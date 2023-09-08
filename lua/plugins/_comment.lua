return {
  "numToStr/Comment.nvim",
  -- event = "VeryLazy",
  opts = {
    ignore = "^$",
    mappings = {
      extra = false,
    },
    pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
  },
  keys = { "gcc", "gbc", { "gb", mode = "v" }, { "gc", mode = "v" } },
}
