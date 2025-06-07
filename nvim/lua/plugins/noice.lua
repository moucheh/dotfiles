return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  config = function()
    require 'configs.noice'
  end,
  opts = {},
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
}
