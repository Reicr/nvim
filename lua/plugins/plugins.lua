return {
	-- color scheme
	{
		"Mofiqul/dracula.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme dracula]])
		end,
	},
	-- plugin for auto completion
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local nvimcmp = require("cmp")

			nvimcmp.setup({
				formatting = {
					format = function(entry, vim_item)
						-- Source
						vim_item.menu = ({
							nvim_lsp = "[LSP]",
							nvim_lsp_document_symbol = "[LSPDS]",
							nvim_lsp_signature_help = "[LSPSH]",
							treesitter = "[TS]",
							nvim_lua = "[LUA]",
							path = "[Path]",
							buffer = "[BU]",
						})[entry.source.name]
						return vim_item
					end,
				},
				mapping = {
					["<C-d>"] = nvimcmp.mapping.scroll_docs(4),
					["<C-u>"] = nvimcmp.mapping.scroll_docs(-4),
					["<C-n>"] = nvimcmp.mapping.select_next_item(),
					["<C-p>"] = nvimcmp.mapping.select_prev_item(),
					["<C-q>"] = nvimcmp.mapping.abort(),
					["<C-c>"] = nvimcmp.mapping.complete(),
					-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<CR>"] = nvimcmp.mapping.confirm({ select = false }),
				},
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				sources = {
					{ name = "nvim_lua" },
					{ name = "nvim_lsp" },
					-- { name = 'nvim_lsp_document_symbol' },
					-- { name = 'nvim_lsp_signature_help' },
					{ name = "path" },
					--{ name = 'treesitter' },
					{ name = "buffer" },
				},
			})
		end,
	},
	-- sources for nvim cmp
	-- use 'hrsh7th/cmp-buffer'
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lsp-document-symbol",
	"hrsh7th/cmp-nvim-lsp-signature-help",
	"hrsh7th/cmp-path",
	"L3MON4D3/LuaSnip",
	"ray-x/cmp-treesitter",
	"saadparwaiz1/cmp_luasnip",
	-- plugin for syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local cfg = require("nvim-treesitter.configs")

			cfg.setup({
				ensure_installed = {
					"css",
					"graphql",
					"html",
					"javascript",
					"json",
					"lua",
					"markdown",
					"markdown_inline",
					"python",
					"rust",
					"scss",
					"svelte",
					"tsx",
					"typescript",
					"vim",
					"vimdoc",
					"vue",
					"yaml",
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = true,
				},
			})
		end,
	},
	-- plugin file fuzzy finding
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" } },
		config = function()
			local actions = require("telescope.actions")
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = {
						"build[\\/]",
						"%.git[\\/]",
						"%.next[\\/]",
						"node_modules",
					},
				},
				pickers = {
					buffers = {
						mappings = {
							i = {
								["<C-s>"] = actions.delete_buffer + actions.move_to_top,
							},
						},
					},
				},
			})
		end,
	},
	-- plugin that adds an improved fuzzy finder
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	-- plugin adds telescope integration for conventional commits
	"olacin/telescope-cc.nvim",
	-- plugin to show pretty diagnostics
	{
		"folke/trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		opts = {},
	},
	-- plugin for a status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons", lazy = true },
		opts = {
			sections = {
				lualine_c = {
					{
						"filename",

						-- 0: Just the filename
						-- 1: Relative path
						-- 2: Absolute path
						-- 3: Absolute path, with tilde as the home directory
						-- 4: Filename and parent dir, with tilde as the home directory
						path = 1,

						-- Shortens path to leave 40 spaces in the window
						-- for other components. (terrible name, any suggestions?)
						shorting_target = 40,
					},
				},
			},
		},
	},
	-- plugin for git commands
	"tpope/vim-fugitive",
	-- plugin to add git features
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
	},
	-- plugin offers an imroved commenting workflow
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
	-- plugin offers autocompletion for parantheses and quotes
	{
		"windwp/nvim-autopairs",
		opts = {},
	},
	-- plugin to highlight patterns in text
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
		version = false,
	},
  -- plugin to offer operations around code blocks
  {
    "echasnovski/mini.ai",
    opts = {},
    version = false
  },
	-- plugin to highlight indent level
	{
		"echasnovski/mini.indentscope",
		opts = {},
		version = false,
	},
	-- plugin to offer operations for surrounding characters
	{
		"echasnovski/mini.surround",
		opts = {
			mappings = {
				add = "gsa", -- Add surrounding in Normal and Visual modes
				delete = "gsd", -- Delete surrounding
				find = "gsf", -- Find surrounding (to the right)
				find_left = "gsF", -- Find surrounding (to the left)
				highlight = "gsh", -- Highlight surrounding
				replace = "gsr", -- Replace surrounding
				update_n_lines = "gsn", -- Update `n_lines`
			},
		},
		version = false,
	},
	-- plugin to format code
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				-- Use a sub-list to run only the first available formatter
				javascript = { { "prettierd", "prettier" } },
				lua = { "stylua" },
				rust = { "cargo fmt" },
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_fallback = true,
			},
		},
	},
}
