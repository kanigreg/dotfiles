local M = {
	'nvim-tree/nvim-tree.lua',
  version = "*",
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  }
}

function M.config()
	require('nvim-tree').setup()

	-- Set useful ketmaps
	vim.keymap.set('n', '<leader><leader>', ':NvimTreeFindFileToggle!<CR>', { desc = 'nvim-tree: Toggle tree buffer', noremap = true, silent = true })
end

return M
