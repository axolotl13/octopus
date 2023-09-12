return {
  "rmagatti/auto-session",
  init = function()
    vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
  end,
  lazy = false,
  opts = {
    pre_save_cmds = {
      function() end,
      "NvimTreeClose",
      "cclose",
      "lua vim.notify.dismiss()",
      "DiffviewClose",
      "lua require('spectre').close()",
    },
    auto_session_root_dir = vim.fn.expand "$HOME" .. "/.config/nvim/sessions/",
    auto_session_enabled = true,
    auto_restore_enabled = true,
    auto_save_enabled = true,
    auto_session_use_git_branch = true,
    auto_session_suppress_dirs = { "~/", "~/Descargas" },
    cwd_change_handling = {
      restore_upcoming_session = false,
    },
  },
  keys = {
    { "<leader>xs", "<cmd>SessionSave<cr>", desc = "[Session] Guardar sesión actual" },
    { "<leader>xq", "<cmd>SessionDelete<cr>", desc = "[Session] Eliminar sesión actual" },
  },
}
