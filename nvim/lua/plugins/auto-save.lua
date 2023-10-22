return {
  'pocco81/auto-save.nvim',
  keys = {
    { 'ga', false }
  },
  config = function()
    require('auto-save').setup {
      execution_message = {
        message = function()
          return ''
        end,
      }
    }
  end
}
