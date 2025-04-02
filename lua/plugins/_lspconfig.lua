return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = {
      { "AstroNvim/astrolsp" },
      { "williamboman/mason-lspconfig.nvim" },
    },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = false,
        virtual_lines = {
          current_line = true,
        },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = require("octopus._icons").hl.DiagnosticError,
            [vim.diagnostic.severity.WARN] = require("octopus._icons").hl.DiagnosticWarn,
            [vim.diagnostic.severity.HINT] = require("octopus._icons").hl.DiagnosticHint,
            [vim.diagnostic.severity.INFO] = require("octopus._icons").hl.DiagnosticInfo,
          },
        },
      },
    },
    config = function(_, opts)
      if type(opts.diagnostics.signs) ~= "boolean" then
        for severity, icon in pairs(opts.diagnostics.signs.text) do
          local name = vim.diagnostic.severity[severity]:lower():gsub("^%l", string.upper)
          name = "DiagnosticSign" .. name
          vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
        end
      end
      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))
    end,
    keys = {
      {
        "[d",
        function()
          vim.diagnostic.goto_prev()
        end,
        desc = "Previous Diagnostic",
      },
      {
        "]d",
        function()
          vim.diagnostic.goto_next()
        end,
        desc = "Next Diagnostic",
      },
      {
        "<c-w>d",
        function()
          vim.diagnostic.open_float()
        end,
        desc = "Hover Diagnostic",
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    opts = {
      features = {
        codelens = true,
        inlay_hints = true,
        semantic_tokens = true,
      },
      autocmds = {
        lsp_document_highlight = {
          cond = "textDocument/documentHighlight",
          {
            event = { "CursorHold", "CursorHoldI" },
            desc = "Document Highlighting",
            callback = function()
              vim.lsp.buf.document_highlight()
            end,
          },
          {
            event = { "CursorMoved", "CursorMovedI", "BufLeave" },
            desc = "Document Highlighting Clear",
            callback = function()
              vim.lsp.buf.clear_references()
            end,
          },
        },
        lsp_codelens_refresh = {
          cond = "textDocument/codeLens",
          {
            event = { "InsertLeave", "BufEnter" },
            desc = "Refresh codelens (buffer)",
            callback = function(args)
              if require("astrolsp").config.features.codelens then
                vim.lsp.codelens.refresh { bufnr = args.buf }
              end
            end,
          },
        },
        lsp_auto_format = {
          cond = "textDocument/formatting",
          {
            event = "BufWritePre",
            desc = "Autoformat on save",
            callback = function(_, _, bufnr)
              local astrolsp = require "astrolsp"
              local autoformat = assert(astrolsp.config.formatting.format_on_save)
              local buffer_autoformat = vim.b[bufnr].autoformat
              if buffer_autoformat == nil then
                buffer_autoformat = autoformat.enabled
              end
              if buffer_autoformat and ((not autoformat.filter) or autoformat.filter(bufnr)) then
                vim.lsp.buf.format(vim.tbl_deep_extend("force", astrolsp.format_opts, { bufnr = bufnr }))
              end
            end,
          },
        },
        no_insert_inlay_hints = {
          cond = vim.lsp.inlay_hint and "textDocument/inlayHint" or false,
          {
            event = "InsertEnter",
            desc = "Disable inlay hints on insert",
            callback = function(args)
              local filter = { bufnr = args.buf }
              if vim.lsp.inlay_hint.is_enabled(filter) then
                vim.lsp.inlay_hint.enable(false, filter)
                vim.api.nvim_create_autocmd("InsertLeave", {
                  buffer = args.buf,
                  once = true,
                  callback = function()
                    vim.lsp.inlay_hint.enable(true, filter)
                  end,
                })
              end
            end,
          },
        },
      },
      capabilities = vim.lsp.protocol.make_client_capabilities(),
      config = {
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "standard",
                autoImportCompletions = true,
              },
            },
          },
        },
        cssls = { init_options = { provideFormatter = false } },
        html = { init_options = { provideFormatter = false } },
        jsonls = {
          on_new_config = function(config)
            if not config.settings.json.schemas then
              config.settings.json.schemas = {}
            end
            vim.list_extend(config.settings.json.schemas, require("schemastore").json.schemas())
          end,
          settings = {
            json = {
              validate = { enable = true },
            },
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              hint = { enable = true, arrayIndex = "Disable" },
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                checkThirdParty = false,
              },
              telemetry = {
                enable = false,
              },
            },
          },
        },
        ruff = {
          on_attach = function(client)
            client.server_capabilities.hoverProvider = false
          end,
        },
        yamlls = {
          on_new_config = function(config)
            config.settings.yaml.schemas =
              vim.tbl_deep_extend("force", config.settings.yaml.schemas or {}, require("schemastore").yaml.schemas())
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
        sqls = {
          on_attach = function(client)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
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
      },
      defaults = { hover = false, signature_help = false },
      formatting = {
        format_on_save = {
          enabled = false,
        },
      },
      mappings = {
        n = {
          grd = { vim.lsp.buf.definition, desc = "Goto Definition", cond = "textDocument/definition" },
          gri = { vim.lsp.buf.implementation, desc = "Goto Implementation", cond = "textDocument/implementation" },
          grr = { vim.lsp.buf.references, desc = "References", cond = "textDocument/references" },
          grt = { vim.lsp.buf.type_definition, desc = "Goto Type Definition", cond = "textDocument/typeDefinition" },
          grD = { vim.lsp.buf.declaration, desc = "Goto Declaration", cond = "textDocument/declaration" },
          grn = { vim.lsp.buf.rename, desc = "Rename", cond = "textDocument/rename" },
          gra = { vim.lsp.buf.code_action, desc = "Code Action", cond = "textDocument/codeAction" },
          ["<leader>f"] = {
            function()
              vim.lsp.buf.format()
            end,
            desc = "Format Buffer",
            cond = "textDocument/formatting",
          },
          grK = {
            function()
              vim.lsp.buf.signature_help()
            end,
            desc = "Signature Help",
            cond = "textDocument/signatureHelp",
          },
          grh = {
            function()
              require("astrolsp.toggles").buffer_inlay_hints()
            end,
            desc = "Toggle Inlay Hints",
            cond = vim.lsp.inlay_hint and "textDocument/inlayHint" or false,
          },
        },
      },
    },
    specs = {
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          handlers = {
            function(server)
              require("astrolsp").lsp_setup(server)
            end,
          },
        },
        config = function(_, opts)
          require("astrolsp.mason-lspconfig").register_servers()
          require("mason-lspconfig").setup(opts)
        end,
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
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
        "phpactor",
        "ruff",
        "solargraph",
        "sqls",
        "taplo",
        "texlab",
        "vtsls",
        "yamlls",
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = require("octopus._icons").hl.Install,
          package_pending = require("octopus._icons").hl.Pending,
          package_uninstalled = require("octopus._icons").hl.Uninstall,
        },
        keymaps = { uninstall_package = "d" },
      },
    },
    keys = { { "<leader>,M", "<cmd>Mason<cr>", desc = "Open Mason" } },
  },
  {
    "AstroNvim/astrolsp",
    opts = function(_, opts)
      opts.capabilities = vim.tbl_deep_extend("force", opts.capabilities, {
        textDocument = {
          foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
          },
        },
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    lazy = true,
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
        markdown = { "markdownlint" },
        php = { "phpactor" },
        python = { "ruff_format" },
        scss = { "prettierd" },
        sh = { "shfmt" },
        sql = { "sql_formatter" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        xml = { "xmllint" },
        yaml = { "prettierd" },
      },
      formatters = {
        sql_formatter = {
          args = { "-c", vim.fn.expand "$HOME" .. "/.sql_formatter.json" },
        },
      },
    },
    specs = {
      {
        "AstroNvim/astrolsp",
        opts = {
          mappings = {
            n = {
              ["<leader>f"] = {
                function()
                  require("conform").format { async = true }
                end,
                desc = "Format Buffer",
              },
            },
          },
        },
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
        markdown = { "markdownlint" },
        sql = { "sqlfluff" },
        yaml = { "yamllint" },
      },
      linters = {
        sqlfluff = {
          args = { "--config", vim.fn.expand "$HOME" .. "/.sqlfluff" },
        },
      },
    },
    config = function(_, opts)
      local lint = require "lint"
      lint.linters_by_ft = opts.linters_by_ft
      lint.linter = opts.linters
      vim.api.nvim_create_autocmd(opts.events, {
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
  {
    "lewis6991/hover.nvim",
    opts = {
      init = function()
        require "hover.providers.lsp"
      end,
      title = false,
    },
    keys = { { "<MouseMove>", '<cmd>lua require("hover").hover_mouse()<cr>', desc = "Hover (mouse)" } },
  },
  {
    "nanotee/sqls.nvim",
    lazy = true,
    keys = { { "<f5>", mode = "x", ":SqlsExecuteQuery<cr>gv", "Execute query" } },
  },
}
