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
end)

