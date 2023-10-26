return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "williamboman/mason.nvim",
      dependencies = { "williamboman/mason-lspconfig.nvim" },
      opts = {
        ui = {
          border = "rounded",
          icons = {
            package_installed = require("ui.icons").lsp.install,
            package_pending = require("ui.icons").lsp.pending,
            package_uninstalled = require("ui.icons").lsp.uninstall,
          },
          keymaps = {
            install_package = "i",
            update_package = "u",
            uninstall_package = "d",
            cancel_installation = "<C-c>",
          },
        },
      },
      keys = { { "<leader>mm", "<cmd>Mason<cr>", desc = "Mason" } },
    },
    "hrsh7th/cmp-nvim-lsp",
  },
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  opts = {
    diagnostics = {
      underline = true,
      update_in_insert = false,
      virtual_text = {
        prefix = require("ui.icons").global.prefix,
      },
      severity_sort = true,
    },
    signs = {
      Error = require("ui.icons").diagnostics.info,
      Warn = require("ui.icons").diagnostics.info,
      Hint = require("ui.icons").diagnostics.hint,
      Info = require("ui.icons").diagnostics.info,
    },
    servers = {
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
      emmet_language_server = {},
      -- eslint = {},
      gopls = {},
      html = {},
      intelephense = {},
      jdtls = {},
      jsonls = {},
      lemminx = {},
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
              checkThirdParty = false,
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            },
          },
        },
      },
      marksman = {},
      pyright = {},
      rust_analyzer = {},
      sqlls = {},
      tsserver = {},
      yamlls = {},
    },
  },
  config = function(_, opts)
    local on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false

      if client.server_capabilities.documentSymbolProvider then
        require("nvim-navic").attach(client, bufnr)
      end

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
        vim.lsp.buf.format { async = true }
      end, bufn)
      --[[ keymap("x", "<leader>ff", vim.lsp.buf.range_formatting, bufn) ]]
      keymap("n", "gs", vim.lsp.buf.signature_help, bufn)
    end

    -- diagnostics
    for name, icon in pairs(opts.signs) do
      local hl = "DiagnosticSign" .. name
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

    -- servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- capabilities.offsetEncoding = {"utf-16"} Solución para utf en C++
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
    capabilities.textDocument.completion.completionItem = {
      commitCharactersSupport = true,
      deprecatedSupport = true,
      preselectSupport = true,
      snippetSupport = true,
    }

    local ensure_installed = {}
    local servers = opts.servers

    local options = {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    for server, server_opts in pairs(servers) do
      server_opts = vim.tbl_deep_extend("force", {}, options, server_opts or {})
      require("lspconfig")[server].setup(server_opts)
      ensure_installed[#ensure_installed + 1] = server
    end

    local mlsp = require "mason-lspconfig"
    mlsp.setup { ensure_installed = ensure_installed, automatic_installation = true }
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
