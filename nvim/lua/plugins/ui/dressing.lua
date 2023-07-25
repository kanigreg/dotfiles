local M = {
	'stevearc/dressing.nvim',
  opts = {},
}

function M.config()
	require('dressing').setup()
end

return M
