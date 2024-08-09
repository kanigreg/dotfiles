local map = function(mode, lhs, rhs, opts)
  opts = opts or {}
  vim.keymap.set(mode, lhs, rhs, { silent = true, noremap = true, desc = opts.desc })
end

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Tmux navigation
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Go to Left Pane", remap = true })
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Go to Lower Pane", remap = true })
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Go to Upper Pane", remap = true })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Go to Right Pane", remap = true })

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

-- Tab navigation
map("n", "[t", "<cmd>tabprevious<cr>", { desc = "Prev Tab" })
map("n", "]t", "<cmd>tabnext<cr>", { desc = "Next Tab" })

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

-- Quit / Close
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
map("n", "<leader>qb", "<cmd>%bd<cr><C-O>:bd#<cr>", { desc = "Close other buffers" })
map("n", "<leader>qt", '<cmd>tabonly "<cr>', { desc = "Close other tabs" })

-- Swap to prev buffer
map("n", "<leader>b", "<cmd>b#<cr>", { desc = "Toggle last buffer", group = "buffer" })

-- Telescope
local builtin = require("telescope.builtin")
local custom = require("utils.telescope")
local telescope = require("telescope")
map("n", "<leader>sf", builtin.find_files, { desc = "Search files" })
map("n", "<leader>sg", builtin.live_grep, { desc = "Search global" })
map("n", "<leader>sb", function()
  builtin.buffers({ ignore_current_buffer = true, sort_mru = true })
end, { desc = "Search buffers" })
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

-- Formatting
map({ "n", "v" }, "<leader>f", function()
  require("conform").format({
    bufnr = vim.api.nvim_get_current_buf(),
    lsp_fallback = true,
    async = false,
    timeout_ms = 3000,
  })
end, { desc = "Format" })

-- Project specific notes
map("n", "<M-t>", function()
  local file_name = vim.fn.getcwd() .. "/.neonotes/" .. os.date("%d-%m-%Y") .. ".md"
  vim.cmd("tabnew " .. file_name)
end, { desc = "Project notes" })

-- Debug Adapter Protocol
map("n", "<leader>dr", function()
  require("dap").continue()
end, { desc = "DAP: Continue" })
map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "DAP: Toggle Breakpoint" })
