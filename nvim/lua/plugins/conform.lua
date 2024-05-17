return {
  "stevearc/conform.nvim",
  opts = {
    events = { "BufWritePre" },
  },
  config = function(_, opts)
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
      },
    })

    vim.api.nvim_create_autocmd(opts.events, {
      pattern = "*",
      callback = function(args)
        require("conform").format({
          bufnr = args.buf,
          lsp_fallback = true,
          async = false,
          timeout_ms = 3000,
        })
      end,
    })
  end,
}
