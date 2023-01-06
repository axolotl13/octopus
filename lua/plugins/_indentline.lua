return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  config = function()
    local identline = require("indent_blankline")

    local opts = {
      char = "▏",
      context_char = "▏",
      -- char_list = {'|', '¦', '┆', '┊'},
      max_indent_increase = 1,
      show_current_context = true,
      show_current_context_start = true,
      show_trailing_blankline_indent = false,
      show_current_context_start_on_current_line = true,
      -- show_end_of_line = true,
      use_treesitter = true,
      buftype_exclude = {
        "terminal",
        "help",
        "packer",
        "TelescopePrompt",
        "TelescopeResults",
        "DiffviewOpen",
        "nofile"
      },
      filetype_exclude = {
        "alpha",
        "help",
        "terminal",
        "packer",
        "sh",
        "md",
        "txt",
        "css",
        "lspinfo",
        "NvimTree"
      },
      context_patterns = {
        "class",
        "function",
        "method",
        "try",
        "^if",
        "^while",
        "^for",
        "^switch",
        "^object",
        "^table",
        "block",
        "arguments",
        "return",
        "jsx_element",
        "if_statement",
        "else_clause",
        "jsx_element",
        "jsx_self_closing_element",
        "try_statement",
        "catch_clause",
        "import_statement",
        "operation_type",
        "export"
      }
    }

    identline.setup(opts)

  end
}

