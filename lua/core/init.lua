-- local modules = { "setup_options()", "disable_options()", "keybinds_options()" }
 
-- for _, module in ipairs(modules) do
-- local ok, core = pcall(require, "core.functions" .. "." .. module )
-- if not ok then
-- error(("Error al cargar core...\n\n%s"):format(core))
-- end
-- end

require("core.functions").disable_options()
require("core.functions").setup_options()
require("core.bootstrap").loader_plugins()
require("core.functions").keybinds_options()
