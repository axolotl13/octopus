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
    { "<leader>re", "<cmd>SnipRun<cr>", "[SnipRun] Ejecutar línea de código" },
    { "<leader>rr", "<cmd>SnipReset<cr>", "[SnipRun] Reiniciar SnipRun" },
    { "<leader>rq", "<cmd>SnipClose<cr>", "[SnipRun] Cerrar SnipRun" },
  },
}
