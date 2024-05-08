return {
  's1n7ax/nvim-window-picker',
  name = 'window-picker',
  event = 'VeryLazy',
  version = '2.*',
  config = function()
    require'window-picker'.setup {
      hint = 'floating-big-letter',
      show_prompt = false,
      filter_rules = {
	bo = {
	  filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
	  buftype = { 'terminal', 'quickfix', 'help' }
	}
      }
    }
  end
}
