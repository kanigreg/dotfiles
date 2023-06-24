local M = {}

function M.run(use)
	local servers = {
		'grammarly',
		'lua_ls',
		'solargraph',
	}

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			{ 'neovim/nvim-lspconfig' },
			{
				'williamboman/mason.nvim',
				run = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'L3MON4D3/LuaSnip' },

			-- Null LS
			'jayp0521/mason-null-ls.nvim',
			'jose-elias-alvarez/null-ls.nvim',
		}
	}
	local lsp = require('lsp-zero').preset({})

	lsp.on_attach(function(_, bufnr)
		lsp.default_keymaps({ buffer = bufnr })
		vim.keymap.set('n', '<leader>f', '<cmd>lua vim.lsp.buf.format({ async = true })<cr>')
		-- bind('n', "gr", "<cmd>TroubleToggle quickfix<cr>", opts)
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename)
		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
	end)

	lsp.ensure_installed(servers)

	-- (Optional) Configure lua language server for neovim
	require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

	lsp.setup()

	local null_ls = require('null-ls')
	local null_options = lsp.build_options('null_ls', {})

	null_ls.setup({
		debug = true,
		on_attach = null_options.on_attach,
		sources = {
			null_ls.builtins.diagnostics.rubocop,
			null_ls.builtins.formatting.rubocop,
			null_ls.builtins.diagnostics.codespell,
			null_ls.builtins.formatting.codespell
		}
	})

	local cmp = require('cmp')
	local sources = lsp.defaults.cmp_sources()
	table.insert(sources, { name = 'nvim_lsp_signature_help' })

	local cmp_config = lsp.defaults.cmp_config({
		preselect = 'none',
		completion = {
			completeopt = 'menu,menuone,noinsert,noselect'
		},
		sources = sources,
	})

	cmp.setup(cmp_config)

	use {
		'j-hui/fidget.nvim',
		kconfig = function()
			require "fidget".setup {}
		end,
	}
end

return M
