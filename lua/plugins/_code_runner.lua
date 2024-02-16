return {
  "CRAG666/code_runner.nvim",
  cmd = { "RunCode", "RunFile" },
  opts = {
    filetype = {
      tex = function(...)
        local latexCompileOptions = {
          "Single",
          "Project",
        }
        local preview = require "code_runner.hooks.preview_pdf"
        local cr_au = require "code_runner.hooks.autocmd"
        vim.ui.select(latexCompileOptions, {
          prompt = "Select compile mode:",
        }, function(opt, _)
          if opt then
            if opt == "Single" then
              preview.run {
                command = "tectonic",
                args = { "$fileName", "--keep-logs", "-o", "/tmp" },
                preview_cmd = "evince",
                overwrite_output = "/tmp",
              }
            elseif opt == "Project" then
              cr_au.stop_job()
              os.execute "tectonic -X build --keep-logs --open &> /dev/null &"
              local fn = function()
                os.execute "tectonic -X build --keep-logs &> /dev/null &"
              end
              cr_au.create_au_wirte(fn)
            end
          else
            vim.notify("Not Preview", vim.log.levels.INFO)
          end
        end)
      end,
    },
  },
  keys = { { "<f5>", "<cmd>RunCode<cr>", desc = "[Code Runner] Ejecuta el código actual" } },
}
