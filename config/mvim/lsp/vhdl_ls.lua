vim.lsp.config['vhdl_ls'] = {
  cmd = { vim.fn.expand '~/.local/share/nvim/mason/bin/vhdl_ls' },
  filetypes = { 'vhd', 'vhdl' },
  root_markers = {
    'vhdl_ls.toml',
    '.vhdl_ls.toml',
  },
}
