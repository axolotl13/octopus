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
        "Ir al archivo actual",
      },
      ["send_to_qf"] = {
        map = "<leader>q",
        cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
        "Enviar todas las líneas a quickfix",
      },
      ["replace_cmd"] = {
        map = "<leader>c",
        cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
        "Reemplazar con comando Vim",
      },
      ["show_option_menu"] = {
        map = "<leader>o",
        cmd = "<cmd>lua require('spectre').show_options()<CR>",
        "Mostrar opciones",
      },
      ["run_current_replace"] = {
        map = "<leader>r",
        cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
        "Reemplazar línea actual",
      },
      ["run_replace"] = {
        map = "<leader>ra",
        cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
        "Reemplazar todas las líneas",
      },
      ["change_view_mode"] = {
        map = "<leader>v",
        cmd = "<cmd>lua require('spectre').change_view()<CR>",
        "Cambia el modo de visualización de los resultados",
      },
      ["change_replace_sed"] = {
        map = "ts",
        cmd = "<cmd>lua require('spectre').change_engine_replace('sed')<CR>",
        "Usar sed para reemplazar",
      },
      ["toggle_live_update"] = {
        map = "tu",
        cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>",
        "update change when vim write file.",
      },
      ["toggle_ignore_case"] = {
        map = "ti",
        cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
        "Alternar ignore case",
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
