pcall(function()
  dofile(vim.g.base46_cache .. 'syntax')
  dofile(vim.g.base46_cache .. 'treesitter')
end)

return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').install {
      'bash',
      'c',
      'cpp',
      'css',
      'fsharp',
      'html',
      'java',
      'javascript',
      'lua',
      'markdown',
      'python',
      'rust',
      'sql',
      'typescript',
      'typst',
      'vhdl',
      'zig',
    }
  end,
}
