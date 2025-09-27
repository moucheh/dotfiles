local map = vim.keymap.set

vim.g.mapleader = ' '

map('n', '<C-s>', ':write<CR>')
map('n', '<C-c>', 'ggVGy')
map('n', '<leader>cf', 'ggVGgq')
map('n', '<Tab>', ':bnext<CR>')
map('n', '<S-Tab>', ':bprevious<CR>')
map('n', '<leader>rc', ':e ~/.config/mvim/init.lua<CR>')
map('n', '<leader>ff', ':FZF<CR>')
map('n', '<leader>fw', ':FzfGrep<CR>')
map('n', '<leader>lg', ':LazyGit<CR>')
map('n', '-', ':Explore<CR>')
map('n', '<leader>e', ':Rexplore<CR>')
map('n', '<leader>q', ':quit<CR>')
map('n', '<leader>Q', ':quitall!<CR>')

map('n', 'n', 'nzzzv', { desc = 'Next search result (centered)' })
map('n', 'N', 'Nzzzv', { desc = 'Previous search result (centered)' })
map('n', '<C-d>', '<C-d>zz', { desc = 'Half page down (centered)' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Half page up (centered)' })

map('n', '<C-Up>', ':resize +2<CR>', { desc = 'Increase window height' })
map('n', '<C-Down>', ':resize -2<CR>', { desc = 'Decrease window height' })
map('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Decrease window width' })
map('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Increase window width' })

map('v', '<', '<gv', { desc = 'Indent left and reselect' })
map('v', '>', '>gv', { desc = 'Indent right and reselect' })

map('n', 'J', 'mzJ`z', { desc = 'Join lines and keep cursor position' })

map('i', "'", "<Esc>a''<Esc>i")
map('i', '"', '<Esc>a""<Esc>i')
map('i', '(', '<Esc>a()<Esc>i')
map('i', '{', '<Esc>a{}<Esc>i')
map('i', '[', '<Esc>a[]<Esc>i')
map('i', '`', '<Esc>a``<Esc>i')

map('n', 'gd', vim.lsp.buf.definition)
map('n', 'gD', vim.lsp.buf.declaration)
map('n', 'gr', vim.lsp.buf.references)
