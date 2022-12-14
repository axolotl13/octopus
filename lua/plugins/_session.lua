return {
  "rmagatti/auto-session",
  lazy = false,
  config = function()
    local session = require("auto-session")

    local opts = {
      log_level = "error",
      pre_save_cmds = { "NvimTreeClose", "cclose", "lua vim.notify.dismiss()" },
      auto_session_root_dir = vim.fn.expand("$HOME") .. "/.config/nvim/sessions/",
      auto_session_enabled = true,
      auto_restore_enabled = true,
      auto_save_enabled = true,
      auto_session_use_git_branch = true,
      auto_session_suppress_dirs = { "~/", "~/Descargas" },
    }

    session.setup(opts)

  end,
  keys = {
    { "<leader>ws", "<cmd>SaveSession<cr>", desc = "[Session] Guardar sesión actual" },
    { "<leader>wd", "<cmd>DeleteSession<cr>", desc = "[Session] Eliminar sesión actual" }
  }
}
