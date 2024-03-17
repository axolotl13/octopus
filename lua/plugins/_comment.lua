return {
  "numToStr/Comment.nvim",
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true, opts = { enable_autocmd = false } },
  opts = function()
    return {
      ignore = "^$",
      mappings = { extra = false },
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    }
  end,
  keys = { "gcc", "gbc", { "gb", mode = "x" }, { "gc", mode = "x" } },
}
