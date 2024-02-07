return {
  "michaelb/sniprun",
  build = "sh install.sh",
  opts = {
    display = { "VirtualTextOK", "NvimNotify" },
    display_options = { notification_timeout = 5 },
  },
  keys = {
    { "<leader>re", mode = { "n", "x" }, ":SnipRun<cr>", desc = "[SnipRun] Ejecutar código" },
    { "<leader>rr", "<cmd>SnipReset<cr>", desc = "[SnipRun] Reiniciar SnipRun" },
    { "<leader>rq", "<cmd>SnipClose<cr>", desc = "[SnipRun] Cerrar SnipRun" },
  },
}
