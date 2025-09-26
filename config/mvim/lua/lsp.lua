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

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client.supports_method('textDocument/completion') then
      vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      vim.keymap.set('i', '<C-Space>', function()
        vim.lsp.completion.get()
      end)
    end
  end
})

require('lua_ls')
require('clangd')
require('emmet_language_server')
require('html')
require('cssls')
require('vhdl_ls')
require('ts_ls')
require('yamlls')
require('bashls')
require('cssls')
require('html')
require('pyright')
require('tinymist')
require('fsautocomplete')
require('jdtls')

vim.lsp.enable(servers)

vim.diagnostic.config({ virtual_text = true })
