local function ops(desc)
	return { desc = 'Telescope: ' .. desc, noremap = true, silent = true }
end

local M = {
	'nvim-telescope/telescope.nvim', 
	tag = '0.1.2',
	dependencies = { 'nvim-lua/plenary.nvim' }
}

function M.config()
	require('telescope').setup({
		pickers = {
			buffers = {
				ignore_current_buffer = true,
				sort_mru = true
			}
		}
	})

	local builtin = require('telescope.builtin')
	vim.keymap.set('n', '<leader>b', builtin.buffers, ops('Buffers'))
	vim.keymap.set('n', '<leader>sf', builtin.find_files, ops('Find file'))
	vim.keymap.set('n', '<leader>sh', builtin.help_tags, ops('Help tags'))
	vim.keymap.set('n', '<leader>sb', builtin.current_buffer_fuzzy_find, ops('Search in current buffer'))
	vim.keymap.set('n', '<leader>sg', builtin.live_grep, ops('Global search'))
	vim.keymap.set('n', '<leader>sr', builtin.lsp_references, ops('LSP references for word under cursor'))
	vim.keymap.set('n', '<leader>so', builtin.lsp_document_symbols, ops('LSP document symbols'))
	vim.keymap.set('n', '<leader>sd', builtin.diagnostics, ops('Lists Diagnostics'))
	vim.keymap.set('n', '<leader>sc', builtin.git_commits, ops('Git commits'))
end

return M
