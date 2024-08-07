vim.api.nvim_create_autocmd("FileType", {
  desc = "Close some filetype with <q>",
  once = true,
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "notify",
    "qf",
    "query",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "Filetype identation with size 2",
  pattern = { "ruby", "lua", "yaml", "javascript", "html", "css", "raket" },
  once = true,
  callback = function(event)
    local opt = vim.bo[event.buf]
    opt.autoindent = true
    opt.expandtab = true
    opt.shiftwidth = 2
    opt.softtabstop = 2
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "Filetype identation with size 4",
  pattern = { "xml", "java", "kotlin" },
  once = true,
  callback = function(event)
    local opt = vim.bo[event.buf]
    opt.autoindent = true
    opt.expandtab = true
    opt.shiftwidth = 4
    opt.softtabstop = 4
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.jbuilder" },
  once = true,
  callback = function(event)
    vim.bo[event.buf].filetype = 'ruby'
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function(event)
    if event.match:match("^%w%w+:[\\/][\\/]") then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})
