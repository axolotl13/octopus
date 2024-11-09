return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spec = {
        {
          { "<leader>b", group = "Buffer" },
          { "<leader>d", group = "Diffview", icon = { icon = "󰕛 ", color = "green" } },
          { "<leader>e", icon = { icon = "󰉌 ", color = "orange" } },
          { "<leader>g", group = "Git" },
          { "<leader>p", group = "Lazy", icon = { icon = "󰒲 ", color = "cyan" } },
          { "<leader>t", group = "Tabs" },
          { "<leader>,", group = "Misc", icon = { icon = " ", color = "pink" } },
          { "z", group = "fold" },
        },
      },
      plugins = {
        register = false,
        spelling = {
          enabled = false,
        },
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show { global = false }
        end,
        desc = "Buffer local keymaps",
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = {
      signs = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "┃" },
        topdelete = { text = "┃" },
        changedelete = { text = "┃" },
        untracked = { text = "┃" },
      },
      signs_staged = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "┃" },
        topdelete = { text = "┃" },
        changedelete = { text = "┃" },
        untracked = { text = "┃" },
      },
      current_line_blame_opts = {
        ignore_whitespace = true,
      },
      max_file_length = 20000,
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        map("n", "<leader>gg", gs.stage_hunk, "Stage git hunk")
        map("n", "<leader>gu", gs.reset_hunk, "Reset git hunk")
        map("n", "<leader>ga", gs.stage_buffer, "Stage git buffer")
        map("n", "<leader>gq", gs.undo_stage_hunk, "Unstage git hunk")
        map("n", "<leader>gr", gs.reset_buffer, "Reset git buffer")
        map("n", "<leader>g}", gs.next_hunk, "Next git hunk")
        map("n", "<leader>g{", gs.prev_hunk, "Previous git hunk")
        map("n", "<leader>gp", gs.preview_hunk, "Preview git hunk")
        map("n", "<leader>gd", gs.diffthis, "View git diff")
        map("n", "<leader>gt", gs.blame, "View git blame")
        map("n", "<leader>gl", gs.toggle_current_line_blame, "Toggle git blame line")
        map("n", "<leader>gh", gs.toggle_deleted, "Toggle git show deleted")
        map("n", "<leader>gn", gs.toggle_numhl, "Toggle numhl")
      end,
    },
  },
  {
    "tpope/vim-fugitive",
    cmd = "Git",
    keys = { { "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" } },
  },
}
