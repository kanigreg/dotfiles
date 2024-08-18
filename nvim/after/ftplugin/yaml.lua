if string.match(vim.fn.expand("%:p"), "playbook") then
  local opt = vim.opt_local
  opt.filetype = 'yaml.ansible'
end
