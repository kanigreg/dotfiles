return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

	-- Colorschema
	use "olimorris/onedarkpro.nvim"
	require('plugins.treesitter').run(use)

	-- Search
	use {
		'nvim-telescope/telescope.nvim', branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
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
end)

