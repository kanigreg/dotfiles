return {
  { '0x00-ketsu/autosave.nvim', },
  { "slim-template/vim-slim" },
  { 'tpope/vim-rails' },
  {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    version = '2.*',
    config = function()
      require 'window-picker'.setup {
        hint = 'floating-big-letter'
      }
    end,
  }
}
