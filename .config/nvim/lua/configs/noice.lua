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
}
