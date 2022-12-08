local M = {}

M.opts = {
  log_level = "error",
  pre_save_cmds = { "NvimTreeClose", "cclose", "lua vim.notify.dismiss()" },
  auto_session_root_dir = vim.fn.expand("$HOME") .. "/.config/nvim/sessions/",
  auto_session_enabled = true,
  auto_restore_enabled = true,
  auto_save_enabled = true,
  auto_session_use_git_branch = true,
  auto_session_suppress_dirs = { "~/", "~/Descargas" },
}

M.maps = {
  { mode = {"n"}, lhs = "<leader>vs", rhs = "<cmd>SaveSession<cr>", options = {silent = true}, desc = "Guardar sesión actual" },
  { mode = {"n"}, lhs = "<leader>vd", rhs = "<cmd>DeleteSession<cr>", options = {silent = true}, desc = "Eliminar sesión actual" }
}

M.start = function()

  local ok_session, session = pcall(require, "auto-session")
  if not ok_session then return end

  local ok_keybinds, keybinds = pcall(require, "core.functions")
  if not ok_keybinds then return end

  session.setup(M.opts)

  keybinds.load_keybinds(M.maps)

end

return M
