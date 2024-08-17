return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      ruby = { "rubocop" },
      json = { "jq" },
      yaml = { "yq" }
    },
  },
  config = function(_, opts)
    require("conform").setup(opts)
  end,
}
