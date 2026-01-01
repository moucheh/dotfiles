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
  'jdtls',
  'sqls',
  'rust_analyzer'
}

vim.lsp.enable(servers)

vim.diagnostic.config { virtual_text = true }
