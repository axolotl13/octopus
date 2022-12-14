return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp" }
  },
  event = "BufReadPre",
  config = function()
    local mason = require("mason")
    local icons = require("ui.icons")

    local diagnostics = function()

      local signs = {
        Error = icons.diagnostics.info,
        Warn = icons.diagnostics.info,
        Hint = icons.diagnostics.hint,
        Info = icons.diagnostics.info,
      }

      vim.diagnostic.config({
        virtual_text = { prefix = icons.global.prefix },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          focusable = true,
          style = "minimal",
          border = "rounded",
          source = "always"
        }
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
      dockerls = {},
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
      sqls = {},
      sumneko_lua = {
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
      tsserver = {},
      yamlls = {},
    }


    local on_attach = function(client, bufnr)
      require("nvim-navic").attach(client, bufnr)
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
      keymap("n", "<leader>ff", vim.lsp.buf.formatting_sync, bufn)
      keymap("x", "<leader>ff", vim.lsp.buf.range_formatting, bufn)
      keymap("n", "gs", vim.lsp.buf.signature_help, bufn)

    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
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
    { "gf", function() vim.diagnostic.open_float() end, desc = "[Diagnostics] Ventana Flotante" },
    { "g{", function() vim.diagnostic.goto_prev() end, desc = "[Diagnostics] Ir al anterior diagnostico" },
    { "g}", function() vim.diagnostic.goto_next() end, desc = "[Diagnostics] Ir al siguiente diagnostico" },
    { "gs", function() vim.diagnostic.setloclist() end, desc = "[Diagnostics] Mostrar los diagnosticos en una ventana" }
  }
}
