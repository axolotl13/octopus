local M = {}

M.opts = {
  color_devicons = true,
  open_cmd = "vnew",
  live_update = false,
  line_sep_start = "╭─────────────────────────────────────────",
  result_padding = "│  ",
  line_sep = "╰─────────────────────────────────────────",
  highlight = {
    ui = "String",
    search = "DiffChange",
    replace = "DiffDelete"
  },
  mapping = {
    ["toggle_line"] = {
      map = "dd",
      cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
      desc = "No hacer cambios en línea actual"
    },
    ["enter_file"] = {
      map = "<cr>",
      cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
      desc = "Ir al archivo actual"
    },
    ["send_to_qf"] = {
      map = "<leader>q",
      cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
      desc = "Enviar todas las líneas a quickfix"
    },
    ["replace_cmd"] = {
      map = "<leader>c",
      cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
      desc = "Reemplazar con comando Vim"
    },
    ["show_option_menu"] = {
      map = "<leader>o",
      cmd = "<cmd>lua require('spectre').show_options()<CR>",
      desc = "Mostrar opciones"
    },
    ["run_current_replace"] = {
      map = "<leader>r",
      cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
      desc = "Reemplazar línea actual"
    },
    ["run_replace"] = {
      map = "<leader>ra",
      cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
      desc = "Reemplazar todas las líneas"
    },
    ["change_view_mode"] = {
      map = "<leader>v",
      cmd = "<cmd>lua require('spectre').change_view()<CR>",
      desc = "Cambia el modo de visualización de los resultados"
    },
    ["change_replace_sed"] = {
      map = "ts",
      cmd = "<cmd>lua require('spectre').change_engine_replace('sed')<CR>",
      desc = "Usar sed para reemplazar"
    },
    ["toggle_live_update"] = {
      map = "tu",
      cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>",
      desc = "update change when vim write file."
    },
    ["toggle_ignore_case"] = {
      map = "ti",
      cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
      desc = "Alternar ignore case"
    },
    ["toggle_ignore_hidden"] = {
      map = "th",
      cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>",
      desc = "Alternar busqueda oculta"
    },
  },
  find_engine = {
    ["rg"] = {
      cmd = "rg",
      args = {
        '--color=never', 
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column'
      },
      options = {
        ['ignore-case'] = {
          value = "--ignore-case",
          icon = "⏼",
          desc = "ignore case"
        },
        ['hidden'] = {
          value = "--hidden",
          desc = "hidden file",
          icon = "👁"
        }
      }
    },
  },
  replace_engine = {
    ["sed"] = {
      cmd = "sed",
      args = nil,
      options = {
        ['ignore-case'] = {
          value = "--ignore-case",
          icon = "[I]",
          desc = "ignore case"}
      }
    },
  },
  default = {
    find = {
      cmd = "rg",
      options = { "ignore-case" }
    },
    replace = {
      cmd = "sed"
    }
  },
  replace_vim_cmd = "cdo",
  is_open_target_win = true,
  is_insert_mode = false, 
}

M.maps = {
  { mode = {"n"}, lhs = "<leader>sw", rhs = "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", options = {silent = true}, desc = "Buscar palabra seleccionada en todos los archivos" },
  { mode = {"n"}, lhs = "<leader>se", rhs = "<cmd>lua require('spectre').open_visual()<cr>", options = {silent = true}, desc = "Buscar palabra en modo visual en todos los archivos" },
  { mode = {"n"}, lhs = "<leader>ss", rhs = "<cmd>lua require('spectre').open_file_search()<cr>", options = {silent = true}, desc = "Buscar líneas desde el archivo" }
}

M.start = function()
  
  local ok,spectre = pcall(require, "spectre")
  if not ok then return end

  local ok_keybinds, keybinds = pcall(require, "core.functions")
  if not ok_keybinds then return end

  spectre.setup(M.opts)

  keybinds.load_keybinds(M.maps)

end

return M
