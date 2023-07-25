local options = {
  number = true,
  smartcase = true,
  termguicolors = true,
  ignorecase = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = true,
  numberwidth = 2,
  signcolumn = "yes:1",
  wrap = false
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

local globals = {
	mapleader = ' ',
}

for k, v in pairs(globals) do
	vim.g[k] = v
end

