local bind = vim.keymap.set
local opts = { silent = true, noremap = true }

bind('v', '"y', '"+y', opts)
bind('n', '"y', '"+y', opts)
bind('n', '"Y', '"+Y', opts)
bind('n', '"p', '"+p', opts)
bind('n', '"P', '"+P', opts)

bind("n", "<C-l>", "<C-w>l", opts)
bind("n", "<C-h>", "<C-w>h", opts)
bind("n", "<C-j>", "<C-w>j", opts)
bind("n", "<C-k>", "<C-w>k", opts)

