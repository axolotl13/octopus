return {
  {
    "ggandor/lightspeed.nvim",
    keys = { "f", "F", "s", "S", "t", "T" },
    config = { substitute_chars = { ["\r"] = "ñ" } } -- Enter end
  },
  {
    "kylechui/nvim-surround",
    -- keys = { "ysiw", "ys", "yss","ds", "cs" },
    event = "VeryLazy",
    config = true
  },
  --[[ {
    "windwp/nvim-ts-autotag",
    dependencies = {
      "nvim-treesitter/nvim-treesitter"
    },
    ft = { "html", "xml" }
  } ]]
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = {
      "nvim-treesitter/nvim-treesitter"
    },
    ft = { "js", "jsx", "ts", "tsx", "css", "html" }
  },
  {
    "tpope/vim-fugitive",
    cmd = "Git"
  },
  {
    "mg979/vim-visual-multi",
    keys = { "<c-n>", "<c-down>", "<c-up>", "<s-left>", "<s-right>" } -- n, N, q, Q, -
  },
  {
    "NvChad/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    ft = { "css", "html" },
    config = true,
    keys = { { "<leader>cc", "<cmd>ColorizerToggle<cr>", desc = "Habilitar ColorizerToggle" } }
  },
  {
    "SmiteshP/nvim-navic",
    config = {
      icons = require("ui.icons").vscode
    },
    dependencies = {
      "neovim/nvim-lspconfig"
    }
  },
  {
    "anuvyklack/windows.nvim",
    event = "VeryLazy",
    dependencies = {
      "anuvyklack/middleclass",
    },
    config = function()
      require("windows").setup({
        autowidth = {
          enable = true,
          winwidth = 30,
        },
      })
    end,
    keys = {
      { "<leader>ww", "<cmd>WindowsEqualize<cr>", desc = "[Windows] Igualar ventanas" },
    },
  },
  {
    "rmagatti/session-lens",
    dependencies = {
      "rmagatti/auto-session",
      "nvim-telescope/telescope.nvim"
    },
    config = function()
      require("session-lens").setup({
        path_display = { "shorten" },
        -- theme = 'ivy',
        -- previewer = true
      })
    end,
    keys = {
      { "<a-z>", "<cmd>SearchSession<cr>", desc = "[Windows] Igualar ventanas" },
    }
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = "java"
  },
  {
    "jackMort/ChatGPT.nvim",
    cmd = "ChatGPT",
    config = function()
      require("chatgpt").setup({
        -- optional configuration
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  }
}
