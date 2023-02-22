return {
  "nvim-pack/nvim-spectre",
  opts = {
    color_devicons = true,
    open_cmd = "vnew",
    live_update = false,
    line_sep_start = "╭─────────────────────────────────────────",
    result_padding = "│  ",
    line_sep = "╰─────────────────────────────────────────",
    highlight = {
      ui = "String",
      search = "DiffChange",
      replace = "DiffDelete",
    },
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
    find_engine = {
      ["rg"] = {
        cmd = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        options = {
          ["ignore-case"] = {
            value = "--ignore-case",
            icon = "⏼",
            "ignore case",
          },
          ["hidden"] = {
            value = "--hidden",
            "hidden file",
            icon = "👁",
          },
        },
      },
    },
    replace_engine = {
      ["sed"] = {
        cmd = "sed",
        args = nil,
        options = {
          ["ignore-case"] = {
            value = "--ignore-case",
            icon = "[I]",
            "ignore case",
          },
        },
      },
    },
    default = {
      find = {
        cmd = "rg",
        options = { "ignore-case" },
      },
      replace = {
        cmd = "sed",
      },
    },
    replace_vim_cmd = "cdo",
    is_open_target_win = true,
    is_insert_mode = false,
  },
  keys = {
    {
      "<leader>fs",
      "<cmd>lua require('spectre').open_file_search()<cr>",
      desc = "[Spectre] Buscar líneas desde el archivo",
    },
    {
      "<leader>fe",
      "<cmd>lua require('spectre').open_visual()<cr>",
      desc = "[Spectre] Buscar palabra en modo visual en todos los archivos",
    },
    {
      "<leader>fw",
      "<cmd>lua require('spectre').open_visual({select_word=true})<cr>",
      desc = "[Spectre] Buscar palabra seleccionada en todos los archivos",
    },
  },
}
