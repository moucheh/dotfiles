pcall(function()
  dofile(vim.g.base46_cache .. 'syntax')
  dofile(vim.g.base46_cache .. 'treesitter')
end)

return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPost', 'BufNewFile' },
  cmd = { 'TSInstall', 'TSBufEnable', 'TSBufDisable', 'TSModuleInfo' },
  build = ':TSUpdate',
  opts = {
    ensure_installed = { 'lua', 'luadoc', 'printf', 'vim', 'vimdoc', 'html', 'css' },

    highlight = {
      enable = true,
      use_languagetree = true,
    },

    indent = { enable = true },
  },
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
  end,
}
