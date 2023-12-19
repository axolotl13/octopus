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
          hl.TreesitterContext = { bg = c.bg }
          hl.TreesitterContextBottom = { underline = true, sp = c.fg_dark }
        end
      end,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      require("tokyonight").load()
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup {
        background = {
          light = "latte",
          dark = "mocha",
        },
        color_overrides = {
          -- latte = {},
          mocha = {
            rosewater = "#ea6962",
            flamingo = "#ea6962",
            red = "#ea6962",
            maroon = "#ea6962",
            pink = "#d3869b",
            mauve = "#d3869b",
            peach = "#e78a4e",
            yellow = "#d8a657",
            green = "#a9b665",
            teal = "#89b482",
            sky = "#89b482",
            sapphire = "#89b482",
            blue = "#7daea3",
            lavender = "#7daea3",
            text = "#ebdbb2",
            subtext1 = "#d5c4a1",
            subtext0 = "#bdae93",
            overlay2 = "#a89984",
            overlay1 = "#928374",
            overlay0 = "#595959",
            surface2 = "#4d4d4d",
            surface1 = "#404040",
            surface0 = "#292929",
            base = "#1d2021",
            mantle = "#191b1c",
            crust = "#141617",
          },
        },
        custom_highlights = function(c)
          return {
            TelescopeNormal = { bg = c.crust, fg = c.text },
            TelescopeBorder = { bg = c.crust, fg = c.crust },
            TelescopePromptNormal = { bg = c.mantle },
            TelescopePromptBorder = { bg = c.mantle, fg = c.mantle },
            TelescopePromptTitle = { bg = c.green, fg = c.base },
            TelescopePreviewTitle = { bg = c.red, fg = c.base },
            TelescopeResultsTitle = { bg = c.crust, fg = c.crust },
            TreesitterContext = { bg = c.base },
            TreesitterContextBottom = { underline = true, sp = c.surface1 },
          }
        end,
      }
      vim.cmd [[colorscheme catppuccin]]
    end,
  },
  {
    "loctvl842/monokai-pro.nvim",
    -- lazy = false,
    -- priority = 1000,
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
          TreesitterContext = { bg = c.editor.background },
          TreesitterContextBottom = { underline = true, sp = "gray" },
        }
      end,
    },
    config = function(_, opts)
      require("monokai-pro").setup(opts)
      vim.cmd [[colorscheme monokai-pro]]
    end,
  },
}
