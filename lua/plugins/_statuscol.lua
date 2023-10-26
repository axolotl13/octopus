return {
  "luukvbaal/statuscol.nvim",
  lazy = false,
  opts = function()
    local builtin = require "statuscol.builtin"
    return {
      relculright = true,
      setopt = true,
      segments = {
        {
          text = { builtin.lnumfunc },
          condition = { true, builtin.not_empty },
          click = "v:lua.ScLa",
        },
        { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
        { text = { "%s" }, click = "v:lua.ScSa" },
      },
      ft_ignore = { "help", "vim", "NvimTree", "lazy", "spectre_panel", "terminal" },
    }
  end,
}
