local map = function(mode, lhs, rhs, opts)
  opts = opts or {}
  vim.keymap.set(mode, lhs, rhs, { silent = true, noremap = true, desc = opts.desc })
end

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- Moving between buffers
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- Save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- lazy.nvim
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Quit all
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- Swap to prev buffer
map("n", "<leader>b", "<cmd>b#<cr>", { desc = "Toggle last buffer" })

-- Telescope
local builtin = require("telescope.builtin")
local custom = require("utils.telescope")
local telescope = require("telescope")
map("n", "<leader>sf", builtin.find_files, { desc = "Search files" })
map("n", "<leader>sg", builtin.live_grep, { desc = "Search global" })
map("n", "<leader>sb", builtin.buffers, { desc = "Search buffers" })
map("n", "<leader>sh", builtin.help_tags, { desc = "Search help tags" })
map("n", "<leader>gb", builtin.git_branches, { desc = "Branches" })
map("n", "<leader>gs", custom.git_status_delta, { desc = "Status" })
map("n", "<leader>gc", custom.git_commits_delta, { desc = "Commit list" })
map("n", "<leader>gC", custom.git_bcommits_delta, { desc = "File relative commits" })
map("n", "<leader>sr", telescope.extensions.git_worktree.git_worktrees, { desc = "Git Worktree list" })
map("n", "<leader>sR", telescope.extensions.git_worktree.create_git_worktree, { desc = "Create Git Worktree" })

map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

-- Quickfix navigation
map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

map({ "n", "v" }, "<leader>f", function()
  require("conform").format({
    bufnr = vim.api.nvim_get_current_buf(),
    lsp_fallback = true,
    async = false,
    timeout_ms = 3000,
  })
end, { desc = "Format" })
