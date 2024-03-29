for _, module in ipairs {
  "octopus._opts",
  "octopus._maps",
  "octopus._cmds",
  "octopus._boot",
} do
  local ok, core = pcall(require, module)
  if not ok then
    vim.api.nvim_err_writeln("Failed to load " .. module)
  end
end
