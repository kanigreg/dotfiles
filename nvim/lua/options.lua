local options = {
  number = true,
  smartcase = true,
  termguicolors = true,
  ignorecase = true,
  showtabline = 2,
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
	loaded = 1,
	loaded_netrw = 1,
	loaded_netrwPlugin = 1,
}

for k, v in pairs(globals) do
	vim.g[k] = v
end

