return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    check_ts = true,
    disable_filetype = { "TelescopePrompt", "vim", "spectre_panel" },
    fast_wrap = {
      map = "<M-e>", -- M = Alt
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    },
  },
  config = function(_, opts)
    require("nvim-autopairs").setup(opts)
    require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done { tex = "" })
  end,
}
