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
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      require("tokyonight").load()
    end,
  },
  -- {
  --   "sam4llis/nvim-tundra",
  --   lazy = false,
  --   priority = 1000,
  --   config = true,
  --   init = function()
  --     vim.cmd "colorscheme tundra"
  --   end,
  -- },
  {
    "projekt0n/github-nvim-theme",
    lazy = false,
    priority = 1000,
    config = function()
        groups = {
          all = {
            NormalNC = { fg = "#000000", bg = "#ffffff" }, -- Non-current windows
          },
              require("github-theme").setup {
},
      }
      vim.cmd "colorscheme github_dark_colorblind"
    end,
  },
  {
    "catppuccin/nvim",
    as = "catppuccin",
    -- lazy = false,
    -- priority = 1000,
    config = function()
      require("catppuccin").setup {
        flavour = "mocha",
      }
      vim.cmd [[colorscheme catppuccin]]
    end,
  },
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      filter = "pro",
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
