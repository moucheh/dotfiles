pcall(function()
  dofile(vim.g.base46_cache .. 'git')
  dofile(vim.g.base46_cache .. 'mason')
end)

return {
  {
    'stevearc/conform.nvim',
    opts = require 'configs.conform',
  },

  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    config = function()
      require('oil').setup()
    end,
  },

  'nvim-lua/plenary.nvim',

  {
    'nvchad/base46',
    build = function()
      require('base46').load_all_highlights()
    end,
  },

  {
    'nvchad/ui',
    lazy = false,
    config = function()
      require 'nvchad'
    end,
  },

  'nvzone/volt',
  'nvzone/menu',
  { 'nvzone/minty', cmd = { 'Huefy', 'Shades' } },

  {
    'nvim-tree/nvim-web-devicons',
    opts = function()
      dofile(vim.g.base46_cache .. 'devicons')
      return {
        override = {
          default_icon = { icon = '󰈚', name = 'Default' },
          js = { icon = '󰌞', name = 'js' },
          ts = { icon = '󰛦', name = 'ts' },
          lock = { icon = '󰌾', name = 'lock' },
          ['robots.txt'] = { icon = '󰚩', name = 'robots' },
        },
      }
    end,
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'User FilePost',
    opts = {
      indent = { char = '│', highlight = 'IblChar' },
      scope = { char = '│', highlight = 'IblScopeChar' },
    },
    config = function(_, opts)
      dofile(vim.g.base46_cache .. 'blankline')

      local hooks = require 'ibl.hooks'
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
      require('ibl').setup(opts)

      dofile(vim.g.base46_cache .. 'blankline')
    end,
  },

  {
    'folke/which-key.nvim',
    keys = { '<leader>', '<c-w>', '"', "'", '`', 'c', 'v', 'g' },
    cmd = 'WhichKey',
    opts = function()
      dofile(vim.g.base46_cache .. 'whichkey')
      return {}
    end,
  },

  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = { lua = { 'stylua' } },
    },
  },

  {
    'lewis6991/gitsigns.nvim',
    event = 'User FilePost',
    opts = {
      signs = {
        delete = { text = '󰍵' },
        changedelete = { text = '󱕖' },
      },
    },
  },

  {
    'mason-org/mason.nvim',
    cmd = { 'Mason', 'MasonInstall', 'MasonUpdate' },
    opts = {
      PATH = 'skip',

      ui = {
        icons = {
          package_pending = ' ',
          package_installed = ' ',
          package_uninstalled = ' ',
        },
      },

      max_concurrent_installers = 10,
    },
  },

  {
    'neovim/nvim-lspconfig',
    event = 'User FilePost',
    config = function()
      require('nvchad.configs.lspconfig').defaults()
    end,
  },
}
