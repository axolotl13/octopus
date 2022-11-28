local opts = {

  -- Gestor de paquetes
  { "wbthomason/packer.nvim" },

  -- Dependencias necesarias
  { "nvim-lua/plenary.nvim" },
  { "tweekmonster/startuptime.vim", cmd = "StartupTime" },
  {
    "kyazdani42/nvim-web-devicons",
    after = "catppuccin",
    config = function()
      require("plugins.devicons").start()
    end
  },

  -- Interfaz de usuario
  {
    "catppuccin/nvim",
    as = "catppuccin",
    after = "plenary.nvim",
    config = function()
        vim.cmd [[colorscheme catppuccin]]
    end
  },
  {
    "kyazdani42/nvim-tree.lua",
    event = "BufWinEnter",
    --cmd = { "NvimTreeToggle", "NvimTreeClose" },
    config = function()
      require("plugins.explorer").start()
    end
  },
  {
    "akinsho/bufferline.nvim",
    after = "nvim-web-devicons",
    config = function()
      require("plugins.bufferline").start()
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufRead", "BufNewFile" },
    config = function()
      require("plugins.gitsigns").start()
    end
  },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    event = { "BufRead", "BufNewFile" },
    config = function()
      require("plugins.treesitter").start()
    end
  },

}

return opts
