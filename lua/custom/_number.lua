vim.api.nvim_set_hl(0, "LineNr0", { fg = "#7AB2D3", bold = true }) -- Current line (light blue)
vim.api.nvim_set_hl(0, "LineNr1", { fg = "#B9E5E8" }) -- Lines ±1 (teal)
vim.api.nvim_set_hl(0, "LineNr2", { fg = "#DFF2EB" }) -- Lines ±2 (golden brown)
vim.api.nvim_set_hl(0, "LineNr3", { fg = "#90a3c3" }) -- Lines ±3 (muted pink)

local get_visual_range = function()
  local start_line = vim.fn.line "v"
  local end_line = vim.fn.line "."
  -- Swap if selection is made upwards
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end
  return { start_line, end_line }
end

-- local number_color = require("utils.hi").getHexColor("Constant", "fg")
vim.api.nvim_set_hl(0, "StatusColumnNumber", { link = "Constant" })
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- number_color = require("utils.hi").getHexColor("Visual", "bg")
    vim.api.nvim_set_hl(0, "StatusColumnNumber", { link = "Constant" })
  end,
})

local status = function()
  -- local win = vim.g.statusline_winid

  local is_num = vim.wo.number
  local is_relnum = vim.wo.relativenumber

  if is_num or is_relnum then
    local number_component = ""
    local mode = vim.fn.mode()

    -- visual mode highlighting
    if mode:match "[vV]" then
      local v_range = get_visual_range()
      local is_in_range = vim.v.lnum >= v_range[1] and vim.v.lnum <= v_range[2]
      if is_in_range then
        number_component = "%#StatusColumnNumber#"
      end
      -- end -- NOTE: to add gradual ln hls comment this line and uncomment the block below
    else
      -- Gradual line number highlighting
      local rel_num = math.abs(vim.v.relnum)
      if vim.v.relnum == 0 then
        number_component = "%#LineNr0#"
      elseif rel_num == 1 then
        number_component = "%#LineNr1#"
      elseif rel_num == 2 then
        number_component = "%#LineNr2#"
      elseif rel_num == 3 then
        number_component = "%#LineNr3#"
      end
    end
    if vim.v.relnum == 0 then
      number_component = number_component .. (is_num and "%l" or "%r")
    else
      number_component = number_component .. (is_relnum and "%r" or "%l")
    end
    return "%=" .. number_component
  end
end

return status
