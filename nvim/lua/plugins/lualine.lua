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
	  {
	    'diff',
	    symbols = { added = " ", modified = " ", removed = " ", },
	    source = function()
	      local gitsigns = vim.b.gitsigns_status_dict
	      if gitsigns then
		return {
		  added = gitsigns.added,
		  modified = gitsigns.changed,
		  removed = gitsigns.removed,
		}
	      end
	    end,}
	},
	lualine_x = {
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
          },
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
          },
	  {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
          },
	}
      },
      extensions = { 'neo-tree', 'lazy' }
    }
  end
}

