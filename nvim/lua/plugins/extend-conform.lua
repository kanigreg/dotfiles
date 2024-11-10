return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      ruby = { "rubocop" },
      json = { "jq" },
      yaml = { "yq" },
      toml = { "taplo" },
    },
  },
}
