return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require("dap")
    local port = "12345"
    local path = "spec/models/user_spec.rb"
    dap.adapters.ruby = {
      type = "server",
      port = port,
      executable = {
        detached = false,
        command = "docker-compose",
        args = {
          "run",
          "-d",
          "--rm",
          "-p 12345:12345",
          "app",
          "bundle",
          "exec",
          "rdbg",
          "--open",
          "--port 12345",
          "--host 0.0.0.0",
          "-c",
          "--",
          "bin/rspec",
          "spec/models/user_spec.rb",
        },
      },
    }
    dap.configurations.ruby = {
      {
        type = "ruby",
        request = "attach",
        name = "Run user_spec.rb",
      },
    }
  end,
}
