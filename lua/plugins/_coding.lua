return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {
      appearance = { kind_icons = require("octopus._icons").kind },
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
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    specs = {
      {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
          opts.capabilities = require("blink.cmp").get_lsp_capabilities(opts.capabilities)
        end,
      },
    },
  },
  {
    "xzbdmw/colorful-menu.nvim",
    opts = { max_width = 50 },
    specs = {
      {
        "saghen/blink.cmp",
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
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load { paths = { "./snippets" } }
      end,
    },
    opts = {
      delete_check_events = "TextChanged",
      region_check_events = "CursorMoved",
    },
    specs = {
      { "saghen/blink.cmp", opts = { snippets = { preset = "luasnip" } } },
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
    version = "^3.0.0",
    keys = { "ys", "ds", "cs" },
    opts = {},
  },
  {
    "mg979/vim-visual-multi",
    keys = { "<c-n>", "<c-up>", "<c-down>", "<s-left>", "<s-right>" },
  },
}
