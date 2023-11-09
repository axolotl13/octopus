return {
  "michaelb/sniprun",
  build = "bash ./install.sh",
  cmd = "SnipRun",
  opts = {
    interpreter_options = { JS_original = { use_on_filetypes = { "javascriptreact" } } },
    display = { "VirtualTextOK", "NvimNotify" },
    display_options = { notification_timeout = 5 },
  },
  keys = {
    { "<leader>re", "<cmd>SnipRun<cr>", desc = "[SnipRun] Ejecutar línea de código" },
    { "<leader>rr", "<cmd>SnipReset<cr>", desc = "[SnipRun] Reiniciar SnipRun" },
    { "<leader>rq", "<cmd>SnipClose<cr>", desc = "[SnipRun] Cerrar SnipRun" },
    { "<leader>re", mode = { "x" }, ":SnipRun<cr>", desc = "[SnipRun] Ejecutar bloque de código" },
  },
}
