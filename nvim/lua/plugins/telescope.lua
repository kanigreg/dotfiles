return {
  'nvim-telescope/telescope.nvim' , branch = '0.1.x',
  dependencies = { 
    'nvim-lua/plenary.nvim',
    { 
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make' 
    }
  },
  keys = {
    { "<leader>sb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
  },
  opts = function()
    local actions = require('telescope.actions')
    return {
      defaults = {
	prompt_prefix = " ",
	selection_caret = " ",
	mappings = {
	  i = {
	    ["<Esc>"] = actions.close,
	  }
	},
	set_env = {
	  -- Fix for <C-d> <C-u> navigation in preview with delta
	  -- https://github.com/nvim-telescope/telescope.nvim/issues/605#issuecomment-1874803100
	  LESS = '',
	  DELTA_PAGER = 'less -R'
	},
	file_ignore_patterns = {'.git', 'node_modules', 'vendor' }
      },
      pickers = {
	find_files = {
	  hidden = true
	}
      },
    }
  end
}
