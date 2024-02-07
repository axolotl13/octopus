return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "dnlhc/glance.nvim",
    {
      "williamboman/mason.nvim",
      dependencies = { "williamboman/mason-lspconfig.nvim" },
      opts = {
        ui = {
          icons = { package_installed = "", package_pending = "", package_uninstalled = "ﮊ" },
          keymaps = { uninstall_package = "d" },
        },
      },
      keys = { { "<leader>mm", "<cmd>Mason<cr>", desc = "Mason" } },
    },
  },
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  opts = {
    diagnostics = {
      underline = true,
      update_in_insert = false,
      virtual_text = {
        prefix = "",
      },
      severity_sort = true,
    },
    signs = {
      Error = require("ui.icons").dg.bugf,
      Warn = require("ui.icons").dg.bugf,
      Hint = require("ui.icons").dg.hint,
      Info = require("ui.icons").dg.bugf,
    },
    servers = {
      bashls = {},
      clangd = {},
      cssls = {},
      diagnosticls = {},
      docker_compose_language_service = {},
      dockerls = {},
      ember = {
        filetypes = {
          "handlebars",
        },
      },
      emmet_language_server = {},
      -- eslint = {},
      -- gopls = {},
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
      nginx_language_server = {},
      pyright = {},
      ruby_ls = {},
      rust_analyzer = {},
      sqls = {},
      texlab = {},
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

      keymap("n", "gd", "<cmd>Glance definitions<cr>", bufn)
      keymap("n", "gi", "<cmd>Glance implementations<cr>", bufn)
      keymap("n", "gD", vim.lsp.buf.declaration, bufn)
      keymap("n", "K", vim.lsp.buf.hover, bufn)
      keymap("n", "gt", "<cmd>Glance type_definitions<cr>", bufn)
      keymap("n", "gn", vim.lsp.buf.rename, bufn)
      keymap("n", "gp", vim.lsp.buf.code_action, bufn)
      keymap("n", "gr", "<cmd>Glance references<cr>", bufn)
      keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufn)
      keymap("n", "<leader>wd", vim.lsp.buf.remove_workspace_folder, bufn)
      keymap("n", "<leader>wl", function()
        vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders()), vim.log.levels.INFO)
      end, bufn)
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
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    capabilities = vim.lsp.protocol.make_client_capabilities()
    -- capabilities.offsetEncoding = {"utf-16"} Solución para utf en C++
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

    -- Mason
    local mlsp = require "mason-lspconfig"
    mlsp.setup { ensure_installed = ensure_installed, automatic_installation = true }
  end,
  keys = {
    {
      "gf",
      function()
        vim.diagnostic.open_float()
      end,
      desc = "[Diagnostics] Diagnostico flotante",
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
      "gk",
      function()
        vim.diagnostic.setloclist()
      end,
      desc = "[Diagnostics] Mostrar mensajes de diagnosticos en quickfix",
    },
  },
}
