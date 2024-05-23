return {
  "mfussenegger/nvim-lint",
  enabled = false,
  opts = {
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    linters = {
      typos = {
        diagnostics = {
          virtual_text = false,
          signs = false,
        },
      },
    },
  },
  config = function(_, opts)
    local ns = require("lint").get_namespace("typos")
    vim.diagnostic.config(opts.linters.typos.diagnostics, ns)

    vim.api.nvim_create_autocmd(opts.events, {
      callback = function()
        require("lint").try_lint("typos")
      end,
    })
  end,
}
