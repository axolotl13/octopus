return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    check_ts = true,
    ts_config = {
      lua = { "string", "source" },
      javascript = { "string", "template_string" }
    },
    disable_filetype = { "TelescopePrompt", "vim", "spectre_panel" },
    fast_wrap = {
      map = "<M-e>", -- M = Alt
      chars = { "{", "[", "(", '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      offset = 0,
      end_key = "$",
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      check_comma = true,
      highlight = "PmenuSel",
      highlight_grey = "LineNr"
    }
  },
  config = function()
    require("nvim-autopairs").setup(opts)
    require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done(
      { map_char = { tex = "" } }))
  end
}
