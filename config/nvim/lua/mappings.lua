require 'nvchad.mappings'

local map = vim.keymap.set

map('n', ';', ':', { desc = 'CMD enter command mode' })
map('i', 'jk', '<ESC>')

map({ 'n', 'v' }, '<leader>cf', function()
  require('conform').format {
    lsp_format = 'fallback',
    async = false,
    timeout_ms = 500,
  }
end, { desc = 'Format current buffer/selection' })

map({ 'n', 'i', 'v' }, '<C-s>', '<cmd> w <cr>')

map('n', '<leader>q', '<cmd> qall <cr>', { desc = 'quit vim' })

map({ 'n', 'i', 'v' }, '<leader>dn', '<cmd> NoiceDismiss <cr>', { desc = 'dismiss notifications' })

map('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- Center screen when jumping
map('n', 'n', 'nzzzv', { desc = 'Next search result (centered)' })
map('n', 'N', 'Nzzzv', { desc = 'Previous search result (centered)' })
map('n', '<C-d>', '<C-d>zz', { desc = 'Half page down (centered)' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Half page up (centered)' })

-- Splitting & Resizing
map('n', '<leader>sv', ':vsplit<CR>', { desc = 'Split window vertically' })
map('n', '<leader>sh', ':split<CR>', { desc = 'Split window horizontally' })
map('n', '<C-Up>', ':resize +2<CR>', { desc = 'Increase window height' })
map('n', '<C-Down>', ':resize -2<CR>', { desc = 'Decrease window height' })
map('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Decrease window width' })
map('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Increase window width' })

-- Move lines up/down
map('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' })
map('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' })
map('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
map('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- Better indenting in visual mode
map('v', '<', '<gv', { desc = 'Indent left and reselect' })
map('v', '>', '>gv', { desc = 'Indent right and reselect' })

-- Better J behavior
map('n', 'J', 'mzJ`z', { desc = 'Join lines and keep cursor position' })

map('n', '<leader>tr', ':Telescope registers<CR>',  { desc = 'Show registers in a Telescope panel'})
