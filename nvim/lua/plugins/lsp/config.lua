local M = {
	'neovim/nvim-lspconfig',
	event = { 'BufReadPre', 'BufNewFile' }
}

function M.config()
	require('lspconfig').lua_ls.setup {
		settings = {
			Lua = {
				runtime = {
					version = 'LuaJIT',
				},
				diagnostics = {
					globals = { 'vim' },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
				},
				telemetry = {
					enable = false,
				},
			},
		},
	}
	require('lspconfig').solargraph.setup {}
end

return M
