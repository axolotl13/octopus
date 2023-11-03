return {
  "stevearc/resession.nvim",
  lazy = false,
  opts = {
    dir = "resession",
    autosave = {
      enabled = true,
      interval = 60,
      notify = false,
    },
    options = {
      "binary",
      "bufhidden",
      "buflisted",
      "cmdheight",
      "diff",
      "filetype",
      "modifiable",
      "previewwindow",
      "readonly",
      "scrollbind",
      "winfixheight",
      "winfixwidth",
      "tabstop",
      "shiftwidth",
      "relativenumber",
    },
    extensions = {},
  },
  config = function(_, opts)
    local resession = require "resession"
    resession.setup(opts)
    local function get_session_name()
      local name = vim.fn.getcwd()
      local branch = vim.trim(vim.fn.system "git branch --show-current")
      if vim.v.shell_error == 0 then
        return name .. branch
      else
        return name
      end
    end
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        if vim.fn.argc(-1) == 0 then
          resession.load(get_session_name(), { dir = "dirsession", silence_errors = true })
        end
      end,
    })
    vim.api.nvim_create_autocmd("VimLeavePre", {
      callback = function()
        resession.save(get_session_name(), { dir = "dirsession", notify = false })
      end,
    })
  end,
  keys = {
    { "<leader>xs", "<cmd>lua require('resession').save()<cr>", desc = "[resession] Guardar Sesión" },
    { "<leader>xl", "<cmd>lua require('resession').load()<cr>", desc = "[resession] Cargar Sesión" },
    { "<leader>xd", "<cmd>lua require('resession').delete()<cr>", desc = "[resession] Eliminar Sesión" },
  },
}
