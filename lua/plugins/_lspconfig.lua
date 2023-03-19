return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },
    { "SmiteshP/nvim-navic" },
  },
  event = "BufReadPre",
  config = function()
    local mason = require("mason")

    local diagnostics = function()
      local signs = {
        Error = require("ui.icons").diagnostics.info,
        Warn = require("ui.icons").diagnostics.info,
        Hint = require("ui.icons").diagnostics.hint,
        Info = require("ui.icons").diagnostics.info,
      }

      vim.diagnostic.config({
        virtual_text = { prefix = require("ui.icons").global.prefix },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          focusable = true,
          style = "minimal",
          border = "rounded",
          source = "always",
        },
      })

      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end
    end

    local servers = {
      bashls = {},
      clangd = {},
      cssls = {},
      -- diagnosticls = {},
      dockerls = {},
      docker_compose_language_service = {},
      ember = {
        filetypes = {
          "handlebars",
        },
      },
      emmet_ls = {
        filetypes = {
          "html",
          "css",
          "scss",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "xml",
          "sass",
          "hbs",
          "handlebars",
        },
      },
      gopls = {},
      html = {},
      jdtls = {},
      jsonls = {},
      lemminx = {},
      marksman = {},
      pyright = {},
      rust_analyzer = {},
      sqlls = {},
      lua_ls = {
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            },
          },
        },
      },
      tsserver = {},
      yamlls = {},
    }

    local on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false

      if client.server_capabilities.documentSymbolProvider then
        require("nvim-navic").attach(client, bufnr)
      end

      vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

      local keymap = vim.keymap.set
      local bufn = { noremap = true, silent = true, buffer = bufnr }

      keymap("n", "gd", vim.lsp.buf.definition, bufn)
      keymap("n", "gl", vim.lsp.buf.declaration, bufn)
      keymap("n", "K", vim.lsp.buf.hover, bufn)
      keymap("n", "gu", vim.lsp.buf.type_definition, bufn)
      keymap("n", "gr", vim.lsp.buf.rename, bufn)
      keymap("n", "gp", vim.lsp.buf.code_action, bufn)
      keymap("n", "gl", vim.lsp.buf.references, bufn)
      keymap("n", "<leader>ff", function()
        vim.lsp.buf.format({ async = true })
      end, bufn)
      --[[ keymap("x", "<leader>ff", vim.lsp.buf.range_formatting, bufn) ]]
      keymap("n", "gs", vim.lsp.buf.signature_help, bufn)
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- Solución para utf en C++
    -- capabilities.offsetEncoding = {"utf-16"}
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }

    diagnostics()

    local options = {
      on_attach = on_attach,
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      },
    }

    for server, opts in pairs(servers) do
      opts = vim.tbl_deep_extend("force", {}, options, opts or {})
      -- if server == "tsserver" then
      -- require("typescript").setup({ server = opts })
      -- else
      require("lspconfig")[server].setup(opts)
      -- end
    end
  end,
  keys = {
    {
      "gf",
      function()
        vim.diagnostic.open_float()
      end,
      desc = "[Diagnostics] Ventana Flotante",
    },
    {
      "g{",
      function()
        vim.diagnostic.goto_prev()
      end,
      desc = "[Diagnostics] Ir al anterior diagnostico",
    },
    {
      "g}",
      function()
        vim.diagnostic.goto_next()
      end,
      desc = "[Diagnostics] Ir al siguiente diagnostico",
    },
    {
      "gs",
      function()
        vim.diagnostic.setloclist()
      end,
      desc = "[Diagnostics] Mostrar los diagnosticos en una ventana",
    },
  },
}
