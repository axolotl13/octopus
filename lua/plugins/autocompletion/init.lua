local ok_luasnip, luasnip = pcall(require, "luasnip")
if not ok_luasnip then return end

local ok_cmp, cmp = pcall(require, "cmp")
if not ok_cmp then return end

local M = {}

M.cmp_window = function()

  local ok, window = pcall(require, "cmp.utils.window")
  if not ok then return end

  window.info_ = window.info
  window.info = function(self)
    local info = self:info_()
    info.scrollable = false
    return info
  end

end

M.border = function(hl)
  return {
    { "╭", hl },
    { "─", hl },
    { "╮", hl },
    { "│", hl },
    { "╯", hl },
    { "─", hl },
    { "╰", hl },
    { "│", hl }
  }
end

M.kinds_icons = function()

  local ok, icons = pcall(require, "ui.icons")
  if not ok then return end

  format = function(_, vim_item)
    vim_item.kind = string.format("%s %s", icons.kinds_icons[vim_item.kind], vim_item.kind)
    return vim_item
  end
  
  return format

end

M.opts = {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  formatting = {
    format = M.kinds_icons()
  },
  duplicates = {
    nvim_lsp = 1,
    luasnip = 1,
    buffer = 1,
    path = 1
  },
  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
  experimental = {
    ghost_text = true
  },
  window = {
    completion = {
      border = M.border("CmpBorder"),
      winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None"
    },
    documentation = {
      border = M.border("CmpDocBorder")
    }
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false
  },
  mapping = {
    ["<Up>"] = cmp.mapping.select_prev_item(),
    ["<Down>"] = cmp.mapping.select_next_item(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-j>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), {"i", "c"}),
    ["<C-k>"] = cmp.mapping(cmp.mapping.scroll_docs(1), {"i", "c"}),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
    -- ["<C-y>"] = cmp.config.disable,
    ["<C-e>"] = cmp.mapping {i = cmp.mapping.abort(), c = cmp.mapping.close()},
    ["<CR>"] = cmp.mapping.confirm {behavior = cmp.ConfirmBehavior.Replace, select = true},
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
        -- elseif has_words_before() then
        --   cmp.complete()
      else
        fallback()
      end
    end, {"i", "s"}),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {"i", "s"})
  }
}

M.start = function()

  local ok, cmp = pcall(require, "cmp")
  if not ok then return end

  M.cmp_window()

  cmp.setup(M.opts)

end

return M
