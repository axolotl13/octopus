return {
  {
    "folke/tokyonight.nvim",
    -- lazy = false,
    -- priority = 1000,
    opts = {
      style = "storm",
      on_highlights = function(hl, c)
        if true then
          local prompt = "#2d3149"
          hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
          hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
          hl.TelescopePromptNormal = { bg = prompt }
          hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
          hl.TelescopePromptTitle = { bg = c.fg_gutter, fg = c.orange }
          hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
          hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
        end
      end,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      require("tokyonight").load()
    end,
  },
  {
    "rockyzhang24/arctic.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    name = "arctic",
    branch = "v2",
    -- lazy = false,
    -- priority = 1000,
    config = function()
      vim.cmd "colorscheme arctic"
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    -- lazy = false,
    -- priority = 1000,
    config = function()
      require("catppuccin").setup {
        flavour = "mocha",
        custom_highlights = function(c)
          return {
            TelescopeNormal = { bg = c.crust, fg = c.text },
            TelescopeBorder = { bg = c.crust, fg = c.crust },
            TelescopePromptNormal = { bg = c.mantle },
            TelescopePromptBorder = { bg = c.mantle, fg = c.mantle },
            TelescopePromptTitle = { bg = c.green, fg = c.base },
            TelescopePreviewTitle = { bg = c.red, fg = c.base },
            TelescopeResultsTitle = { bg = c.crust, fg = c.crust },
          }
        end,
      }
      vim.cmd [[colorscheme catppuccin]]
    end,
  },
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      filter = "ristretto",
      background_clear = { "telescope" },
      override = function(c)
        return {
          NvimTreeGitNew = { fg = c.gitDecoration.addedResourceForeground },
          NvimTreeGitStaged = { fg = c.gitDecoration.conflictingResourceForeground },
          TelescopePromptNormal = { bg = c.sideBar.background },
          TelescopePromptBorder = { fg = c.sideBar.background, bg = c.sideBar.background },
          TelescopeResultsNormal = { fg = c.common_fg, bg = c.base.dark },
          TelescopeResultsBorder = { fg = c.base.dark, bg = c.base.dark },
          TelescopePreviewNormal = { bg = c.base.dark },
          TelescopePreviewBorder = { bg = c.base.dark, fg = c.base.dark },
        }
      end,
    },
    config = function(_, opts)
      require("monokai-pro").setup(opts)
      vim.cmd [[colorscheme monokai-pro]]
    end,
  },
}
