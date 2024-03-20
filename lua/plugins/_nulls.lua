return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  config = function()
    local nls = require "null-ls"
    local opts = {
      debounce = 150,
      save_after_format = false,
      sources = {
        -- Commit
        -- nls.builtins.diagnostics.commitlint,
        -- nls.builtins.diagnostics.dotenv_linter,
        -- Bash
        nls.builtins.formatting.shfmt.with {
          extra_args = { "-i", "4" },
        },
        -- Cssls, Javascript, Html, ...
        nls.builtins.formatting.prettier.with {
          disabled_filetypes = { "markdown" },
        },
        -- Docker and Yaml
        nls.builtins.diagnostics.yamllint,
        nls.builtins.diagnostics.hadolint,
        -- XML
        nls.builtins.diagnostics.tidy,
        nls.builtins.formatting.tidy.with {
          extra_args = { "-xml" },
          disabled_filetypes = { "html" },
        },
        -- Java
        nls.builtins.diagnostics.checkstyle.with {
          extra_args = { "-c", vim.fn.expand "$XDG_CONFIG_HOME" .. "/linters/google_checks.xml" },
        },
        nls.builtins.formatting.clang_format.with {
          extra_args = { "-style", "{IndentWidth: 4}" },
        },
        -- Lua
        nls.builtins.diagnostics.selene,
        nls.builtins.formatting.stylua,
        -- Markdown
        nls.builtins.diagnostics.markdownlint,
        nls.builtins.formatting.markdownlint,
        nls.builtins.diagnostics.codespell.with {
          filetypes = { "markdown", "tex" },
        },
        nls.builtins.formatting.codespell.with {
          filetypes = { "markdown", "tex" },
        },
        -- Python
        -- nls.builtins.diagnostics.pylint.with {
        --   diagnostics_postprocess = function(diagnostic)
        --     diagnostic.code = diagnostic.message_id
        --   end,
        -- },
        nls.builtins.formatting.black,
        -- nls.builtins.formatting.isort,
        -- Ruby
        nls.builtins.formatting.rubocop,
        -- SQL
        nls.builtins.diagnostics.sqlfluff.with {
          extra_args = { "--config", vim.fn.expand "$XDG_CONFIG_HOME" .. "/linters/sqlfluff" },
        },
        nls.builtins.formatting.sqlfluff.with {
          extra_args = { "--config", vim.fn.expand "$XDG_CONFIG_HOME" .. "/linters/sqlfluff" },
        },
        -- nls.builtins.formatting.pretty_php,
        -- nls.builtins.diagnostics.phpstan,
        -- nls.builtins.code_actions.gitsigns,
      },
    }
    nls.setup(opts)
  end,
}
