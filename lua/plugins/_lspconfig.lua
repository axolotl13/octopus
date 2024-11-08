return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		dependencies = {
			{
				"AstroNvim/astrolsp",
				opts = {
					features = {
						codelens = true,
						inlay_hints = true,
						semantic_tokens = true,
						signature_help = false,
					},
					autocmds = {
						lsp_document_highlight = {
							cond = "textDocument/documentHighlight",
							{
								event = { "CursorHold", "CursorHoldI" },
								desc = "Document Highlighting",
								callback = function()
									vim.lsp.buf.document_highlight()
								end,
							},
							{
								event = { "CursorMoved", "CursorMovedI", "BufLeave" },
								desc = "Document Highlighting Clear",
								callback = function()
									vim.lsp.buf.clear_references()
								end,
							},
						},
						lsp_codelens_refresh = {
							cond = "textDocument/codeLens",
							{
								event = { "InsertLeave", "BufEnter" },
								desc = "Refresh codelens (buffer)",
								callback = function(args)
									if require("astrolsp").config.features.codelens then
										vim.lsp.codelens.refresh({ bufnr = args.buf })
									end
								end,
							},
						},
						lsp_auto_format = {
							cond = "textDocument/formatting",
							{
								event = "BufWritePre",
								desc = "Autoformat on save",
								callback = function(_, _, bufnr)
									local astrolsp = require("astrolsp")
									local autoformat = assert(astrolsp.config.formatting.format_on_save)
									local buffer_autoformat = vim.b[bufnr].autoformat
									if buffer_autoformat == nil then
										buffer_autoformat = autoformat.enabled
									end
									if buffer_autoformat and ((not autoformat.filter) or autoformat.filter(bufnr)) then
										vim.lsp.buf.format(
											vim.tbl_deep_extend("force", astrolsp.format_opts, { bufnr = bufnr })
										)
									end
								end,
							},
						},
						no_insert_inlay_hints = {
							cond = vim.lsp.inlay_hint and "textDocument/inlayHint" or false,
							{
								event = "InsertEnter",
								desc = "Disable inlay hints on insert",
								callback = function(args)
									local filter = { bufnr = args.buf }
									if vim.lsp.inlay_hint.is_enabled(filter) then
										vim.lsp.inlay_hint.enable(false, filter)
										vim.api.nvim_create_autocmd("InsertLeave", {
											buffer = args.buf,
											once = true,
											callback = function()
												vim.lsp.inlay_hint.enable(true, filter)
											end,
										})
									end
								end,
							},
						},
					},
					capabilities = vim.lsp.protocol.make_client_capabilities(),
					config = {
						lua_ls = {
							settings = {
								Lua = {
									hint = { enable = true, arrayIndex = "Disable" },
									diagnostics = {
										globals = { "vim" },
									},
									workspace = {
										checkThirdParty = false,
									},
									telemetry = {
										enable = false,
									},
								},
							},
						},
					},
					formatting = {
						format_on_save = {
							enabled = false,
						},
					},
					lsp_handlers = {
						["textDocument/hover"] = vim.lsp.with(
							vim.lsp.handlers.hover,
							{ border = "single", silent = true }
						),
						["textDocument/signatureHelp"] = false,
					},
					mappings = {
						n = {
							gd = {
								function()
									vim.lsp.buf.definition()
								end,
								desc = "Goto Definition",
								cond = "textDocument/definition",
							},
							gD = {
								function()
									vim.lsp.buf.declaration()
								end,
								desc = "Goto Declaration",
								cond = "textDocument/declaration",
							},
							gl = {
								function()
									vim.diagnostic.open_float()
								end,
								desc = "Hover Diagnostics",
							},
							gt = {
								function()
									vim.lsp.buf.type_definition()
								end,
								desc = "Type Definition",
							},
							gp = {
								function()
									vim.lsp.buf.code_action()
								end,
								desc = "Code Action",
							},
							gr = {
								function()
									vim.lsp.buf.references()
								end,
								desc = "Goto References",
							},
							gs = {
								function()
									vim.lsp.buf.signature_help()
								end,
								desc = "Signature Help",
							},
							["<leader>f"] = {
								function()
									vim.lsp.buf.format()
								end,
								desc = "Format Buffer",
							},
							gh = {
								function()
									require("astrolsp.toggles").buffer_inlay_hints()
								end,
								desc = "Toggle Inlay Hints",
								cond = vim.lsp.inlay_hint and "textDocument/inlayHint" or false,
							},
						},
					},
				},
				keys = {
					{
						"gf",
						function()
							vim.diagnostic.open_float()
						end,
						desc = "Hover Diagnostic",
					},
					{
						"g{",
						function()
							vim.diagnostic.goto_prev()
						end,
						desc = "Previous Diagnostic",
					},
					{
						"g}",
						function()
							vim.diagnostic.goto_next()
						end,
						desc = "Next Diagnostic",
					},
				},
			},
		},
		config = function()
			local diagnostics = {
				underline = true,
				update_in_insert = false,
				virtual_text = {
					prefix = "",
				},
				severity_sort = true,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = require("octopus._icons").hl.bug,
						[vim.diagnostic.severity.WARN] = require("octopus._icons").hl.bug,
						[vim.diagnostic.severity.HINT] = require("octopus._icons").dg.hint,
						[vim.diagnostic.severity.INFO] = require("octopus._icons").hl.bug,
					},
				},
			}

			if type(diagnostics.signs) ~= "boolean" then
				for name, icon in pairs(diagnostics.signs.text) do
					local hl = "DiagnosticSign" .. name
					vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
				end
			end

			vim.diagnostic.config(vim.deepcopy(diagnostics))
		end,
	},
}