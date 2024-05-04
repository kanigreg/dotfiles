vim.g.mapleader = " "
vim.g.localleader = "\\"

local opt = vim.opt

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

if not vim.env.SSH_TTY then
  opt.clipboard = "unnamedplus" -- Sync with system clipboard
end

opt.autowrite = true
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 2
opt.spelllang = { "en", "ru" }
opt.formatoptions = 'tcqjronl'
opt.number = true -- Print line number
opt.relativenumber = true -- Relative line numbers
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.mouse = 'a'
-- opt.showmode = false
opt.breakindent = false
opt.undofile = true
opt.undolevels = 10000
opt.ignorecase = true
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current
opt.termguicolors = true -- True color support
opt.timeoutlen = 300 -- Lower than default (1000) to quickly trigger which-key
opt.wrap = false -- Disable line wrap
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
