local M = {
	'lewis6991/gitsigns.nvim',
	event = 'VeryLazy'
}

function M.config()
	require('gitsigns').setup({
		signs = {
			delete = { text = '✘' },
		},
		current_line_blame = true
	})
end

return M
