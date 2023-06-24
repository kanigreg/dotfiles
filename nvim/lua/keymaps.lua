vim.keymap.set("n", "-", vim.cmd.Ex)

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>sb', builtin.buffers, {})

-- Nvim Tree
vim.keymap.set('n', '<leader><leader>', ':NvimTreeToggle<CR>')

