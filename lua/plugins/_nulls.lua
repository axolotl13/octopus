return {
  "jose-elias-alvarez/null-ls.nvim",
  event = "BufReadPre",
  config = function()
    local nls = require("null-ls")
    local opts = {
      debounce = 150,
      save_after_format = false,
      sources = {
        nls.builtins.formatting.prettier,
        nls.builtins.formatting.black,
        nls.builtins.formatting.isort,
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.shfmt,
        nls.builtins.formatting.xmllint,
        nls.builtins.formatting.cmake_format,
        nls.builtins.formatting.codespell.with({ filetypes = { "markdown" } }),
        nls.builtins.formatting.clang_format.with({ filetypes = { "c", "cpp", "cs" } }),
        nls.builtins.diagnostics.tidy.with({ filetypes = { "html", "xml" } }),
        nls.builtins.diagnostics.markdownlint,
        nls.builtins.diagnostics.hadolint,
        nls.builtins.diagnostics.yamllint,
        nls.builtins.diagnostics.stylelint,
        nls.builtins.diagnostics.pylint.with({
          diagnostics_postprocess = function(diagnostic)
            diagnostic.code = diagnostic.message_id
          end
        }),
        nls.builtins.formatting.prettierd.with({
          filetypes = { "markdown" },
        }),
        -- nls.builtins.code_actions.gitsigns,
      },
    }

    nls.setup(opts)

  end,
}
