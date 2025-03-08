local function get_buffer_line(bufnr, linenr)
  return vim.api.nvim_buf_get_lines(bufnr, linenr - 1, linenr, false)[1]
end

local function get_parser(bufnr)
  local ok, parser = pcall(vim.treesitter.get_parser, bufnr)
  return ok and parser or nil
end

local function get_treesitter_query(parser)
  return vim.treesitter.query.get(parser:lang(), "highlights")
end

local function parse_line(linenr)
  local bufnr = vim.api.nvim_get_current_buf()
  local line = get_buffer_line(bufnr, linenr)

  if not line then
    return nil
  end

  local parser = get_parser(bufnr)
  if not parser then
    return nil
  end

  local query = get_treesitter_query(parser)
  if not query then
    return nil
  end

  local syntax_tree = parser:parse({ linenr - 1, linenr })[1]
  local highlighted_text = {}
  local last_pos = 0

  for id, node, metadata in query:iter_captures(syntax_tree:root(), 0, linenr - 1, linenr) do
    local highlight_name = query.captures[id]
    local start_row, start_col, end_row, end_col = node:range()
    local priority = tonumber(metadata.priority or vim.highlight.priorities.treesitter)

    if start_row == linenr - 1 and end_row == linenr - 1 then
      if start_col > last_pos then
        table.insert(highlighted_text, {
          line:sub(last_pos + 1, start_col),
          { { "Folded", priority } },
          range = { last_pos, start_col },
        })
      end

      last_pos = end_col
      local extracted_text = line:sub(start_col + 1, end_col)

      table.insert(highlighted_text, {
        extracted_text,
        { { "@" .. highlight_name, priority } },
        range = { start_col, end_col },
      })
    end
  end

  local i = 1
  while i <= #highlighted_text do
    local j = i + 1
    while
      j <= #highlighted_text
      and highlighted_text[j].range[1] >= highlighted_text[i].range[1]
      and highlighted_text[j].range[2] <= highlighted_text[i].range[2]
    do
      for _, hl in ipairs(highlighted_text[i][2]) do
        if not vim.tbl_contains(highlighted_text[j][2], hl) then
          table.insert(highlighted_text[j][2], hl)
        end
      end
      j = j + 1
    end

    if j > i + 1 then
      table.remove(highlighted_text, i)
    else
      if #highlighted_text[i][2] > 1 then
        table.sort(highlighted_text[i][2], function(a, b)
          return a[2] < b[2] -- Orden ascendente por prioridad
        end)
      end

      highlighted_text[i][2] = vim.tbl_map(function(tbl)
        return tbl[1]
      end, highlighted_text[i][2])

      highlighted_text[i] = { highlighted_text[i][1], highlighted_text[i][2] }
      i = i + 1
    end
  end

  return highlighted_text
end

function HighlightedFoldtext()
  local result = parse_line(vim.v.foldstart)
  if not result then
    return vim.fn.foldtext()
  end

  table.insert(result, { " 󰁂 +" .. (vim.v.foldend - vim.v.foldstart) .. " lines", "FoldedText" })

  return result
end

local function set_fold_highlight()
  local comment_hl = vim.api.nvim_get_hl(0, { name = "Comment", link = false })
  vim.api.nvim_set_hl(0, "FoldedText", { fg = comment_hl.fg, italic = true })
end

set_fold_highlight()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_fold_highlight,
})

return 'luaeval("HighlightedFoldtext")()'
