return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  opts = {
    enabled = true,
    indent = {
      char = "▎",
    },
    scope = {
      enabled = true,
      char = "▎",
      show_start = true,
      show_end = false,
      injected_languages = true,
      highlight = "Function",
      include = {
        node_type = {
          bash = {
            "if_statement",
            "for_statement",
            "case_statement",
          },
          lua = {
            "if_statement",
            "for_statement",
            "method_statement",
            "return_statement",
          },
          python = {
            "if_statement",
            "for_statement",
            "while_statement",
            "try_statement",
            "with_statement",
          },
        },
      },
      exclude = {
        language = { "fish" },
      },
    },
    exclude = {
      filetypes = {
        "lazy",
        "mason",
        "notify",
        "NvimTree",
        "spectre_panel",
      },
    },
  },
}
