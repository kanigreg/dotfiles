if require("zk.util").notebook_root(vim.fn.expand("%:p")) then
  map("n", "gr", vim.lsp.buf.references, { desc = "Notes linked" })
  map("n", "K", vim.lsp.buf.hover, { desc = "Preview" })

  map("n", "<leader>zl", "<Cmd>ZkLinks<CR>", { desc = "Notes linked by current buffer" })
  map("n", "<leader>zb", "<Cmd>ZkBacklinks<CR>", { desc = "Notes linking to current buffer" })
  map("n", "<leader>zi", "<Cmd>ZkInsertLink<CR>", { desc = "Insert link" })
  map("v", "<leader>zi", "<Cmd>'<,'>ZkInsertLinkAtSelection { matchSelected = true }<CR>", { desc = "Insert link" })
end
