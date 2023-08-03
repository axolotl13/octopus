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
        nls.builtins.formatting.shfmt.with({ extra_args = { "-i", "4" } }),
        nls.builtins.formatting.xmllint,
        nls.builtins.formatting.sqlfluff.with({ extra_args = { "--dialect", "mysql" } }),
        nls.builtins.formatting.codespell.with({ filetypes = { "markdown" } }),
        nls.builtins.formatting.clang_format.with({
          filetypes = { "c", "cpp", "cs", "java" }, extra_args = { "-style", "{IndentWidth: 4}" } } ),
        nls.builtins.diagnostics.tidy,
        nls.builtins.diagnostics.checkstyle.with({ extra_args = { "-c", "/google_checks.xml" }}),
        nls.builtins.diagnostics.markdownlint,
        nls.builtins.diagnostics.hadolint,
        nls.builtins.diagnostics.eslint_d,
        nls.builtins.diagnostics.jsonlint,
        nls.builtins.diagnostics.luacheck,
        nls.builtins.diagnostics.sqlfluff.with({ extra_args = { "--dialect", "mysql" } }),
        nls.builtins.diagnostics.shellcheck,
        nls.builtins.diagnostics.yamllint,
        nls.builtins.diagnostics.stylelint,
        nls.builtins.diagnostics.pylint.with({
          diagnostics_postprocess = function(diagnostic)
            diagnostic.code = diagnostic.message_id
          end,
        }),
        nls.builtins.code_actions.gitsigns,
      },
    }
    nls.setup(opts)
  end,
}
