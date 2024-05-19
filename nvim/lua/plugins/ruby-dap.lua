return {
  "mfussenegger/nvim-dap",
  optional = true,
  dependencies = {
    "kanigreg/ruby-dap.nvim",
    config = function()
      require("dap-ruby").setup()
    end,
  },
}
