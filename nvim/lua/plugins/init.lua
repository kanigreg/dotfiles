return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use { 'svban/YankAssassin.vim' }
	use { 'AndrewRadev/splitjoin.vim' }
	use 'tpope/vim-repeat'

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
end)
