return {
  "akinsho/bufferline.nvim",
  event = "BufAdd",
  dependencies = {
    "tiagovla/scope.nvim",
    config = true,
  },
  opts = {
    options = {
      middle_mouse_command = "vertical sbuffer %d",
      indicator = { icon = require("ui.icons").buffer.indicator, style = "none" },
      buffer_close_icon = require("ui.icons").buffer.tab_close,
      modified_icon = require("ui.icons").buffer.modified,
      close_icon = require("ui.icons").buffer.close,
      left_trunc_marker = require("ui.icons").buffer.left,
      right_trunc_marker = require("ui.icons").buffer.right,
      max_name_length = 20,
      max_prefix_length = 15,
      tab_size = 20,
      offsets = { { filetype = "NvimTree", text = "", separator = true } },
      show_close_icon = true,
      persist_buffer_sort = true,
      separator_style = "slant",
      enforce_regular_tabs = false,
      always_show_bufferline = true,
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
        bg = { attribute = "bg", highlight = "Error" },
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
    { "Ñ", "<cmd>BufferLinePick<cr>", desc = "[Bufferline] Pickear en bufferes actuales" },
    { "<A-1>", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "[Bufferline] Mover al primer buffer" },
    { "<A-right>", "<cmd>BufferLineMoveNext<cr>", desc = "[Bufferline] Mover buffer hacía la derecha" },
    { "<A-left>", "<cmd>BufferLineMovePrev<cr>", desc = "[Bufferline] Mover buffer hacía la izquierda" },
    { "<leader>bi", "<cmd>BufferLineSortByDirectory<cr>", desc = "[Bufferline] Ordernar bufferes por directorio" },
    { "<leader>be", "<cmd>BufferLineSortByExtension<cr>", desc = "[Bufferline] Ordernar bufferes por extensiones" },
    {
      "<C-z>",
      function()
        vim.cmd("BufferLineCloseRight")
        vim.cmd("BufferLineCloseLeft")
      end,
      desc = "[Bufferline] Cerrar todos los bufferes excepto la actual",
    },
  },
}
