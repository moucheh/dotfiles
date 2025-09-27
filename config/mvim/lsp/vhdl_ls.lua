vim.lsp.config['vhdl_ls'] = {
  cmd = { 'vhdl_ls' },
  filetypes = { 'vhd', 'vhdl' },
  root_markers = {
    'vhdl_ls.toml',
    '.vhdl_ls.toml',
  },
}
