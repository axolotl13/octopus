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
          latte = {
            rosewater = "#c14a4a",
            flamingo = "#c14a4a",
            red = "#c14a4a",
            maroon = "#c14a4a",
            pink = "#945e80",
            mauve = "#945e80",
            peach = "#c35e0a",
            yellow = "#b47109",
            green = "#6c782e",
            teal = "#4c7a5d",
            sky = "#4c7a5d",
            sapphire = "#4c7a5d",
            blue = "#45707a",
            lavender = "#45707a",
            text = "#654735",
            subtext1 = "#73503c",
            subtext0 = "#805942",
            overlay2 = "#8c6249",
            overlay1 = "#8c856d",
            overlay0 = "#a69d81",
            surface2 = "#bfb695",
            surface1 = "#d1c7a3",
            surface0 = "#e3dec3",
            base = "#f9f5d7",
            mantle = "#f0ebce",
            crust = "#e8e3c8",
          },
          mocha = {
            rosewater = "#ffc9c9",
            flamingo = "#ff9f9a",
            pink = "#ffa9c9",
            mauve = "#df95cf",
            lavender = "#a990c9",
            red = "#ff6960",
            maroon = "#f98080",
            peach = "#f9905f",
            yellow = "#f9bd69",
            green = "#b0d080",
            teal = "#a0dfa0",
            sky = "#a0d0c0",
            sapphire = "#95b9d0",
            blue = "#89a0e0",
            text = "#e0d0b0",
            subtext1 = "#d5c4a1",
            subtext0 = "#bdae93",
            overlay2 = "#928374",
            overlay1 = "#7c6f64",
            overlay0 = "#665c54",
            surface2 = "#504844",
            surface1 = "#3a3634",
            surface0 = "#252525",
            base = "#151515",
            mantle = "#0e0e0e",
            crust = "#080808",
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
