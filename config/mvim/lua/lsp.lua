local servers = {
  'lua_ls',
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
  'pyright',
  'tinymist',
  'fsautocomplete',
  'jdtls',
}

for _, server in ipairs(servers) do
  vim.lsp.config(server, require(server))
end

vim.lsp.enable(servers)

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      vim.keymap.set('i', '<C-Space>', function()
        vim.lsp.completion.get()
      end)
    end
  end
})

vim.diagnostic.config({ virtual_text = true })
