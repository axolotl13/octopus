return {
  "sindrets/diffview.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  opts = {
    icons = {
      folder_closed = "",
      folder_open = "",
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
    -- { "gf", { desc = "Open the file in the previous tabpage" } },
    -- { "[x", { desc = "In the merge-tool: jump to the previous conflict" } },
    -- { "]x", { desc = "In the merge-tool: jump to the next conflict" } },
  },
  keys = {
    { "<leader>df", "<cmd>DiffviewOpen<cr>", desc = "[Diffview] Abrir Diffview" },
    { "<leader>dq", "<cmd>DiffviewClose<cr>", desc = "[Diffview] Cerrar Diffview" },
    { "<leader>dt", "<cmd>DiffviewToggleFiles<cr>", desc = "[Diffview] DiffviewToggleFiles" },
    { "<leader>dh", "<cmd>DiffviewFileHistory<cr>", desc = "[Diffview] Abre DiffviewFileHistory" },
    { "<leader>dd", "<cmd>DiffviewFileHistory %<cr>", desc = "[Diffview] Abre Diffview en el buffer actual" },
  },
}
