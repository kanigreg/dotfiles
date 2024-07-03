local M = {}

function M.formatexpr()
  local ok, conform = pcall(require, "conform")
  if ok then
    return conform.formatexpr()
  end
  return vim.lsp.formatexpr({ timeout_ms = 3000 })
end

return M
