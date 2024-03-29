return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        dependencies = {
          "rafamadriz/friendly-snippets",
          config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip.loaders.from_vscode").lazy_load { paths = { "./snippets" } }
            -- require("luasnip").filetype_extend("javascriptreact", { "html" })
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
        opts = { disable_filetype = { "TelescopePrompt", "vim", "spectre_panel" } },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)
          require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done { tex = "" })
        end,
      },
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-cmdline",
      { "tzachar/cmp-fuzzy-path", dependencies = "tzachar/fuzzy.nvim" },
    },
    config = function()
      local cmp = require "cmp"
      local icons = require("ui.icons").vs

      local border = function(hl)
        return {
          { "╭", hl },
          { "─", hl },
          { "╮", hl },
          { "│", hl },
          { "╯", hl },
          { "─", hl },
          { "╰", hl },
          { "│", hl },
        }
      end

      local opts = {
        completion = {
          completeopt = "menu,menuone",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        formatting = {
          format = function(_, item)
            if icons[item.kind] then
              item.kind = icons[item.kind] .. " " .. item.kind
            end
            return item
          end,
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          {
            name = "buffer",
            option = {
              get_bufnrs = function()
                local buf = vim.api.nvim_get_current_buf()
                local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
                if byte_size > 1024 * 1024 then -- 1 Megabyte max
                  return {}
                end
                return { buf }
              end,
            },
          },
          { name = "path" },
          { name = "nvim_lsp_signature_help" },
        },
        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText",
          },
        },
        window = {
          completion = {
            border = border "CmpBorder",
            winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
            scrollbar = false,
          },
          -- documentation = cmp.config.disable,
          documentation = {
            border = border "CmpDocBorder",
          },
        },
        mapping = cmp.mapping.preset.insert {
          ["<up>"] = cmp.mapping.select_prev_item(),
          ["<down>"] = cmp.mapping.select_next_item(),
          ["<c-p>"] = cmp.mapping.select_prev_item(),
          ["<c-n>"] = cmp.mapping.select_next_item(),
          ["<c-b>"] = cmp.mapping.scroll_docs(-4),
          ["<c-f>"] = cmp.mapping.scroll_docs(4),
          ["<c-space>"] = cmp.mapping.complete(),
          ["<c-e>"] = cmp.mapping.abort(),
          ["<cr>"] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },
          ["<tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
              require("luasnip").expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif require("luasnip").jumpable(-1) then
              require("luasnip").jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
      }
      cmp.setup(opts)
      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources {
          { name = "emoji" },
          { name = "luasnip" },
          { name = "buffer" },
        },
      })
      cmp.setup.filetype("markdown", {
        sources = cmp.config.sources {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "emoji" },
          { name = "buffer" },
          { name = "path" },
        },
      })
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources {
          { name = "fuzzy_path" },
          { name = "cmdline" },
        },
      })
    end,
  },
}
