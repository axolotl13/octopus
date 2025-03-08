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

autocmd({ "BufWinLeave", "BufWritePost", "WinLeave" }, {
  desc = "Save view with mkview for real files",
  callback = function(args)
    if vim.b[args.buf].view_activated then
      vim.cmd.mkview { mods = { emsg_silent = true } }
    end
  end,
})

autocmd("BufWinEnter", {
  desc = "Try to load file view if available and enable view saving for real files",
  callback = function(args)
    if not vim.b[args.buf].view_activated then
      local filetype = vim.api.nvim_get_option_value("filetype", { buf = args.buf })
      local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })
      local ignore_filetypes = { "gitcommit", "gitrebase", "svg", "hgcommit" }
      if buftype == "" and filetype and filetype ~= "" and not vim.tbl_contains(ignore_filetypes, filetype) then
        vim.b[args.buf].view_activated = true
        vim.cmd.loadview { mods = { emsg_silent = true } }
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
