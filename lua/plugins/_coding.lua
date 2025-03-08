return {
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load { paths = { "./snippets" } }
      end,
    },
    build = "make install_jsregexp",
    opts = {
      history = true,
      delete_check_events = "TextChanged",
      region_check_events = "CursorMoved",
    },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "xzbdmw/colorful-menu.nvim",
    lazy = true,
    opts = { max_width = 50 },
  },
  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
      { "rafamadriz/friendly-snippets" },
      {
        "saghen/blink.compat",
        version = "*",
        lazy = true,
        opts = {},
      },
      {
        "supermaven-inc/supermaven-nvim",
        lazy = true,
        opts = {
          ignore_filetypes = { "codecompanion", "bigfile", "grug-far" },
          disable_inline_completion = true,
          disable_keymaps = true,
        },
      },
    },
    opts = {
      appearance = {
        use_nvim_cmp_as_default = false,
        kind_icons = require("octopus._icons").vs,
      },
      completion = {
        accept = { auto_brackets = { enabled = true } },
        list = { selection = { preselect = true, auto_insert = true } },
        menu = {
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
          draw = {
            treesitter = { "lsp" },
            columns = { { "kind_icon" }, { "label", gap = 1 } },
            components = {
              kind_icon = {
                ellipsis = false,
                text = function(ctx)
                  local icon = ctx.kind_icon
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      icon = dev_icon
                    end
                  end
                  return icon .. ctx.icon_gap
                end,
                highlight = function(ctx)
                  local hl = ctx.kind_hl
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local _, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_hl then
                      hl = dev_hl
                    end
                  end
                  return hl
                end,
              },
              label = {
                text = function(ctx)
                  return require("colorful-menu").blink_components_text(ctx)
                end,
                highlight = function(ctx)
                  return require("colorful-menu").blink_components_highlight(ctx)
                end,
              },
            },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
        },
        ghost_text = { enabled = true },
      },
      keymap = {
        ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = {
          function(cmp)
            return cmp.select_next()
          end,
          "snippet_forward",
          "fallback",
        },
        ["<S-Tab>"] = {
          function(cmp)
            return cmp.select_prev()
          end,
          "snippet_backward",
          "fallback",
        },
      },
      cmdline = {
        enabled = false,
      },
      signature = { enabled = true },
      snippets = { preset = "luasnip" },
      sources = {
        default = function(_)
          if vim.bo.filetype == "codecompanion" then
            return { "codecompanion" }
          else
            return { "supermaven", "lsp", "snippets", "path", "buffer" }
          end
        end,
        providers = {
          supermaven = {
            name = "supermaven",
            kind = "Supermaven",
            module = "blink.compat.source",
            score_offset = 100,
            async = true,
          },
          codecompanion = {
            name = "CodeCompanion",
            module = "codecompanion.providers.completion.blink",
          },
        },
      },
    },
  },
  {
    "folke/ts-comments.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    keys = { "ys", "ds", "cs" },
    opts = {},
  },
  {
    "mg979/vim-visual-multi",
    keys = { "<c-n>", "<c-up>", "<c-down>", "<s-left>", "<s-right>" },
  },
}
