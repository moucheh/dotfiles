return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  config = function()
    require('noice').setup {
      routes = {
        {
          view = 'notify',
          filter = { event = 'msg_showmode' },
        },
      },
      cmdline = {
        view = 'cmdline',
      },
      lsp = {
        hover = {
          enabled = false,
        },
        signature = {
          enabled = false,
        },
      },
    }
  end,
  opts = {},
  dependencies = {
    'MunifTanjim/nui.nvim',
    {
      'rcarriga/nvim-notify',
      config = function()
        local notify = require 'notify'

        notify.setup {
          render = 'compact',
          stages = 'fade',
          merge_duplicates = true,
          background_colour = '#000000',
        }

        vim.notify = notify
      end,
    },
  },
}
