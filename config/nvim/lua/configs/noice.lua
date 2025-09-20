local noice = require 'noice'

noice.setup {
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
