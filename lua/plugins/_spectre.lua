return {
  "nvim-pack/nvim-spectre",
  opts = {
    mapping = {
      ["toggle_line"] = {
        map = "dd",
        cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
        "No hacer cambios en línea actual",
      },
      ["enter_file"] = {
        map = "<cr>",
        cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
        "Abrir archivo",
      },
      ["run_current_replace"] = {
        map = "<leader>rc",
        cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
        "Reemplazar línea actual",
      },
      ["run_replace"] = {
        map = "<leader>ra",
        cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
        "Reemplazar todas las líneas",
      },
      ["toggle_ignore_hidden"] = {
        map = "th",
        cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>",
        "Alternar busqueda oculta",
      },
    },
  },
  keys = {
    {
      "<leader>fs",
      "<cmd>lua require('spectre').toggle()<cr>",
      desc = "[Spectre] Buscar palabra",
    },
    {
      "<leader>fw",
      "<cmd>lua require('spectre').open_file_search({select_word=true})<cr>",
      desc = "[Spectre] Buscar palabra seleccionada en el archivo actual",
    },
    {
      "<leader>fv",
      "<cmd>lua require('spectre').open_visual({select_word=true})<cr>",
      desc = "[Spectre] Buscar palabra seleccionada en todos los archivos",
    },
  },
}
