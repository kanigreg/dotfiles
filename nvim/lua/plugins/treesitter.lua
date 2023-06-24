local M = {}

function M.run(use)
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup {
				auto_install = true,
				context_commentstring = {
					enable = true,
					enable_autocmd = false,
				},
				autotag = {
					enable = true,
				},
				matchup = {
					enable = true
				},
				highlight = {
					enable = true, -- false will disable the whole extension
				},
				indent = {
					enable = true
				},
				endwise = {
					enable = true,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = 'gnn'
					},
				},
				textobjects = {
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							[']m'] = '@function.outer',
							[']]'] = '@class.outer',
						},
						goto_next_end = {
							[']m'] = '@function.outer',
							[']['] = '@class.outer',
						},
						goto_previous_start = {
							['[m'] = '@function.outer',
							['[['] = '@class.outer',
						},
						goto_previous_end = {
							['[m'] = '@function.outer',
							['[]'] = '@class.outer',
						},
					},
				},
			}
		end
	}
end

return M

