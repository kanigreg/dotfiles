vim.g.mapleader = " "
vim.g.localleader = "\\"

local opt = vim.opt

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

if not vim.env.SSH_TTY then
  opt.clipboard = "unnamedplus" -- Sync with system clipboard
end

opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 2
opt.spelllang = { "en", "ru" }
opt.formatoptions = 'tcqjronl'

opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"

opt.number = true -- Print line number
opt.relativenumber = true -- Relative line numbers

opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.autowrite = true -- Enable auto write

opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.smartindent = true -- Insert indents automatically
opt.breakindent = false

opt.shortmess:append({ W = true, I = true, c = true, C = true })

opt.mouse = 'a'
opt.showmode = false
opt.undofile = true
opt.undolevels = 10000

opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }

opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time

opt.ignorecase = true
opt.smartcase = true -- Don't ignore case with capitals

opt.inccommand = "nosplit" -- preview incremental substitute

opt.laststatus = 3 -- global statusline

opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current

opt.scrolloff = 15 -- Lines of context
opt.sidescrolloff = 8 -- Columns of context

opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup

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

