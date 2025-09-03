return {
  {
    "olimorris/codecompanion.nvim",
    cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions", "CodeCompanionToggle" },
    opts = {
      strategies = {
        chat = {
          roles = {
            llm = function(adapter)
              return " CodeCompanion  " .. adapter.formatted_name
            end,
            user = " " .. (vim.env.USER or "User"),
          },
          adapter = "gemini",
        },
        inline = { adapter = "gemini" },
        cmd = { adapter = "gemini" },
      },
      adapters = {
        http = {
          gemini_cli = function()
            return require("codecompanion.adapters").extend("gemini_cli", {
              env = {
                api_key = function()
                  return os.getenv "GEMINI_API_KEY"
                end,
              },
            })
          end,
        },
      },
      display = {
        chat = {
          window = {
            opts = {
              number = false,
              relativenumber = false,
            },
          },
        },
      },
      opts = { language = "Spanish" },
    },
    keys = {
      { mode = { "n", "v" }, "<leader>ic", "<cmd>CodeCompanionChat Toggle<cr>", desc = "CodeCompanionChat" },
      { mode = { "n", "v" }, "<leader>ia", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanionActions" },
      { "<leader>iC", "<cmd>CodeCompanion /commit<cr>", desc = "CodeCompanion /commit" },
      { mode = "v", "<leader>ie", "<cmd>CodeCompanion /explain<cr>", desc = "CodeCompanion /explain" },
      { mode = "v", "<leader>if", "<cmd>CodeCompanion /fix<cr>", desc = "CodeCompanion /fix" },
      { mode = "v", "<leader>il", "<cmd>CodeCompanion /lsp<cr>", desc = "CodeCompanion /lsp" },
      { mode = "v", "ga", "<cmd>CodeCompanion Add<cr>", desc = "CodeCompanion Add" },
    },
    specs = {
      {
        "Saghen/blink.cmp",
        opts = { sources = { per_filetype = { codecompanion = { "codecompanion" } } } },
      },
      {
        "OXY2DEV/markview.nvim",
        ft = { "markdown", "codecompanion" },
        opts = {
          preview = {
            filetypes = { "markdown", "codecompanion" },
            ignore_buftypes = {},
          },
        },
      },
      {
        "HakonHarnes/img-clip.nvim",
        opts = {
          filetypes = {
            codecompanion = {
              prompt_for_file_name = false,
              template = "[Image]($FILE_PATH)",
              use_absolute_path = true,
            },
          },
        },
      },
      {
        "windwp/nvim-autopairs",
        opts = function(_, opts)
          table.insert(opts.disable_filetype, "codecompanion")
        end,
      },
    },
  },
}
