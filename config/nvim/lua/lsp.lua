local servers = {
  'bashls',
  'clangd',
  'cssls',
  'cssls',
  'emmet_language_server',
  'html',
  'jdtls',
  'lua_ls',
  'nil_ls',
  'pyright',
  'rust_analyzer',
  'sqls',
  'tinymist',
  'ts_ls',
  'vhdl_ls',
  'yamlls',
}

vim.lsp.enable(servers)

vim.diagnostic.config { virtual_text = true }
