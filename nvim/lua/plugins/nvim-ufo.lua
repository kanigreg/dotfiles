local handler = function(virtual_text, lnum, end_lnum, width, truncate)
  local new_virtual_text = {}
  local suffix = (" 󰁂 %d "):format(end_lnum - lnum)
  local target_width = width - vim.fn.strdisplaywidth(suffix)
  local current_width = 0
  for _, chunk in ipairs(virtual_text) do
    local chunk_text = chunk[1]
    local chunk_width = vim.fn.strdisplaywidth(chunk_text)
    if target_width > current_width + chunk_width then
      table.insert(new_virtual_text, chunk)
    else
      chunk_text = truncate(chunk_text, target_width - current_width)
      local hl_group = chunk[2]
      table.insert(new_virtual_text, { chunk_text, hl_group })
      chunk_width = vim.fn.strdisplaywidth(chunk_text)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if current_width + chunk_width < target_width then
        suffix = suffix .. (" "):rep(target_width - current_width - chunk_width)
      end
      break
    end
    current_width = current_width + chunk_width
  end
  table.insert(new_virtual_text, { suffix, "MoreMsg" })
  return new_virtual_text
end

return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  config = function()
    require("ufo").setup({
      fold_virt_text_handler = handler,
    })
  end,
}
