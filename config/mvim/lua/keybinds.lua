local map = vim.keymap.set

vim.g.mapleader = ' '

map('n', '<C-s>', ':write<CR>', { desc = 'Save current file' })
map('n', '<C-c>', 'ggVGy', { desc = 'Copy entire file to clipboard' })
map('n', '<leader>cf', 'ggVGgq', { desc = 'Format entire file' })
map('n', '<leader>rc', ':e ~/.config/mvim/init.lua<CR>', { desc = 'Edit init.lua file' })
map('n', '<leader>ff', ':FZF<CR>', { desc = 'Open file search in FZF' })
map('n', '<leader>fw', ':FzfGrep<CR>', { desc = 'Open live grep in FZF' })
map('n', '<leader>fr', ':FzfRegisters<CR>', { desc = 'Open registers in FZF' })
map('n', '<leader>lg', ':LazyGit<CR>', { desc = 'Open LazyGit in a floating terminal' })
map('n', '-', ':Explore<CR>', { desc = 'Open netrw' })
map('n', '<leader>e', ':Rexplore<CR>', { desc = 'Return from netrw' })
map('n', '<leader>q', ':quit<CR>', { desc = 'Quit vim' })
map('n', '<leader>Q', ':quitall!<CR>', { desc = 'Force quit vim' })

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

map('i', "'", "<Esc>a''<Esc>i", { desc = 'Insert closing single quote' })
map('i', '"', '<Esc>a""<Esc>i', { desc = 'Insert closing double quote' })
map('i', '(', '<Esc>a()<Esc>i', { desc = 'Insert closing parenthesis' })
map('i', '{', '<Esc>a{}<Esc>i', { desc = 'Insert Closing bracket' })
map('i', '[', '<Esc>a[]<Esc>i', { desc = 'Insert closing brace' })
map('i', '`', '<Esc>a``<Esc>i', { desc = 'Insert closing backtic' })

map('n', 'gd', vim.lsp.buf.definition, { desc = 'LSP go to definition' })
map('n', 'gD', vim.lsp.buf.declaration, { desc = 'LSP go to declaration' })
map('n', 'gr', vim.lsp.buf.references, { desc = 'LSP go to references' })
