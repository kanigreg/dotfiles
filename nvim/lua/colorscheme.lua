local present = pcall(require, "onedarkpro")
if not present then
  return
end

vim.cmd("colorscheme onedark")
