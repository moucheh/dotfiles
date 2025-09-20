return {
  {
    'stevearc/conform.nvim',
    opts = require 'configs.conform',
  },

  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = {
        'vim',
        'lua',
        'vimdoc',
        'html',
        'css',
      },
    },
  },

  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
  },
}
