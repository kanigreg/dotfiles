return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use { 'svban/YankAssassin.vim' }
	use { 'AndrewRadev/splitjoin.vim' }
	use 'tpope/vim-repeat'
	use 'RRethy/vim-illuminate'
	-- autosave files
	use {
		'nvim-zh/auto-save.nvim',
		config = function()
			local autosave = require("auto-save")
			autosave.setup()
		end
	}
	-- automaticaly adjust `shiftwidth` and `extendtab`
	use 'tpope/vim-sleuth'
	-- text surround
	use({
		"kylechui/nvim-surround",
		tag = "*",
		config = function()
			require("nvim-surround").setup({})
		end
	})
	-- blank line indentation
	use {
		'lukas-reineke/indent-blankline.nvim',
		config = function()
			require('indent_blankline').setup {
				char = '┊',
				show_trailing_blankline_indent = false,
				show_current_context = true,
			}
		end
	}
	-- show key suggestions
	use {
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup {}
		end
	}
	-- better commenting
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup({})
		end
	}


	-- UI
	use {
		'goolord/alpha-nvim',
		config = function()
			require 'alpha'.setup(require 'alpha.themes.startify'.config)
		end
	}
	use {
		'akinsho/bufferline.nvim',
		config = function()
			require("bufferline").setup {}
		end,
		tag = "v2.*",
		requires = 'kyazdani42/nvim-web-devicons',
	}
	use {
		'kosayoda/nvim-lightbulb',
		requires = 'antoinemadec/FixCursorHold.nvim',
		config = function()
			local lightbulb = require('nvim-lightbulb')
			lightbulb.setup({ autocmd = { enabled = true } })
		end
	}
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons'
		},
		config = function()
			require('nvim-tree').setup {}
		end
	}
	use {
		'stevearc/dressing.nvim',
		config = function()
			local dressing = require('dressing')
			dressing.setup({
				input = {
					get_config = function()
						if vim.api.nvim_buf_get_option(0, "filetype") == "NvimTree" then
							return { enabled = false }
						end
					end,
				},
			})
		end
	}
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true },
		config = function()
			require('lualine').setup {}
		end
	}

	-- speeding up
	use { 'lewis6991/impatient.nvim' }
	use { 'nathom/filetype.nvim' }

	-- Colorschema
	use "olimorris/onedarkpro.nvim"
	require('plugins.treesitter').run(use)

	-- Search
	use {
		'nvim-telescope/telescope.nvim', branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	-- Git
	use { 'tpope/vim-fugitive' }
	use {
		'lewis6991/gitsigns.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('gitsigns').setup()
		end
	}
	use {
		'TimUntersberger/neogit',
		config = function()
			local neogit = require('neogit')
			neogit.setup()
		end,
		requires = 'nvim-lua/plenary.nvim'
	}

	-- LSP
	require('plugins.lsp').run(use)

	-- Debugger
	use {
		'mfussenegger/nvim-dap',
	}
	-- 		'jayp0521/mason-nvim-dap.nvim',
	-- 		config = function()
	-- 			require("dapui").setup()
	-- 		end
	-- 	}
	-- 	use {
	-- 		'theHamsta/nvim-dap-virtual-text',
	-- 		config = function()
	-- 			require("nvim-dap-virtual-text").setup()
	-- 		end
	-- 	}
	-- 	use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
end)
