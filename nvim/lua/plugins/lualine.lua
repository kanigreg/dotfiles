return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
	globalstatus = true,
	disable_filetypes = {
	  statusline = { 'dashboard' }
	}
      },
      sections = {
	lualine_b = { 'branch' },
	lualine_c = { 
	  { 'diagnostics', symbols = { error = " ", warn  = " ", hint  = " ", info  = " ", }, },
	  { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
	  { 'filename', path = 1, padding = { left = 0, right = 1 } },
	},
      },
      extensions = { 'neo-tree', 'toggleterm' }
    }
  end
}

