local ok, icons = pcall(require, "ui.icons")
if not ok then return end

local M = {}

M.ensure_packer = function()

  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

  if fn.empty(fn.glob(install_path)) > 0 then
    print("Clonando packer ..")
    fn.system({
      "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path
    })
    vim.cmd [[packadd packer.nvim]]
    return true
  end

  print("No se instalo packer, intente nuevamente")
  return false

end

M.packer_float = {

  auto_clean = true,
  compile_on_sync = true,
  git = { clone_timeout = 800 },
  display = {
    working_sym = icons.packer.working,
    error_sym = icons.packer.error,
    done_sym = icons.packer.done,
    removed_sym = icons.packer.removed,
    moved_sym = icons.packer.moved,
    open_fn = function()
      return require("packer.util").float({ border = "single" })
    end
  }

}

M.loader_plugins = function()

  local ok_plugins, plugins = pcall(require, "core.plugins")
  if not ok_plugins then return end

  local ok, packer = pcall(require, "packer")
  if not ok then M.ensure_packer() else

    packer.init(M.packer_float)

    packer.startup(function(use)
      for _, plug in pairs(plugins) do
        use(plug)
      end
    end)
  end

end

return M
