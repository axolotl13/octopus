return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        -- require("luasnip.loaders.from_vscode").lazy_load { paths = { "./snippets/react_ts" } }
      end,
    },
    config = {
      history = true,
      delete_check_events = "TextChanged",
    },
    init = function()
      local function jump(key, dir)
        vim.keymap.set({ "i", "s" }, key, function()
          return require("luasnip").jump(dir) or key
        end, { expr = true })
      end

      jump("<tab>", 1)
      jump("<s-tab>", -1)
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local window = require("cmp.utils.window")
      local icons = require("ui.icons").kinds_icons

      window.info_ = window.info
      window.info = function(self)
        local info = self:info_()
        info.scrollable = false
        return info
      end

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
        duplicates = {
          nvim_lsp = 1,
          luasnip = 1,
          buffer = 1,
          path = 1,
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        },
        experimental = {
          ghost_text = {
            hl_group = "LspCodeLens",
          },
        },
        window = {
          completion = {
            border = border("CmpBorder"),
            winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
          },
          documentation = {
            border = border("CmpDocBorder"),
          },
        },
        confirm_opts = {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        },
        mapping = cmp.mapping.preset.insert({
          ["<up>"] = cmp.mapping.select_prev_item(),
          ["<down>"] = cmp.mapping.select_next_item(),
          ["<c-p>"] = cmp.mapping.select_prev_item(),
          ["<c-n>"] = cmp.mapping.select_next_item(),
          ["<c-j>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
          ["<c-k>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
          ["<c-space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
          ["<c-e>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
          ["<cr>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
      }
      cmp.setup(opts)
    end,
  },
}
