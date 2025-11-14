-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", "<leader>bo", Snacks.bufdelete.other, { desc = "Close other buffers" })

map("n", "<leader>nd", function()
  local filename = os.date("%Y/%B/%d-%a")
  local path = "~/Documents/neonotes/daily/" .. filename .. ".md"
  vim.cmd("e " .. path)
end, { desc = "Go to daily file" })

map("t", "<C-[>", "<C-\\><C-N>", { silent = true })
