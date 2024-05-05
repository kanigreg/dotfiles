local map = vim.keymap.set
local opts = { silent = true, noremap = true }

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true }, opts)
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true }, opts)
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true }, opts)
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true }, opts)

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" }, opts)
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" }, opts)
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" }, opts)
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" }, opts)

-- Move Lines 
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" }, opts)
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" }, opts)
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" }, opts)
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" }, opts)
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" }, opts)
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" }, opts)

-- Moving between buffers
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" }, opts)
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" }, opts)

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" }, opts)

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

