return {
  {
    'williamboman/mason.nvim',
    keys = { { "<leader>m", "<cmd>Mason<cr>", desc = "Mason" } },
    config = true
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = true,
    opts = {
      ensure_installed = { "lua_ls" }
    }
  },
  {
    'neovim/nvim-lspconfig',
    keys = {
      { "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
      { '<leader>ca', vim.lsp.buf.code_action, desc = 'Code Action', mode = { 'n', 'v' } },
      { "gd", function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, desc = "Goto Definition" },
      { "gr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
    },
    opts = {
      diagnostics = {
	underline = true,
	virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
	signs = {
	  text = {
	    [vim.diagnostic.severity.ERROR] = ' ',
	    [vim.diagnostic.severity.WARN] = ' ',
	    [vim.diagnostic.severity.HINT] = ' ',
	    [vim.diagnostic.severity.INFO] = ' ',
	  }
	},
	severity_sort = true,
      }
    },
    config = function(_, opts)
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup {}

      vim.diagnostic.config(opts.diagnostics)

      return opts
    end,
  },
}