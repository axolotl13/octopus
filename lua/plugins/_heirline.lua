return {
  "rebelot/heirline.nvim",
  dependencies = {
    "SmiteshP/nvim-navic",
    opts = {
      icons = require("ui.icons").vscode,
      depth_limit = 5,
    },
  },
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local heirline = require "heirline"
    local conditions = require "heirline.conditions"
    local utils = require "heirline.utils"
    local icons = require "ui.icons"

    local colors = {
      bg = utils.get_highlight("Cursor").fg,
      fg = utils.get_highlight("Cursor").bg,
      statusline = utils.get_highlight("NormalFloat").bg,
      black = utils.get_highlight("CursorColumn").bg,
      comment = utils.get_highlight("Comment").fg,
      orange = utils.get_highlight("Constant").fg,
      red = utils.get_highlight("Error").fg,
      green = utils.get_highlight("String").fg,
      cyan = utils.get_highlight("Keyword").fg,
      Directory = utils.get_highlight("Directory").fg,
      magenta = utils.get_highlight("Identifier").fg,
      error = utils.get_highlight("Error").fg,
      DiffAdd = utils.get_highlight("DiffAdd").bg,
      DiffChange = utils.get_highlight("DiffChange").fg,
      DiffDelete = utils.get_highlight("DiffDelete").fg,
      DiagnosticWarn = utils.get_highlight("DiagnosticWarn").fg,
      DiagnosticInfo = utils.get_highlight("DiagnosticInfo").fg,
      DiagnosticHint = utils.get_highlight("DiagnosticHint").fg,
      GitSignsAdd = utils.get_highlight("GitSignsAdd").fg,
      GitSignsChange = utils.get_highlight("GitSignsChange").fg,
      GitSignsDelete = utils.get_highlight("GitSignsDelete").fg,
    }

    local Space = { provider = " " }
    local Align = { provider = "%=" }

    local Git = {
      condition = conditions.is_git_repo,

      init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
      end,
      hl = {
        fg = colors.DiagnosticWarn,
      },
      Space,
      {
        provider = function(self)
          return icons.git.unmerged2 .. " " .. self.status_dict.head
        end,
        hl = {
          bold = true,
        },
      },
      Space,
      {
        provider = function(self)
          local count = self.status_dict.added or 0
          return count > 0 and (icons.git.add .. " " .. count)
        end,
        hl = {
          fg = colors.GitSignsAdd,
        },
      },
      {
        provider = function(self)
          local count = self.status_dict.removed or 0
          return count > 0 and (" " .. icons.git.deleted .. " " .. count)
        end,
        hl = {
          fg = colors.GitSignsDelete,
        },
      },
      {
        provider = function(self)
          local count = self.status_dict.changed or 0
          return count > 0 and (" " .. icons.git.change .. count)
        end,
        hl = {
          fg = colors.GitSignsChange,
        },
      },
    }

    local FileNameBlock = {
      init = function(self)
        self.filename = vim.api.nvim_buf_get_name(0)
      end,
      Space,
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
        return {
          fg = self.icon_color,
        }
      end,
    }

    local FileName = {
      provider = function(self)
        local filename = vim.fn.fnamemodify(self.filename, ":.")
        if filename == "" then
          return "No Name "
        end
        if not conditions.width_percent_below(#filename, 0.25) then
          filename = vim.fn.expand "%:t"
        end
        return filename .. " "
      end,
      hl = { fg = colors.Directory },
    }

    local FileNameWin = {
      provider = function(self)
        local filename = vim.fn.fnamemodify(self.filename, ":.")
        if filename == "" then
          return "No Name "
        end
        if not conditions.width_percent_below(#filename, 0) then
          filename = vim.fn.expand "%:t"
        end
        local trail = filename:sub(-1) == " › " and "" or " › "
        return filename .. trail
      end,
      -- hl = { bold = false },
    }

    local DirName = {
      provider = function()
        local dirname = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
        local trail = dirname:sub(-1) == " › " and "" or " ›"
        return icons.explorer.default2 .. " " .. dirname .. trail
      end,
      -- hl = { bold = false },
    }

    local FileFlags = {
      {
        condition = function()
          return vim.bo.modified
        end,
        provider = icons.statusline.edit .. " ",
        hl = {
          fg = colors.green,
        },
      },
      {
        condition = function()
          return not vim.bo.modifiable or vim.bo.readonly
        end,
        provider = icons.statusline.readonly .. " ",
        hl = {
          fg = colors.orange,
        },
      },
    }

    local FileNameModifer = {
      hl = function()
        if vim.bo.modified then
          return { fg = colors.green, bold = true, force = true }
        end
      end,
    }

    local FileNameBlockWin = utils.insert(FileNameBlock, FileIcon, FileNameWin)

    FileNameBlock = utils.insert(FileNameBlock, FileIcon, utils.insert(FileNameModifer, FileName), unpack(FileFlags))

    local Diagnostics = {
      condition = conditions.has_diagnostics,

      static = {
        error_icon = vim.fn.sign_getdefined("DiagnosticSignError")[1].text,
        warn_icon = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text,
        info_icon = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text,
        hint_icon = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text,
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
        hl = {
          fg = colors.DiagnosticError,
        },
      },
      {
        provider = function(self)
          return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
        end,
        hl = {
          fg = colors.DiagnosticWarn,
        },
      },
      {
        provider = function(self)
          return self.info > 0 and (self.info_icon .. self.info .. " ")
        end,
        hl = {
          fg = colors.DiagnosticInfo,
        },
      },
      {
        provider = function(self)
          return self.hints > 0 and (self.hint_icon .. self.hints)
        end,
        hl = {
          fg = colors.DiagnosticHint,
        },
      },
    }

    local LSPActive = {
      condition = conditions.lsp_attached,
      update = { "LspAttach", "LspDetach" },
      provider = function()
        local names = {}
        for i, server in pairs(vim.lsp.buf_get_clients(0)) do
          table.insert(names, server.name)
        end
        return icons.global.gear .. " " .. table.concat(names, " ")
      end,
      hl = {
        fg = colors.DiagnosticHint,
        bold = true,
      },
      Space,
    }

    local FileType = {
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

    local Shiftab = {
      {
        provider = function()
          return "SPACE:" .. vim.api.nvim_buf_get_option(0, "shiftwidth")
        end,
        hl = {
          bold = true,
        },
      },
      Space,
    }

    local FileFormat = {
      {
        provider = function()
          return string.upper(vim.bo.fileformat)
        end,
        hl = {
          bold = true,
        },
      },
      Space,
    }

    local FileEncoding = {
      {
        provider = function()
          local enc = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc
          return enc:upper()
        end,
        hl = {
          bold = true,
        },
      },
      Space,
    }

    local FileSize = {
      {
        provider = function()
          local suffix = { "b", "k", "M", "G", "T", "P", "E" }
          local fsize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
          fsize = (fsize < 0 and 0) or fsize
          if fsize < 1024 then
            return fsize .. suffix[1]
          end
          local i = math.floor((math.log(fsize) / math.log(1024)))
          return string.upper(string.format("%.2g%s", fsize / math.pow(1024, i), suffix[i + 1]))
        end,
      },
      Space,
    }

    local Ruler = {
      {
        provider = icons.statusline.line_number .. " %2l/%3L:%2c",
        hl = {
          bold = true,
        },
      },
      Space,
    }

    local ScrollBar = {
      static = {
        sbar = icons.statusline.sbar2,
      },
      provider = function(self)
        local curr_line = vim.api.nvim_win_get_cursor(0)[1]
        local lines = vim.api.nvim_buf_line_count(0)
        local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
        return string.rep(self.sbar[i], 2)
      end,
      hl = {
        fg = colors.comment,
      },
    }

    local TerminalName = {
      provider = function()
        local tname, _ = vim.api.nvim_buf_get_name(0):gsub(".*:", "")
        return icons.vscode.Number .. " " .. tname
      end,
      hl = {
        bold = true,
      },
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
    local Left = { Git, FileNameBlock, FileSize, Diagnostics }

    -- local Center = { Navic }

    local Right = { LSPActive, Shiftab, FileEncoding, FileFormat, Ruler, ScrollBar }

    local statusline = { Left, Align, Right }

    local StatusSpace = {
      {
        provider = " ",
        hl = {
          bg = utils.get_highlight("TabLineSel").bg,
        },
      },
    }

    local DefaultStatusline = {
      -- hl = { bg = colors.bg },
      StatusSpace,
      static = {
        mode_colors = {
          n = colors.green,
          i = colors.error,
          v = colors.cyan,
          V = colors.cyan,
          ["\22"] = colors.cyan,
          c = colors.orange,
          s = colors.magenta,
          S = colors.magenta,
          ["\19"] = colors.magenta,
          R = colors.orange,
          r = colors.orange,
          ["!"] = colors.red,
          t = colors.fg,
        },
        mode_color = function(self)
          local mode = conditions.is_active() and vim.fn.mode() or "n"
          return self.mode_colors[mode]
        end,
      },
      utils.surround({ icons.separator.block, icons.separator.block }, function(self)
        return self:mode_color()
      end, { statusline, hl = { bg = colors.statusline } }),
      StatusSpace,
    }

    local SpecialStatusline = {
      condition = function()
        return conditions.buffer_matches {
          buftype = { "nofile", "prompt", "help", "quickfix" },
          filetype = { "^git.*", "fugitive" },
        }
      end,
      StatusSpace,
      Space,
      FileType,
      Align,
      StatusSpace,
    }

    local TerminalStatusline = {
      condition = function()
        return conditions.buffer_matches { buftype = { "terminal" }, filetype = { "toggleterm" } }
      end,
      hl = {
        bg = colors.black,
      },

      { condition = conditions.is_active },
      FileType,
      Space,
      TerminalName,
      Align,
    }

    local InactiveStatusline = {
      condition = function()
        return not conditions.is_active()
      end,
      Space,
      FileType,
      Align,
    }

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
      DefaultStatusline,
    }

    vim.api.nvim_create_autocmd("User", {
      pattern = "HeirlineInitWinbar",
      callback = function(args)
        local buf = args.buf
        local buftype = vim.tbl_contains({ "prompt", "nofile", "help", "quickfix" }, vim.bo[buf].buftype)
        local filetype = vim.tbl_contains({ "gitcommit", "fugitive" }, vim.bo[buf].filetype)
        if buftype or filetype then
          vim.opt_local.winbar = nil
        end
      end,
    })

    local WinBars = {
      fallthrough = false,
      hl = {
        bg = utils.get_highlight("TabLineSel").bg,
      },
      {
        condition = function()
          return conditions.buffer_matches {
            buftype = { "nofile", "prompt", "help", "quickfix" },
            filetype = { "^git.*", "fugitive", "toggleterm" },
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
        hl = { fg = colors.comment, force = true },
        FileNameBlock,
        Align,
      },
      {
        StatusSpace,
        DirName,
        FileNameBlockWin,
        FileType,
        Navic,
        Align,
      },
    }
    heirline.setup { statusline = Statusline, winbar = WinBars }
  end,
}
