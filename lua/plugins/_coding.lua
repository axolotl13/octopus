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
          auto_show = function(ctx)
            return ctx.mode ~= "cmdline" or not vim.tbl_contains({ "/", "?" }, vim.fn.getcmdtype())
          end,
          draw = {
            treesitter = { "lsp" },
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
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
        },
        ghost_text = { enabled = true },
      },
      keymap = {
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },
        ["<PageUp>"] = { "scroll_documentation_up", "fallback" },
        ["<PageDown>"] = { "scroll_documentation_down", "fallback" },
        ["<C-e>"] = { "hide", "fallback" },
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
        cmdline = {},
      },
    },
    config = function(_, opts)
      for _, provider in pairs(opts.sources.providers or {}) do
        if provider.kind then
          local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
          local kind_idx = #CompletionItemKind + 1

          CompletionItemKind[kind_idx] = provider.kind
          CompletionItemKind[provider.kind] = kind_idx

          local transform_items = provider.transform_items
          provider.transform_items = function(ctx, items)
            items = transform_items and transform_items(ctx, items) or items
            for _, item in ipairs(items) do
              item.kind = kind_idx or item.kind
            end
            return items
          end

          provider.kind = nil
        end
      end

      require("blink.cmp").setup(opts)
    end,
  },
  {
    "folke/ts-comments.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "kylechui/nvim-surround",
    keys = { "ys", "ds", "cs" },
    opts = {},
  },
  {
    "mg979/vim-visual-multi",
    keys = { "<c-n>", "<c-up>", "<c-down>", "<s-left>", "<s-right>" },
  },
}
