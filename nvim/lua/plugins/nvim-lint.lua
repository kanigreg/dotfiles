return {
  "mfussenegger/nvim-lint",
  dir = '~/oss/nvim-lint/',
  name = 'nvim-lint',
  opts = {
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    linters = {
      cspell = {
        diagnostics = {
          virtual_text = false,
          signs = false,
        },
      },
    },
  },
  config = function(_, opts)
    local ns = require("lint").get_namespace("cspell")
    vim.diagnostic.config(opts.linters.cspell.diagnostics, ns)

    vim.api.nvim_create_autocmd(opts.events, {
      callback = function()
        require("lint").try_lint("cspell")
      end,
    })
  end,
}
