require 'nvchad.mappings'

local map = vim.keymap.set

map('n', ';', ':', { desc = 'CMD enter command mode' })
map('i', 'jk', '<ESC>')

map('n', '<leader>cf', function()
  require('conform').format { lsp_format = 'fallback' }
end, { desc = 'Format current file' })

map({ 'n', 'i', 'v' }, '<C-s>', '<cmd> w <cr>')

map('n', '<leader>q', '<cmd> qall <cr>', { desc = 'quit vim' })

map({ 'n', 'i', 'v' }, '<leader>dn', '<cmd> NoiceDismiss <cr>', { desc = 'dismiss notifications' })

map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
