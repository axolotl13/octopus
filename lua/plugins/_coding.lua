return {
  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {
      appearance = {
        use_nvim_cmp_as_default = false,
        kind_icons = require("octopus._icons").vs,
      },
      completion = {
        accept = { auto_brackets = { enabled = true } },
        list = { selection = { preselect = true, auto_insert = true } },
        keyword = { range = "full" },
        menu = {
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
          draw = {
            treesitter = { "lsp" },
            columns = {
              { "kind_icon", "kind" },
              { "label", "label_description", gap = 1 },
            },
          },
        },
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
        ghost_text = { enabled = true },
      },
      keymap = { preset = "super-tab" },
      cmdline = { enabled = false },
      signature = { enabled = true },
      sources = { default = { "lsp", "path", "snippets", "buffer" } },
    },
    specs = {
      {
        "AstroNvim/astrolsp",
        opts = function(_, opts)
          opts.capabilities =
            vim.tbl_deep_extend("force", opts.capabilities or {}, require("blink.cmp").get_lsp_capabilities() or {})
        end,
      },
    },
  },
  {
    "xzbdmw/colorful-menu.nvim",
    lazy = true,
    opts = { max_width = 50 },
    specs = {
      {
        "Saghen/blink.cmp",
        opts = {
          completion = {
            menu = {
              draw = {
                columns = { { "kind_icon" }, { "label", gap = 1 } },
                components = {
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
          },
        },
      },
    },
  },
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load { paths = { "./snippets" } }
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
      region_check_events = "CursorMoved",
    },
    specs = {
      { "Saghen/blink.cmp", opts = { snippets = { preset = "luasnip" } } },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    build = ":Copilot auth",
    event = "InsertEnter",
    cmd = "Copilot",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        bigfile = false,
        csv = false,
      },
    },
    specs = {
      {
        "Saghen/blink.cmp",
        dependencies = { "fang2hou/blink-copilot" },
        opts = function(_, opts)
          table.insert(opts.sources.default, "copilot")
          opts.sources.providers = {
            copilot = {
              name = "copilot",
              module = "blink-copilot",
              score_offset = 100,
              async = true,
              opts = {
                max_completions = 1,
                kind_name = "Copilot",
                kind_icon = "",
              },
              transform_items = function(_, items)
                local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
                local kind_idx = #CompletionItemKind + 1
                CompletionItemKind[kind_idx] = "Copilot"
                for _, item in ipairs(items) do
                  item.kind = kind_idx
                end
                return items
              end,
            },
          }
        end,
      },
    },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = { disable_filetype = { "codecompanion", "snacks_picker_input", "grug-far" } },
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
