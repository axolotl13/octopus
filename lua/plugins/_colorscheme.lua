return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local tokyonight = require("tokyonight")
      local opts = {
        style = "storm",
        styles = {
          comments = { italic = true },
          functions = {},
          variables = {},
          sidebars = "dark",
          floats = "dark",
        },
        sidebars = {
          "qf",
          "vista_kind",
          "terminal",
          "spectre_panel",
          "startuptime",
          "Outline",
        },

        on_highlights = function(hl, c)
          if true then
            local prompt = "#2d3149"
            hl.TelescopeNormal = {
              bg = c.bg_dark,
              fg = c.fg_dark,
            }
            hl.TelescopeBorder = {
              bg = c.bg_dark,
              fg = c.bg_dark,
            }
            hl.TelescopePromptNormal = {
              bg = prompt,
            }
            hl.TelescopePromptBorder = {
              bg = prompt,
              fg = prompt,
            }
            hl.TelescopePromptTitle = {
              bg = c.fg_gutter,
              fg = c.orange,
            }
            hl.TelescopePreviewTitle = {
              bg = c.bg_dark,
              fg = c.bg_dark,
            }
            hl.TelescopeResultsTitle = {
              bg = c.bg_dark,
              fg = c.bg_dark,
            }
          end
        end,
      }

      tokyonight.setup(opts)
      tokyonight.load()
    end,
  },
  {
    "Mofiqul/adwaita.nvim",
    -- lazy = false,
    -- priority = 1000,
    config = function()
      vim.g.adwaita_darker = true
      vim.cmd([[colorscheme adwaita]])
    end,
  },
  {
    "catppuccin/nvim",
    as = "catppuccin",
    -- lazy = false,
    -- priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato",
      })
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    -- lazy = false,
    -- priority = 1000,
    config = function()
      require("kanagawa").setup({
        -- dimInactive = true, -- dim inactive window `:h hl-NormalNC`
        -- colors = {},
        overrides = {
          NvimTreeNormal = { bg = "#16161d" },
          NvimTreeNormalNC = { bg = "#16161d" },
          VertSplit = { fg = "#1f1f28", bg = "NONE" },
        },
      })
      vim.cmd([[colorscheme kanagawa]])
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    -- lazy = false,
    -- priority = 1000,
    config = function()
      require("github-theme").setup({
        theme_style = "dimmed",
      })
    end,
  },
  {
    "shaunsingh/nord.nvim",
    -- lazy = false,
    -- priority = 1000,
    config = function()
      vim.cmd([[colorscheme nord]])
    end,
  },
  {
    "sam4llis/nvim-tundra",
    -- lazy = false,
    -- priority = 1000,
    config = function()
      require("nvim-tundra").setup({})
      vim.cmd([[colorscheme tundra]])
    end,
  },
  {
    "Mofiqul/vscode.nvim",
    -- lazy = false,
    -- priority = 1000,
    config = function()
      require("vscode").setup({})
    end,
  },
  {
    "JoosepAlviste/palenightfall.nvim",
    -- lazy = false,
    -- priority = 1000,
    config = function()
      require("palenightfall").setup({})
      vim.cmd([[colorscheme palenightfall]])
    end,
  },
}
