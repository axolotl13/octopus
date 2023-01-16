return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  dependencies = {
    { "nvim-lua/plenary.nvim" }
  },
  opts = {
    icons = {
      folder_closed = require("ui.icons").explorer.default,
      folder_open = require("ui.icons").explorer.open
    },
    signs = {
      fold_closed = "",
      fold_open = ""
    },
    file_panel = {
      listing_style = "list",
      win_config = {
        position = "left",
        width = 32
      }
    },
    file_history_panel = {
      log_options = {
        git = {
          single_file = {
            diff_merges = "combined"
          },
          multi_file = {
            diff_merges = "first-parent"
          }
        }
      },
      win_config = {
        position = "bottom", height = 16
      }
    },
    commit_log_panel = {
      win_config = {}
    },
    default_args = {
      DiffviewOpen = {},
      DiffviewFileHistory = {}
    },
    keymaps = {
      disable_defaults = false
    }
  },
  keys = {
    { "<leader>dd", "<cmd>DiffviewOpen<cr>", desc = "[Diffview] Abre Diffview" },
    { "<leader>dq", "<cmd>DiffviewClose<cr>", desc = "[Diffview] Cierra Diffview" },
    { "<leader>dh", "<cmd>DiffviewFileHistory<cr>", desc = "[Diffview] Abre DiffviewFileHistory" },
    { "<leader>dt", "<cmd>DiffviewToggleFiles<cr>", desc = "[Diffview] DiffviewToggleFiles" },
  }
}
