local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("TextYankPost", {
  group = augroup("highlight_yank", { clear = true }),
  desc = "Highlight text on yank",
  callback = function()
    vim.highlight.on_yank()
  end,
})

autocmd("BufEnter", {
  group = augroup("auto_comment", { clear = true }),
  desc = "Don't auto comment new line",
  callback = function()
    vim.opt.formatoptions:remove { "c", "r", "o" }
  end,
})

autocmd({ "CursorMoved", "DiagnosticChanged" }, {
  group = augroup("diagnostic_virt_text_hide", {}),
  callback = function(ev)
    local filetype = vim.api.nvim_get_option_value("filetype", { buf = ev.buf })

    if filetype == "lazy" or filetype == "mason" then
      return
    end

    local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1

    local prev_lnum = vim.b[ev.buf].diagnostic_hidden_lnum
    if prev_lnum and prev_lnum ~= lnum then
      vim.b[ev.buf].diagnostic_hidden_lnum = nil
      vim.diagnostic.show(nil, ev.buf)
    end

    for _, ns_data in pairs(vim.diagnostic.get_namespaces()) do
      local virt_ns = ns_data.user_data and ns_data.user_data.virt_text_ns
      if virt_ns then
        local extmarks = vim.api.nvim_buf_get_extmarks(ev.buf, virt_ns, { lnum, 0 }, { lnum, -1 }, {})
        if #extmarks > 0 then
          for _, ext in ipairs(extmarks) do
            vim.api.nvim_buf_del_extmark(ev.buf, virt_ns, ext[1])
          end
          vim.b[ev.buf].diagnostic_hidden_lnum = lnum
        end
      end
    end
  end,
})

autocmd("BufReadPost", {
  group = augroup("restore_cursor", { clear = true }),
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
