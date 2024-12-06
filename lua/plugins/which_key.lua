return {
	-- plugin for command hints
	{
		"folke/which-key.nvim",
		config = function()
			local whichkey = require("which-key")

			whichkey.setup()
			whichkey.register({
				["<leader>"] = {
					b = {
						name = "Buffer",
						a = { ":%bdelete!<cr>", "Delete all buffers" },
						d = { ":bdelete!<cr>", "Delete buffer" },
						l = { ":b #<cr>", "Open last buffer" },
						n = { ":bnext<cr>", "Open next buffer" },
						p = { ":bprevious<cr>", "Open previous buffer" },
					},
					e = {
						name = "Explorer",
						t = { ":Explore<cr>", "File explorer" },
					},
					f = {
						name = "Telescope",
						b = { ":Telescope buffers<cr>", "List Buffers" },
						["cc"] = { ":Telescope conventional_commits<cr>", "Conventional commits" },
						d = {
							name = "Diagnostics",
							["d"] = { ":Telescope diagnostics bufnr=0<cr>", "LSP document diagnostics" },
							["w"] = { ":Telescope diagnostics<cr>", "LSP workspace diagnostics" },
						},
						f = { ":Telescope find_files<cr>", "Find file" },
						g = {
							name = "Grep",
							b = { ":Telescope current_buffer_fuzzy_find<cr>", "Buffer fuzzy find" },
							l = { ":Telescope live_grep<cr>", "Live grep string" },
							s = { ":Telescope grep_string<cr>", "Grep cursor string" },
						},
						l = {
							name = "LSP",
							d = { ":Telescope lsp_definitions<cr>", "LSP definitions" },
							["ds"] = { ":Telescope lsp_document_symbols<cr>", "LSP document symbols" },
							i = { ":Telescope lsp_implementations<cr>", "LSP implementations" },
							r = { ":Telescope lsp_references<cr>", "LSP references" },
							t = { ":Telescope lsp_type_definitions<cr>", "LSP type definitions" },
							["ws"] = { ":Telescope lsp_workspace_symbols<cr>", "LSP workspace symbols" },
						},
						m = { ":Telescope marks<cr>", "Marks" },
						r = { ":Telescope resume<cr>", "Resume search" },
					},
					g = {
						name = "Git",
						b = { ":Telescope git_branches<cr>", "Git branches" },
						c = { ":Telescope git_commits<cr>", "Git commits" },
						j = { ":Gitsigns next_hunk<cr>", "Next hunk" },
						k = { ":Gitsigns prev_hunk<cr>", "Previous hunk" },
						s = { ":Telescope git_stash<cr>", "Git stash" },
						t = { ":Telescope git_status<cr>", "Git status" },
					},
					l = {
						name = "LSP",
						a = { ":lua vim.lsp.buf.code_action()<cr>", "Code Actions" },
						d = { ":lua vim.lsp.buf.definition()<cr>", "Go to definintion" },
						f = { ":lua vim.lsp.buf.format()<cr>", "Format file" },
						h = { ":lua vim.lsp.buf.hover()<cr>", "Hover" },
						i = { ":lua vim.lsp.buf.implementation()<cr>", "Go to implementation" },
						I = { ":LspInfo<cr>", "LSP Info" },
						o = { ":OrganizeImports<cr>", "Organize imports" },
						r = { ":lua vim.lsp.buf.rename()<cr>", "Rename" },
						R = { ":LspRestart<cr>", "Restart" },
						s = {
							":lua vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())<cr>",
							"Toggle inlay hints",
						},
						S = { ":LspStart<cr>", "Start" },
					},
					t = {
						name = "Trouble",
						d = { ":Trouble diagnostics toggle filter.buf=0<cr>", "Document diagnostics" },
						n = { ":lua vim.diagnostic.goto_next()<cr>", "Next diagnostic" },
						p = { ":lua vim.diagnostic.goto_prev()<cr>", "Previous diagnostic" },
						w = { ":Trouble diagnostics toggle<cr>", "Workspace diagnostics" },
					},
					w = { ':lua require("nvim-window").pick()<cr>', "Pick window" },
				},
			})
		end,
	},
}
