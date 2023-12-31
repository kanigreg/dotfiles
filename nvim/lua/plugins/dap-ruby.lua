return {
  'kanigreg/ruby-dap.nvim',
  config = function()
    local dap = require('dap')
    dap.set_log_level('TRACE')
    dap.adapters.ruby = function(callback, config)
      callback {
        type = "executable",
        command = 'bundle',
        args = { "exec", "rdbg", "-n", "-c", "--", "bundle", "exec", 'rspec', config.program, },
        source_filetype = 'ruby'
      }
    end
    dap.configurations.ruby = {
      {
        type = "rdbg",
        name = "run current spec file",
        request = "launch",
        localfs = true,
        program = '${file}',
      },
    }
  end
}
