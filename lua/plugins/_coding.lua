return {
  {
    "olimorris/codecompanion.nvim",
    cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions", "CodeCompanionToggle" },
    opts = {
      strategies = {
        chat = {
          roles = {
            llm = function(adapter)
              return " CodeCompanion  " .. adapter.formatted_name
            end,
            user = " " .. (vim.env.USER or "User"),
          },
          adapter = "gemini",
        },
        inline = { adapter = "gemini" },
        cmd = { adapter = "gemini" },
      },
      adapters = {
        gemini = function()
          return require("codecompanion.adapters").extend("gemini", {
            env = {
              api_key = function()
                return os.getenv "GEMINI_API_KEY"
              end,
            },
          })
        end,
      },
      display = {
        chat = {
          window = {
            opts = {
              number = false,
              relativenumber = false,
            },
          },
        },
      },
      opts = { language = "Spanish" },
    },
    keys = {
      { mode = { "n", "v" }, "<leader>ic", "<cmd>CodeCompanionChat Toggle<cr>", desc = "CodeCompanionChat" },
      { mode = { "n", "v" }, "<leader>ia", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanionActions" },
      { "<leader>iC", "<cmd>CodeCompanion /commit<cr>", desc = "CodeCompanion /commit" },
      { mode = "v", "<leader>ie", "<cmd>CodeCompanion /explain<cr>", desc = "CodeCompanion /explain" },
      { mode = "v", "<leader>if", "<cmd>CodeCompanion /fix<cr>", desc = "CodeCompanion /fix" },
      { mode = "v", "<leader>il", "<cmd>CodeCompanion /lsp<cr>", desc = "CodeCompanion /lsp" },
      { mode = "v", "ga", "<cmd>CodeCompanion Add<cr>", desc = "CodeCompanion Add" },
    },
    specs = {
      {
        "Saghen/blink.cmp",
        opts = { sources = { per_filetype = { codecompanion = { "codecompanion" } } } },
      },
      {
        "OXY2DEV/markview.nvim",
        ft = { "markdown", "codecompanion" },
        opts = {
          preview = {
            filetypes = { "markdown", "codecompanion" },
            ignore_buftypes = {},
          },
        },
      },
    },
  },
  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {
      enabled = function()
        return not vim.tbl_contains({ "grug-far", "bigfile" }, vim.bo.filetype)
      end,
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
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
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
      { "danymat/neogen", opts = { snippet_engine = "luasnip" } },
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
