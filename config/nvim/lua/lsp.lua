local servers = {
  'clangd',
  'emmet_language_server',
  'html',
  'cssls',
  'vhdl_ls',
  'ts_ls',
  'yamlls',
  'bashls',
  'cssls',
  'html',
  'lua_ls',
  'pyright',
  'tinymist',
  'fsautocomplete',
  'jdtls',
  'sqlls',
}

vim.lsp.enable(servers)

vim.diagnostic.config { virtual_text = true }
