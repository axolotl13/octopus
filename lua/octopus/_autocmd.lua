local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

vim.filetype.add {
  pattern = {
    [".*"] = {
      function(path, buf)
        return vim.bo[buf]
            and vim.bo[buf].filetype ~= "bigfile"
            and path
            and vim.fn.getfsize(path) > 1.5 * 1024 * 1024
            and "bigfile"
          or nil
      end,
    },
  },
}

autocmd({ "FileType" }, {
  desc = "Disable certain functionality on very large files",
  group = vim.api.nvim_create_augroup("bigfile", { clear = true }),
  pattern = "bigfile",
  callback = function()
    local file = vim.fn.expand "<afile>"
    vim.notify(("File: `%s` is greater than 2MB"):format(file), vim.log.levels.WARN)
    opt.wrap = true
    opt.list = false
    opt.foldmethod = "manual"
  end,
})

autocmd("TextYankPost", {
  desc = "Highlight text on yank",
  callback = function()
    vim.highlight.on_yank()
  end,
})

autocmd("BufEnter", {
  desc = "Don't auto comment new line",
  callback = function()
    opt.formatoptions:remove { "c", "r", "o" }
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
    opt.number = false
    opt.relativenumber = false
    opt.foldcolumn = "0"
    opt.signcolumn = "no"
  end,
})
