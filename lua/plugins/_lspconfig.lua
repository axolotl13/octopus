return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = { "mason-org/mason-lspconfig.nvim" },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = { prefix = "" },
        -- virtual_lines = { current_line = true },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = require("octopus._icons").diag.Error,
            [vim.diagnostic.severity.WARN] = require("octopus._icons").diag.Warn,
            [vim.diagnostic.severity.HINT] = require("octopus._icons").diag.Hint,
            [vim.diagnostic.severity.INFO] = require("octopus._icons").diag.Info,
          },
          linehl = {
            [vim.diagnostic.severity.ERROR] = "Error",
            [vim.diagnostic.severity.WARN] = "Warn",
            [vim.diagnostic.severity.INFO] = "Info",
            [vim.diagnostic.severity.HINT] = "Hint",
          },
        },
      },
      capabilities = vim.lsp.protocol.make_client_capabilities(),
      inlay_hints = { enabled = true },
      codelens = { enabled = true },
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                autoImportCompletions = true,
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                typeCheckingMode = "standard",
              },
              python = {
                analysis = {
                  diagnosticMode = "workspace",
                },
              },
            },
          },
        },
        cssls = { init_options = { provideFormatter = false } },
        html = { init_options = { provideFormatter = false } },
        jsonls = {
          on_new_config = function(new_config)
            new_config.settings.json.schemas = new_config.settings.json.schemas or {}
            vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
          end,
          settings = {
            json = { validate = { enable = true } },
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              hint = { enable = true, arrayIndex = "Disable" },
              diagnostics = { globals = { "vim" } },
              workspace = { checkThirdParty = false },
            },
          },
        },
        texlab = {
          settings = {
            texlab = {
              auxDirectory = ".",
              diagnosticsDelay = 50,
              build = {
                args = {
                  "--keep-intermediates",
                  "--keep-logs",
                  "--synctex",
                  "%f",
                },
                executable = "tectonic",
                onSave = true,
              },
            },
          },
        },
        vtsls = {
          settings = {
            typescript = {
              updateImportsOnFileMove = { enabled = "always" },
              inlayHints = {
                parameterNames = { enabled = "all" },
                parameterTypes = { enabled = true },
                variableTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                enumMemberValues = { enabled = true },
              },
            },
            javascript = {
              updateImportsOnFileMove = { enabled = "always" },
              inlayHints = {
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                variableTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                enumMemberValues = { enabled = true },
              },
            },
            vtsls = {
              enableMoveToFileCodeAction = true,
            },
          },
        },
        yamlls = {
          on_new_config = function(new_config)
            new_config.settings.yaml.schemas = vim.tbl_deep_extend(
              "force",
              new_config.settings.yaml.schemas or {},
              require("schemastore").yaml.schemas()
            )
          end,
          settings = {
            redhat = { telemetry = { enabled = false } },
            yaml = {
              validate = true,
              schemaStore = {
                enable = false,
                url = "",
              },
            },
          },
        },
      },
    },
    config = function(_, opts)
      local autocmd = vim.api.nvim_create_autocmd
      local augroup = vim.api.nvim_create_augroup

      autocmd("LspAttach", {
        group = augroup("lsp-attach", { clear = true }),
        callback = function(event)
          local function client_supports_method(client, method, bufnr)
            return client:supports_method(method, bufnr)
          end

          local client = assert(vim.lsp.get_client_by_id(event.data.client_id))
          local bufnr = event.buf

          if
            client
            and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, bufnr)
          then
            local lsp_hl = augroup("lsp-highlight", { clear = false })
            autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = bufnr,
              group = lsp_hl,
              callback = vim.lsp.buf.document_highlight,
            })

            autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = bufnr,
              group = lsp_hl,
              callback = vim.lsp.buf.clear_references,
            })

            autocmd("LspDetach", {
              group = augroup("lsp-detach", { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = "lsp-highlight", buffer = event2.buf }
              end,
            })
          end

          if opts.inlay_hints.enabled then
            if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, bufnr) then
              vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            end
          end

          if opts.codelens.enabled then
            if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_codeLens, bufnr) then
              autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
                buffer = bufnr,
                callback = vim.lsp.codelens.refresh,
              })
            end
          end

          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_foldingRange) then
            local win = vim.api.nvim_get_current_win()
            vim.wo[win][0].foldmethod = "expr"
            vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
          end
        end,
      })

      opts.capabilities.textDocument.semanticTokens = { multilineTokenSupport = true }
      opts.capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      vim.lsp.config("*", {
        capabilities = opts.capabilities,
      })

      vim.diagnostic.config(opts.diagnostics)

      for name, config in pairs(opts.servers) do
        vim.lsp.config(name, config)
      end
    end,
    keys = {
      {
        "gh",
        function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end,
        desc = "Toggle inlay hint",
      },
      {
        "gK",
        function()
          local new_config = not vim.diagnostic.config().virtual_lines
          vim.diagnostic.config { virtual_lines = new_config }
        end,
        desc = "Toggle virtual lines",
      },
      {
        "grh",
        function()
          vim.diagnostic.open_float()
        end,
        desc = "Hover diagnostic",
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = { ui = { keymaps = { uninstall_package = "d" } } },
    keys = { { "<leader>,M", "<cmd>Mason<cr>", desc = "Open mason" } },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { { "mason-org/mason.nvim" } },
    opts = {
      ensure_installed = {
        "basedpyright",
        "bashls",
        "cssls",
        "docker_compose_language_service",
        "dockerls",
        "emmet_language_server",
        "eslint",
        "html",
        "jsonls",
        "lemminx",
        "lua_ls",
        "marksman",
        "ruff",
        "taplo",
        "texlab",
        "vtsls",
        "yamlls",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        css = { "prettierd" },
        dockerfile = { "hadolint" },
        html = { "prettierd" },
        json = { "prettierd" },
        jsonc = { "prettierd" },
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        less = { "prettierd" },
        lua = { "stylua" },
        markdown = { "markdownlint-cli2" },
        python = { "ruff_format" },
        scss = { "prettierd" },
        sh = { "shfmt" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        xml = { "xmllint" },
        yaml = { "prettierd" },
      },
    },
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format { async = true }
        end,
        desc = "Format buffer with conform",
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufNewFile", "BufReadPost" },
    opts = {
      events = { "BufWritePost", "BufReadPost", "InsertLeave", "TextChanged" },
      linters_by_ft = {
        dockerfile = { "hadolint" },
        gitcommit = { "gitlint" },
        html = { "markuplint" },
        lua = { "selene" },
        markdown = { "markdownlint-cli2" },
        yaml = { "yamllint" },
      },
    },
    config = function(_, opts)
      local lint = require "lint"
      lint.linters_by_ft = opts.linters_by_ft
      vim.api.nvim_create_autocmd(opts.events, {
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
}
