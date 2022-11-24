local opts = {

  -- Gestor de paquetes
  { "wbthomason/packer.nvim" }, 

  -- Dependencias necesarias
  { "nvim-lua/plenary.nvim" },
  { "tweekmonster/startuptime.vim", cmd = "StartupTime" },

  -- Interfaz de Usuario
  {
    "Mofiqul/adwaita.nvim",
    after = "plenary.nvim",
    config = function()
      vim.g.adwaita_darker = true
      vim.cmd([[colorscheme adwaita]])
    end
  },
}

return opts
