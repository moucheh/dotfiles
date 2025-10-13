dofile(vim.g.base46_cache .. "cmp")

return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      dependencies = 'rafamadriz/friendly-snippets',
      opts = { history = true, updateevents = 'TextChanged,TextChangedI' },
      config = function(_, opts)
        require('luasnip').config.set_config(opts)
        require('luasnip.loaders.from_vscode').lazy_load { exclude = vim.g.vscode_snippets_exclude or {} }
        require('luasnip.loaders.from_vscode').lazy_load { paths = vim.g.vscode_snippets_path or '' }
        require('luasnip.loaders.from_snipmate').load()
        require('luasnip.loaders.from_snipmate').lazy_load { paths = vim.g.snipmate_snippets_path or '' }
        require('luasnip.loaders.from_lua').load()
        require('luasnip.loaders.from_lua').lazy_load { paths = vim.g.lua_snippets_path or '' }
      end,
    },

    {
      'windwp/nvim-autopairs',
      opts = {
        fast_wrap = {},
        disable_filetype = { 'TelescopePrompt', 'vim' },
      },
      config = function(_, opts)
        require('nvim-autopairs').setup(opts)

        local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
        require('cmp').event:on('confirm_done', cmp_autopairs.on_confirm_done())
      end,
    },

    {
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'https://codeberg.org/FelipeLema/cmp-async-path.git',
    },
  },
  opts = function()
    return require 'nvchad.configs.cmp'
  end,
}
