return {
  "rebelot/heirline.nvim",
  dependencies = { "SmiteshP/nvim-navic", lazy = "true", opts = { icons = require("ui.icons").vs } },
  event = { "BufReadPost", "BufNewFile" },
  opts = function()
    local heirline = require "heirline"
    local conditions = require "heirline.conditions"
    local utils = require "heirline.utils"
    local icons = require "ui.icons"

    local colors = {
      none = utils.get_highlight("Normal").bg,
      statusline = utils.get_highlight("StatusLine").bg,
      statuslinenc = utils.get_highlight("VertSplit").fg,
      red = utils.get_highlight("diffRemoved").fg,
      green = utils.get_highlight("diffAdded").fg,
      cyan = utils.get_highlight("Keyword").fg,
      orange = utils.get_highlight("Constant").fg,
      purple = utils.get_highlight("Constant").fg,
      directory = utils.get_highlight("Directory").fg,
      git_change = utils.get_highlight("diffChanged").fg,
      type = utils.get_highlight("Type").fg,
      comment = utils.get_highlight("Comment").fg,
      diagnosticerror = utils.get_highlight("DiagnosticError").fg,
      diagnosticwarn = utils.get_highlight("DiagnosticWarn").fg,
      diagnosticinfo = utils.get_highlight("DiagnosticInfo").fg,
      diagnostichint = utils.get_highlight("DiagnosticHint").fg,
    }

    local Align = { provider = "%=" }
    local Space = { provider = " " }

    local mode_colors = {
      n = colors.red,
      i = colors.green,
      v = colors.cyan,
      V = colors.cyan,
      ["\22"] = colors.cyan,
      c = colors.orange,
      s = colors.purple,
      S = colors.purple,
      ["\19"] = colors.purple,
      R = colors.orange,
      r = colors.orange,
      ["!"] = colors.red,
      t = colors.red,
    }

    local ViMode = {
      init = function(self)
        self.mode = vim.fn.mode(1)
      end,
      static = {
        mode_names = {
          n = "NO",
          no = "OP",
          nov = "OC",
          noV = "OL",
          ["no\22"] = "OB",
          niI = "IN",
          niR = "RE",
          niV = "RV",
          nt = "NT",
          v = "VI",
          vs = "VI",
          V = "VL",
          Vs = "VL",
          ["\22"] = "VB",
          ["\22s"] = "VB",
          s = "SE",
          S = "SL",
          ["\19"] = "SB",
          i = "IN",
          ic = "IC",
          ix = "IX",
          R = "RE",
          Rc = "RC",
          Rx = "RX",
          Rv = "RV",
          Rvc = "RC",
          Rvx = "RX",
          c = "CO",
          cv = "CV",
          r = "PR",
          rm = "PM",
          ["r?"] = "P?",
          ["!"] = "SH",
          t = "TE",
        },
      },
      provider = function(self)
        return self.mode_names[self.mode] .. " "
      end,
      hl = function(self)
        local mode = self.mode:sub(1, 1)
        return { fg = colors.statusline, bg = mode_colors[mode], bold = true }
      end,
      update = {
        "ModeChanged",
        pattern = "*:*",
        callback = vim.schedule_wrap(function()
          vim.cmd "redrawstatus"
        end),
      },
    }

    local Gitter = {
      condition = conditions.is_git_repo,
      init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
      end,
      hl = { fg = colors.orange, bg = colors.statusline },
      {
        provider = function(self)
          return icons.st.unmerged .. self.status_dict.head
        end,
        hl = { bold = true },
      },
    }

    local FileNameBlock = {
      init = function(self)
        self.filename = vim.api.nvim_buf_get_name(0)
      end,
    }

    local FileIcon = {
      init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ":e")
        self.icon, self.icon_color =
          require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
      end,
      provider = function(self)
        return self.icon and (self.icon .. " ")
      end,
      hl = function(self)
        return { fg = self.icon_color }
      end,
    }

    local FileName = {
      provider = function(self)
        local filename = vim.fn.fnamemodify(self.filename, ":.")
        if filename == "" then
          return "[No Name]"
        end
        if not conditions.width_percent_below(#filename, 0.25) then
          filename = vim.fn.pathshorten(filename)
        end
        return filename
      end,
      hl = { fg = colors.directory },
    }

    local FileFlags = {
      {
        condition = function()
          return vim.bo.modified
        end,
        provider = icons.st.edit,
        hl = { fg = colors.green },
      },
      {
        condition = function()
          return not vim.bo.modifiable or vim.bo.readonly
        end,
        provider = icons.st.readonly,
        hl = { fg = colors.orange },
      },
    }

    local FileNameModifer = {
      hl = function()
        if vim.bo.modified then
          return { fg = colors.cyan, bold = true, force = true }
        end
      end,
    }

    FileNameBlock = {
      utils.insert(FileNameBlock, FileIcon, utils.insert(FileNameModifer, FileName), FileFlags, { provider = "%<" }),
    }

    local Git = {
      condition = conditions.is_git_repo,
      init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
      end,
      {
        provider = function(self)
          local count = self.status_dict.added or 0
          return count > 0 and (icons.st.add .. count)
        end,
        hl = { fg = colors.green },
      },
      {
        provider = function(self)
          local count = self.status_dict.removed or 0
          return count > 0 and (icons.st.deleted .. count)
        end,
        hl = { fg = colors.red },
      },
      {
        provider = function(self)
          local count = self.status_dict.changed or 0
          return count > 0 and (icons.st.change .. count)
        end,
        hl = { fg = colors.git_change },
      },
      {
        condition = function(self)
          return self.has_changes
        end,
        provider = " ",
      },
    }

    local FileSize = {
      provider = function()
        local suffix = { "b", "k", "M", "G", "T", "P", "E" }
        local fsize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
        fsize = (fsize < 0 and 0) or fsize
        if fsize < 1024 then
          return fsize .. suffix[1]
        end
        local i = math.floor((math.log(fsize) / math.log(1024)))
        return string.format("%.2g%s", fsize / math.pow(1024, i), suffix[i + 1])
      end,
    }

    local Actived_Venv = function()
      local venv_name = require("venv-selector").get_active_venv()
      if venv_name ~= nil then
        local venv = string.gsub(venv_name, ".*/pypoetry/virtualenvs/", "(poetry) ")
        return venv:match ".*/([^/]+)$"
      else
        return "venv"
      end
    end

    local Venv = {
      condition = function()
        if vim.bo.filetype == "python" then
          return require("venv-selector").get_active_venv()
        end
      end,
      {
        provider = function()
          return icons.vs.Package .. Actived_Venv()
        end,
      },
      on_click = {
        callback = function()
          vim.cmd.VenvSelect()
        end,
        name = "venv_selector",
      },
      hl = {
        fg = colors.green,
        bold = true,
      },
      Space,
    }

    local Left = { ViMode, Gitter, Space, FileNameBlock, Git, FileSize, Space, Venv }

    local Diagnostics = {
      condition = conditions.has_diagnostics,
      static = {
        error_icon = icons.dg.bugf .. " ",
        warn_icon = icons.dg.warningf .. " ",
        info_icon = icons.dg.infof .. " ",
        hint_icon = icons.dg.hint .. " ",
      },
      init = function(self)
        self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
        self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
      end,

      update = { "DiagnosticChanged", "BufEnter" },

      {
        provider = function(self)
          return self.errors > 0 and (self.error_icon .. self.errors .. " ")
        end,
        hl = { fg = colors.diagnosticerror },
      },
      {
        provider = function(self)
          return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
        end,
        hl = { fg = colors.diagnosticwarn },
      },
      {
        provider = function(self)
          return self.info > 0 and (self.info_icon .. self.info .. " ")
        end,
        hl = { fg = colors.diagnosticinfo },
      },
      {
        provider = function(self)
          return self.hints > 0 and (self.hint_icon .. self.hints)
        end,
        hl = { fg = colors.diagnostichint },
      },
    }

    local LSPActive = {
      condition = conditions.lsp_attached,
      update = { "LspAttach", "LspDetach" },
      provider = function()
        local names = {}
        for _, server in pairs(vim.lsp.get_active_clients { bufnr = 0 }) do
          if server.name ~= "null-ls" then
            table.insert(names, server.name)
          else
            local sources = require("null-ls.sources").get_available(vim.bo.filetype)

            local null_ls_sources = {}
            for _, source in ipairs(sources) do
              local null_ls_name = source.name
              null_ls_sources[null_ls_name] = true
            end

            vim.list_extend(names, vim.tbl_keys(null_ls_sources))
          end
        end
        return icons.st.gear .. table.concat(names, ", ")
      end,
      hl = { fg = colors.green, bold = true },
      Space,
      on_click = {
        callback = function()
          vim.defer_fn(function()
            vim.cmd "LspInfo"
          end, 100)
        end,
        name = "heirline_LSP",
      },
    }

    local Shiftab = {
      provider = function()
        return "Spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
      end,
      -- hl = { bold = true },
    }

    local FileEncoding = {
      provider = function()
        local enc = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc
        return enc:upper()
      end,
      -- hl = { bold = true },
    }

    local FileFormat = {
      provider = function()
        local fmt = vim.bo.fileformat
        if fmt ~= "" then
          local symbols = {
            unix = icons.os.linux,
            dos = icons.os.windows,
            mac = icons.os.macos,
          }
          return symbols[fmt] .. " " .. fmt:upper()
        end
      end,
      -- hl = { bold = true },
    }

    local Ruler = {
      provider = "Ln %l/%L, Col %2c",
      -- hl = { bold = true },
    }

    local ScrollBar = {
      static = {
        sbar = icons.st.sbar,
      },
      provider = function(self)
        local curr_line = vim.api.nvim_win_get_cursor(0)[1]
        local lines = vim.api.nvim_buf_line_count(0)
        local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
        return string.rep(self.sbar[i], 2)
      end,
      hl = { fg = colors.statusline, bg = colors.statuslinenc },
    }

    local RightPart = { Ruler, Space, Shiftab, Space, FileEncoding, Space, FileFormat, Space, ScrollBar }

    RightPart = {
      utils.surround({ icons.sp.left_fill, "" }, colors.statusline, RightPart),
    }

    local Right = { Diagnostics, Space, LSPActive, RightPart }

    local Line = { Left, Align, Right }

    local FileType = {
      provider = function()
        return string.upper(vim.bo.filetype)
      end,
      hl = { fg = colors.type, bold = true },
    }

    local TerminalName = {
      provider = function()
        local tname, _ = vim.api.nvim_buf_get_name(0):gsub(".*:", "")
        return icons.st.terminal .. tname
      end,
      hl = { fg = colors.blue, bold = true },
    }

    local HelpFileName = {
      condition = function()
        return vim.bo.filetype == "help"
      end,
      provider = function()
        local filename = vim.api.nvim_buf_get_name(0)
        return vim.fn.fnamemodify(filename, ":t")
      end,
      hl = { fg = colors.blue },
    }

    local SpecialStatusline = {
      condition = function()
        return conditions.buffer_matches {
          buftype = { "nofile", "prompt", "help", "quickfix" },
          filetype = { "^git.*", "fugitive" },
        }
      end,

      Space,
      FileType,
      Space,
      HelpFileName,
      Align,
    }

    local TerminalStatusline = {
      condition = function()
        return conditions.buffer_matches { buftype = { "terminal" } }
      end,
      hl = { bg = colors.bg },

      { condition = conditions.is_active },
      Space,
      FileType,
      TerminalName,
      Align,
    }

    local InactiveStatusline = {
      condition = conditions.is_not_active,
      Space,
      FileType,
      Space,
      FileName,
      Align,
    }

    local ViStatusLine = {
      static = {
        mode_color = function(self)
          local mode = conditions.is_active() and vim.fn.mode() or "n"
          return mode_colors[mode]
        end,
      },
      utils.surround({ icons.sp.block, icons.sp.block }, function(self)
        return self:mode_color()
      end, { Line, hl = { bg = colors.statusline } }),
    }

    ViStatusLine = { utils.surround({ icons.sp.block, icons.sp.block }, colors.none, ViStatusLine) }

    local Statusline = {
      hl = function()
        if conditions.is_active() then
          return "StatusLine"
        else
          return "StatusLineNC"
        end
      end,

      fallthrough = false,

      SpecialStatusline,
      TerminalStatusline,
      InactiveStatusline,
      ViStatusLine,
    }

    local Navic = {
      condition = function()
        return require("nvim-navic").is_available()
      end,
      static = {
        type_hl = {
          File = "Directory",
          Module = "@include",
          Namespace = "@namespace",
          Package = "@include",
          Class = "@structure",
          Method = "@method",
          Property = "@property",
          Field = "@field",
          Constructor = "@constructor",
          Enum = "@field",
          Interface = "@type",
          Function = "@function",
          Variable = "@variable",
          Constant = "@constant",
          String = "@string",
          Number = "@number",
          Boolean = "@boolean",
          Array = "@field",
          Object = "@type",
          Key = "@keyword",
          Null = "@comment",
          EnumMember = "@field",
          Struct = "@structure",
          Event = "@keyword",
          Operator = "@operator",
          TypeParameter = "@type",
        },
        enc = function(line, col, winnr)
          return bit.bor(bit.lshift(line, 16), bit.lshift(col, 6), winnr)
        end,
        dec = function(c)
          local line = bit.rshift(c, 16)
          local col = bit.band(bit.rshift(c, 6), 1023)
          local winnr = bit.band(c, 63)
          return line, col, winnr
        end,
      },
      init = function(self)
        local data = require("nvim-navic").get_data() or {}
        local children = {}
        for i, d in ipairs(data) do
          local pos = self.enc(d.scope.start.line, d.scope.start.character, self.winnr)
          local child = {
            {
              provider = d.icon,
              hl = self.type_hl[d.type],
            },
            {
              provider = d.name:gsub("%%", "%%%%"):gsub("%s*->%s*", ""),
              -- hl = self.type_hl[d.type],

              on_click = {
                minwid = pos,
                callback = function(_, minwid)
                  local line, col, winnr = self.dec(minwid)
                  vim.api.nvim_win_set_cursor(vim.fn.win_getid(winnr), { line, col })
                end,
                name = "heirline_navic",
              },
            },
          }
          if #data > 1 and i < #data then
            table.insert(child, {
              provider = " › ",
              hl = { fg = "gray" },
            })
          end
          table.insert(children, child)
        end
        self.child = self:new(children, 1)
      end,
      provider = function(self)
        return self.child:eval()
      end,
      hl = { fg = colors.fg },
      update = "CursorMoved",
    }

    local DirName = {
      provider = function()
        local dirname = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
        local trail = dirname:sub(-1) == " › " and "" or " › "
        return icons.fl.default .. " " .. dirname .. trail
      end,
      hl = { bold = true },
    }

    local WinFileName = {
      provider = function(self)
        local filename = self.filename
        filename = filename == "" and "[No Name]" or vim.fn.fnamemodify(filename, ":t")
        local trail = filename:sub(-1) == " › " and "" or " › "
        return filename .. trail
      end,
    }

    local WinFileNameBlock = {
      init = function(self)
        self.filename = vim.api.nvim_buf_get_name(0)
      end,
      FileIcon,
      WinFileName,
    }

    local WinFileType = {
      provider = function()
        local filetype = vim.bo.filetype
        filetype = filetype:gsub("^%l", string.upper)
        local trail = filetype:sub(-1) == " › " and "" or " › "
        return filetype .. trail
      end,
      hl = {
        bold = true,
      },
    }

    local FileLastModified = {
      provider = function()
        local ftime = vim.fn.getftime(vim.api.nvim_buf_get_name(0))
        return (ftime > 0) and os.date("%c", ftime)
      end,
    }

    local WinBars = {
      fallthrough = false,
      {
        condition = function()
          return conditions.buffer_matches {
            buftype = { "nofile", "prompt", "help", "quickfix", "terminal" },
            filetype = { "^git.*", "fugitive" },
          }
        end,
        init = function()
          vim.opt_local.winbar = nil
        end,
      },
      {
        condition = function()
          return not conditions.is_active()
        end,
        utils.surround(
          { icons.sp.block, icons.sp.block },
          colors.none,
          { hl = { fg = colors.comment, force = true }, FileLastModified }
        ),
      },
      utils.surround({ icons.sp.block, icons.sp.block }, colors.none, {
        {
          DirName,
          WinFileNameBlock,
          WinFileType,
          Navic,
          Align,
        },
      }),

      hl = { bg = colors.none },
    }

    local Folder = {
      static = {
        click_args = function(self, minwid, clicks, button, mods)
          local args = {
            minwid = minwid,
            clicks = clicks,
            button = button,
            mods = mods,
            mousepos = vim.fn.getmousepos(),
          }
          local sign = vim.fn.screenstring(args.mousepos.screenrow, args.mousepos.screencol)
          if sign == " " then
            sign = vim.fn.screenstring(args.mousepos.screenrow, args.mousepos.screencol - 1)
          end
          args.sign = self.signs[sign]
          vim.api.nvim_set_current_win(args.mousepos.winid)
          vim.api.nvim_win_set_cursor(0, { args.mousepos.line, 0 })

          return args
        end,
        handlers = {
          Fold = function(args)
            local line = args.mousepos.line
            if vim.fn.foldlevel(line) <= vim.fn.foldlevel(line - 1) then
              return
            end
            vim.cmd.execute("'" .. line .. "fold" .. (vim.fn.foldclosed(line) == -1 and "close" or "open") .. "'")
          end,
        },
      },
      init = function(self)
        self.signs = {}
      end,
      {
        init = function(self)
          self.can_fold = vim.fn.foldlevel(vim.v.lnum) > vim.fn.foldlevel(vim.v.lnum - 1)
        end,
        {
          condition = function(self)
            return vim.v.virtnum == 0 and self.can_fold
          end,
          provider = "%C",
        },
        {
          condition = function(self)
            return not self.can_fold
          end,
          Space,
        },
        on_click = {
          name = "sc_fold_click",
          callback = function(self, ...)
            self.handlers.Fold(self.click_args(self, ...))
          end,
        },
      },
    }

    local SignColumn = {
      condition = function()
        return vim.opt.signcolumn:get() ~= "no"
      end,
      provider = "%s",
    }

    local LineNumber = {
      condition = function()
        return vim.v.virtnum == 0
      end,
      init = function(self)
        local lines = vim.api.nvim_buf_line_count(0)
        self.padding = tostring(lines):len()
      end,
      provider = function(self)
        if vim.v.relnum == 0 then
          return string.format("%-" .. self.padding .. "d", vim.v.lnum)
        else
          return string.format("%" .. self.padding .. "d", vim.v.relnum)
        end
      end,
    }

    local StatusColumn = {
      {
        condition = function()
          return conditions.buffer_matches {
            buftype = { "nofile", "prompt", "help", "quickfix", "terminal" },
          }
        end,
        init = function()
          vim.opt_local.statuscolumn = nil
        end,
      },
      { SignColumn, LineNumber, Folder },
    }

    heirline.setup { statusline = Statusline, winbar = WinBars, statuscolumn = StatusColumn }
  end,
}
