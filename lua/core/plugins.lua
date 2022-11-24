local opts = {

  -- Gestor de paquetes
  { "wbthomason/packer.nvim" }, 

  -- Dependencias necesarias
  { "nvim-lua/plenary.nvim" },
  { "tweekmonster/startuptime.vim", cmd = "StartupTime" },
  {
    "kyazdani42/nvim-web-devicons",
    after = "adwaita.nvim",
    config = function()
      require("plugins.devicons")
    end
  },

  -- Interfaz de usuario
  {
    "Mofiqul/adwaita.nvim",
    after = "plenary.nvim",
    config = function()
      vim.g.adwaita_darker = true
      vim.cmd([[colorscheme adwaita]])
    end
  },
  {
    "kyazdani42/nvim-tree.lua",
    cmd = {"NvimTreeToggle", "NvimTreeClose"},
    config = function()
      require("plugins.explorer")
    end
  },

}

return opts
