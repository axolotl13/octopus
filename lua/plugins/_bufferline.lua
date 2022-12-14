return {
  "akinsho/bufferline.nvim",
  event = "BufAdd",
  config = function()
    local bufferline = require("bufferline")
    local icons = require("ui.icons")

    local opts = {
      options = {
        middle_mouse_command = "vertical sbuffer %d",
        indicator = { icon = icons.buffer.indicator, style = "none" },
        buffer_close_icon = icons.buffer.tab_close,
        modified_icon = icons.buffer.modified,
        close_icon = icons.buffer.close,
        left_trunc_marker = icons.buffer.left,
        right_trunc_marker = icons.buffer.right,
        max_name_length = 20,
        max_prefix_length = 20,
        tab_size = 20,
        offsets = { { filetype = "NvimTree", text = "", padding = 0 } },
        show_close_icon = false,
        persist_buffer_sort = true,
        separator_style = "thin",
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        hover = {
          enabled = true,
          delay = 200,
          reveal = { 'close' }
        },
      },
      highlights = {
        fill = {
          fg = { attribute = "fg", highlight = "Cursor" },
          bg = { attribute = "bg", highlight = "TabLine" },
        },
        background = {
          fg = { attribute = "fg", highlight = "Comment" },
          bg = { attribute = "bg", highlight = "TabLine" },
        },
        buffer_selected = {
          fg = { attribute = "fg", highlight= "Normal" },
          bg = { attribute = "bg", highlight= "Normal" },
          italic = false
        },
        buffer_visible = {
          fg = { attribute = "fg", highlight = "Comment" },
          bg = { attribute = "bg", highlight = "TabLine" },
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
          bg ={ attribute = "bg", highlight = "Normal" }
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
          fg = { attribute = "fg", highlight = "TabLineSel" },
          bg = { attribute = "bg", highlight = "Normal" },
        },
        duplicate_selected = {
          fg = { attribute = "fg", highlight = "Comment" },
          bg = { attribute = "bg", highlight = "Normal" },
          underline = false, undercurl = false, italic = true
        },
        duplicate_visible = {
          fg = { attribute = "fg", highlight = "Comment" },
          bg = { attribute = "bg", highlight = "TabLine" },
          underline = false, undercurl = false, italic = true
        },
        duplicate = {
          fg = { attribute = "fg", highlight = "TabLine" },
          bg = { attribute = "bg", highlight = "TabLine" },
          underline = false, undercurl = false, italic = true
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
          bg = { attribute = "bg", highlight = "TabLine" }
          },
        indicator_selected = {
          fg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
          bg = { attribute = "bg", highlight = "Normal" },
        },
      },
    }

    bufferline.setup(opts)

  end,
  keys = {
    { "??", "<cmd>BufferLinePick<cr>", desc = "[Bufferline] Pickear en bufferes actuales" },
    { "<A-1>", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "[Bufferline] Mover al primer buffer" },
    { "<A-right>", "<cmd>BufferLineMoveNext<cr>", desc = "[Bufferline] Mover buffer hac??a la derecha" },
    { "<A-left>", "<cmd>BufferLineMovePrev<cr>", desc = "[Bufferline] Mover buffer hac??a la izquierda" },
    { "<leader>bi", "<cmd>BufferLineSortByDirectory<cr>", desc = "[Bufferline] Ordernar buffer por directorio" },
    { "<leader>be", "<cmd>BufferLineSortByExtension<cr>", desc = "[Bufferline] Ordernar buffer por extensiones" },
    {
      "<C-z>",
      function()
        vim.cmd("BufferLineCloseRight")
        vim.cmd("BufferLineCloseLeft")
      end,
      desc = "[Bufferline] Cerrar todos los bufferes excepto la actual"
    }
  }
}
