local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

local function augroup(name)
  return vim.api.nvim_create_augroup("octopus_" .. name, { clear = true })
end

autocmd("TextYankPost", {
  group = augroup "highlight_yank",
  desc = "Highlight text on yank",
  callback = function()
    vim.highlight.on_yank()
  end,
})

autocmd("BufEnter", {
  group = augroup "auto_comment",
  desc = "Don't auto comment new line",
  callback = function()
    opt.formatoptions:remove { "c", "r", "o" }
  end,
})

autocmd("BufReadPost", {
  group = augroup "restore_cursor",
  desc = "Restore last cursor position when opening a file",
  callback = function(args)
    local buf = args.buf
    if vim.b[buf].last_loc_restored or vim.tbl_contains({ "gitcommit" }, vim.bo[buf].filetype) then
      return
    end
    vim.b[buf].last_loc_restored = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(buf) then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
