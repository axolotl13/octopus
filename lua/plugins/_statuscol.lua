return {
  "luukvbaal/statuscol.nvim",
  lazy = false,
  opts = function()
    local builtin = require "statuscol.builtin"
    return {
      relculright = true,
      setopt = true,
      segments = {
        { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
        { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
        {
          sign = {
            name = { "GitSigns", "Diagnostic" },
            maxwidth = 1,
            colwidth = 1,
            auto = false,
          },
          click = "v.lua.ScSa",
        },
      },
      ft_ignore = { "help", "vim", "NvimTree", "lazy", "spectre_panel", "terminal" },
    }
  end,
}
