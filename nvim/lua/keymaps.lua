local bind = vim.keymap.set
local opts = { silent = true, noremap = true }

bind("n", "-", vim.cmd.Ex)

bind('n', '<leader>e', vim.diagnostic.open_float, opts)

-- Telescope
local builtin = require('telescope.builtin')
bind('n', '<leader>b', builtin.buffers, opts)
bind('n', '<leader>sf', builtin.find_files, opts)
bind('n', '<leader>sg', builtin.live_grep, opts)
bind("n", "<leader>sb", builtin.current_buffer_fuzzy_find, opts)
bind("n", "<leader>sc", builtin.git_commits, opts)
bind("n", "<leader>sr", builtin.lsp_references, opts)
bind("n", "<leader>so", builtin.lsp_document_symbols, opts)
bind("n", "<leader>sh", builtin.help_tags, opts)
bind("n", "<leader>sd", builtin.diagnostics, opts)

-- Nvim Tree
bind('n', '<leader><leader>', ':NvimTreeToggle<CR>', opts)
bind('n', '<C-n>', ':NvimTreeFindFile<CR>')

-- Core
bind('v', '"y', '"+y', opts)
bind('n', '"y', '"+y', opts)
bind('n', '"Y', '"+Y', opts)
bind('n', '"p', '"+p', opts)
bind('n', '"P', '"+P', opts)


bind("n", "<C-l>", "<C-w>l", opts)
bind("n", "<C-h>", "<C-w>h", opts)
bind("n", "<C-j>", "<C-w>j", opts)
bind("n", "<C-k>", "<C-w>k", opts)
