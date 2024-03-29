return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  init = function()
    vim.opt.mousemoveevent = true
  end,
  event = "VeryLazy",
  opts = {
    options = {
      middle_mouse_command = "vertical sbuffer %d",
      indicator = { icon = require("ui.icons").bl.indicator, style = "none" },
      buffer_close_icon = require("ui.icons").bl.buffer_close,
      modified_icon = require("ui.icons").bl.modified,
      close_icon = require("ui.icons").bl.close,
      left_trunc_marker = require("ui.icons").bl.left,
      right_trunc_marker = require("ui.icons").bl.right,
      max_name_length = 20,
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local icon = level:match "error" and require("ui.icons").dg.hintf or require("ui.icons").dg.hint
        return count .. " " .. icon
      end,
      offsets = { { filetype = "NvimTree", text = "", separator = false } },
      show_close_icon = true,
      persist_buffer_sort = true,
      separator_style = "thin",
      enforce_regular_tabs = false,
      always_show_bufferline = false,
      hover = {
        enabled = true,
        delay = 200,
        reveal = { "close" },
      },
    },
    highlights = {
      fill = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      background = {
        fg = { attribute = "fg", highlight = "Comment" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      buffer_selected = {
        fg = { attribute = "fg", highlight = "Normal" },
        bg = { attribute = "bg", highlight = "Normal" },
        italic = false,
      },
      buffer_visible = {
        fg = { attribute = "fg", highlight = "Comment" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      diagnostic = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      diagnostic_visible = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      diagnostic_selected = {
        italic = false,
      },
      hint = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      hint_visible = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      hint_selected = {
        italic = false,
      },
      hint_diagnostic = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      hint_diagnostic_visible = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      hint_diagnostic_selected = {
        italic = false,
      },
      info = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      info_visible = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      info_selected = {
        italic = false,
      },
      info_diagnostic = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      info_diagnostic_visible = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      info_diagnostic_selected = {
        italic = false,
      },
      warning = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      warning_visible = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      warning_selected = {
        italic = false,
      },
      warning_diagnostic = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      warning_diagnostic_visible = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      warning_diagnostic_selected = {
        italic = false,
      },
      error = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      error_visible = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      error_selected = {
        italic = false,
      },
      error_diagnostic = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      error_diagnostic_visible = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      error_diagnostic_selected = {
        italic = false,
      },
      numbers = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      numbers_visible = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      numbers_selected = {
        fg = { attribute = "fg", highlight = "Normal" },
        bg = { attribute = "bg", highlight = "Normal" },
      },
      close_button = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      close_button_visible = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      close_button_selected = {
        fg = { attribute = "fg", highlight = "Error" },
        bg = { attribute = "bg", highlight = "Normal" },
      },
      tab_selected = {
        fg = { attribute = "fg", highlight = "Normal" },
        bg = { attribute = "bg", highlight = "Normal" },
      },
      tab = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      tab_close = {
        fg = { attribute = "fg", highlight = "Error" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      tab_separator = {
        fg = { attribute = "bg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      tab_separator_selected = {
        fg = { attribute = "bg", highlight = "Normal" },
        bg = { attribute = "bg", highlight = "Normal" },
      },
      duplicate_selected = {
        fg = { attribute = "fg", highlight = "Comment" },
        bg = { attribute = "bg", highlight = "Normal" },
        underline = false,
        undercurl = false,
        italic = true,
      },
      duplicate_visible = {
        fg = { attribute = "fg", highlight = "Comment" },
        bg = { attribute = "bg", highlight = "TabLine" },
        underline = false,
        undercurl = false,
        italic = true,
      },
      duplicate = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
        underline = false,
        undercurl = false,
        italic = true,
      },
      modified = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      modified_selected = {
        fg = { attribute = "fg", highlight = "String" },
        bg = { attribute = "bg", highlight = "Normal" },
      },
      modified_visible = {
        fg = { attribute = "fg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      separator = {
        fg = { attribute = "bg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      separator_selected = {
        fg = { attribute = "bg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "Normal" },
      },
      separator_visible = {
        fg = { attribute = "bg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
      indicator_selected = {
        fg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
        bg = { attribute = "bg", highlight = "Normal" },
      },
      offset_separator = {
        fg = { attribute = "bg", highlight = "TabLine" },
        bg = { attribute = "bg", highlight = "TabLine" },
      },
    },
  },
  keys = {
    { "<a-left>", "<cmd>BufferLineMovePrev<cr>", desc = "[Bufferline] Mover buffer hacía la izquierda" },
    { "<a-right>", "<cmd>BufferLineMoveNext<cr>", desc = "[Bufferline] Mover buffer hacía la derecha" },
    { "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "[Bufferline] Pickear en los bufferes actuales" },
    { "<leader>b|", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "[Bufferline] Moverse al primer buffer" },
    { "<leader>bi", "<cmd>BufferLineSortByDirectory<cr>", desc = "[Bufferline] Ordernar buffer por directorio" },
    { "<leader>be", "<cmd>BufferLineSortByExtension<cr>", desc = "[Bufferline] Ordernar buffer por extensiones" },
    {
      "<c-z>",
      function()
        vim.cmd "BufferLineCloseRight"
        vim.cmd "BufferLineCloseLeft"
      end,
      desc = "[Bufferline] Cerrar todos los bufferes excepto el actual",
    },
  },
}
