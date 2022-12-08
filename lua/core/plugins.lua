local opts = {

  -- Gestor de paquetes
  { "wbthomason/packer.nvim" },

  -- Dependencias necesarias
  { "nvim-lua/plenary.nvim" },
  { "tweekmonster/startuptime.vim", cmd = "StartupTime" },
  {
    "kyazdani42/nvim-web-devicons",
    -- after = "catppuccin",
    config = function()
      require("plugins.devicons").start()
    end
  },
  {
    "rcarriga/nvim-notify",
    -- module = "vim",
    config = function()
      require("plugins.notify").start()
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    -- cmd = "Telescope",
    config = function()
      require("plugins.telescope").start()
    end
  },

  -- Interfaz de usuario
  {
    "Mofiqul/adwaita.nvim",
    -- after = "plenary.nvim",
    config = function()
      vim.g.adwaita_darker = true
      vim.cmd([[colorscheme adwaita]])
    end
  },
  {
    "kyazdani42/nvim-tree.lua",
    -- event = "BufWinEnter",
    -- cmd = { "NvimTreeToggle", "NvimTreeClose" },
    config = function()
      require("plugins.explorer").start()
    end
  },
  {
    "akinsho/bufferline.nvim",
    -- after = "nvim-web-devicons",
    config = function()
      require("plugins.bufferline").start()
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    -- event = { "BufRead", "BufNewFile" },
    config = function()
      require("plugins.gitsigns").start()
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    -- after = { "nvim-treesitter", "nvim-web-devicons" },
    config = function()
      require("plugins.indentline").start()
    end
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    -- event = { "BufRead", "BufNewFile" },
    config = function()
      require("plugins.treesitter").start()
    end
  },
  { "p00f/nvim-ts-rainbow", after = "nvim-treesitter" },

  {
    "numToStr/Comment.nvim",
    -- keys = { { "n", "gcc" }, { "n", "gbc" }, { "v", "gc" }, { "v", "gb" } },
    config = function()
      require("plugins.comment").start()
    end
  },
  {
    "windwp/nvim-autopairs",
    -- keys = { { "i", "(" }, { "i", "[" }, { "i", "{" }, { "i", "'" }, { "i", '"' } },
    config = function()
      require("plugins.autopairs").start()
    end
  },
  {
    "ggandor/lightspeed.nvim",
    -- keys = { "f", "F", "s", "S", "t", "T" },
    config = function()
      require("lightspeed").setup({ substitute_chars = {["\r"] = "ñ"} }) -- Enter
    end
  },
  { 
    "windwp/nvim-ts-autotag",
    ft = { "html", "xml" },
  },
  { 
    "kylechui/nvim-surround",
    -- keys = { "ys", "ds", "cs" },
    config = function()
      require("nvim-surround").setup()
    end
  },

  -- Miscelánea
  {
    "windwp/nvim-spectre",
    config = function()
      require("plugins.spectre").start()
    end
  },
  {
    "akinsho/toggleterm.nvim",
    -- cmd = "ToggleTerm",
    config = function()
      require("plugins.toggleterm").start()
    end
  },
  {
    "rmagatti/auto-session",
    -- after = "project.nvim",
    config = function()
      require("plugins.session").start()
    end
  },

  -- Vim Plugins
  {
    "tpope/vim-fugitive",
    -- cmd = { "Git" }
  }

}

return opts
