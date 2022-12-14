return {
  "akinsho/toggleterm.nvim",
  cmd = "ToggleTerm",
  config = function()
    local toggleterm = require("toggleterm")

    local opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return 14
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.5
        end
      end,
      direction = "horizontal",
      close_on_exit = true,
      float_opts = { border = "curved" },
    }

    toggleterm.setup(opts)

  end,
  keys = {
    { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "[Terminal] Abre nueva ventana" },
    { "<leader>tp", "<cmd>ToggleTerm direction=tab<cr>", desc = "[Terminal] Abre nueva pestaña" },
    { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "[Terminal] Abre nueva ventana flotante" },
    { "<leader>ts", "<cmd>ToggleTerm direction=vertical<cr>", desc = "[Terminal] Abre nueva ventana verticalmente" },
  }
}
