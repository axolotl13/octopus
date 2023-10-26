return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
  opts = {
    icons = {
      folder_closed = require("ui.icons").explorer.default,
      folder_open = require("ui.icons").explorer.open,
    },
    file_panel = {
      tree_options = {
        folder_statuses = "always",
      },
    },
    file_history_panel = {
      log_options = {
        git = {
          single_file = {
            diff_merges = "combined",
          },
        },
      },
    },
{ "gf", { desc = "Open the file in the previous tabpage" } },
{ "[x", { desc = "In the merge-tool: jump to the previous conflict" } },
{ "]x", { desc = "In the merge-tool: jump to the next conflict" } },
  },
  keys = {
    { "<leader>dd", "<cmd>DiffviewOpen<cr>", desc = "[Diffview] Abre Diffview" },
    { "<leader>db", "<cmd>DiffviewOpen %<cr>", desc = "[Diffview] Abre Diffview en el buffer actual" },
    { "<leader>dq", "<cmd>DiffviewClose<cr>", desc = "[Diffview] Cierra Diffview" },
    { "<leader>dh", "<cmd>DiffviewFileHistory<cr>", desc = "[Diffview] Abre DiffviewFileHistory" },
    { "<leader>dt", "<cmd>DiffviewToggleFiles<cr>", desc = "[Diffview] DiffviewToggleFiles" },
  },
}
