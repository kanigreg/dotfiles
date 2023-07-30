local function ops(desc)
	return { desc = 'Null-LS: ' .. desc, noremap = true, silent = true }
end

local M = {
	"jose-elias-alvarez/null-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
}

function M.config()
	local null_ls = require('null-ls')
	null_ls.setup({
		sources = {
			null_ls.builtins.diagnostics.rubocop,
			null_ls.builtins.formatting.rubocop,
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.diagnostics.luacheck,
		}
	})

	local format = function() vim.lsp.buf.format { async = true } end
	vim.keymap.set('n', '<leader>f', format, ops('Format code'))
end

return M
