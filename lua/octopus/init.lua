local modules = {
  "octopus._opts",
  "octopus._maps",
  "octopus._cmds",
  "octopus._boot"
}

for _, module in ipairs(modules) do
  local ok, core = pcall(require, module)
  if not ok then
    error(("Error al cargar el módulo ...\n\n%s"):format(core))
  end
end
