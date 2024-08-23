return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      ruby = { "rubocop" },
      json = { "jq" },
      yaml = { "yq" },
      toml = { "taplo" },
      d2 = { "d2" }
    },
  },
  config = function(_, opts)
    require("conform").setup(opts)
  end,
}
