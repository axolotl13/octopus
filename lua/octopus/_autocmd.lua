local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
  desc = "Highlight text on yank",
  callback = function()
    vim.highlight.on_yank()
  end,
})

autocmd("BufEnter", {
  desc = "Don't auto comment new line",
  callback = function()
    vim.opt.formatoptions:remove { "c", "r", "o" }
  end,
})

autocmd("BufReadPost", {
  desc = "Jump to the last place you’ve visited in a file before exiting",
  callback = function()
    local ignore_ft = { "gitcommit", "toggleterm", "lazy" }
    local ft = vim.bo.filetype
    if not vim.tbl_contains(ignore_ft, ft) then
      local mark = vim.api.nvim_buf_get_mark(0, '"')
      local lcount = vim.api.nvim_buf_line_count(0)
      if mark[1] > 0 and mark[1] <= lcount then
        pcall(vim.api.nvim_win_set_cursor, 0, mark)
        vim.cmd.normal { args = { "zz" }, bang = true }
      end
    end
  end,
})

autocmd("TermOpen", {
  desc = "Disable line number/fold column/sign column for terminals",
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
    vim.opt.foldcolumn = "0"
    vim.opt.signcolumn = "no"
  end,
})

autocmd("TermOpen", {
  desc = "Start insert open terminal",
  command = "startinsert",
})
