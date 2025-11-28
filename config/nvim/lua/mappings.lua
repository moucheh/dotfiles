local map = vim.keymap.set

map({ 'n', 'v', '' }, '<leader>cf', function()
  require('conform').format {
    lsp_format = 'fallback',
    async = false,
    timeout_ms = 500,
  }
end, { desc = 'Format current buffer/selection' })

map('n', '<leader>q', ':qall<CR>', { desc = 'quit vim' })
map('n', '<leader>Q', ':qall!<CR>', { desc = 'force quit vim' })
map('n', '<leader>X', ':bd!<CR>', { desc = 'force close buffer' })

map({ 'n', 'i', 'v' }, '<leader>dn', '<CMD>NoiceDismiss<CR>', { desc = 'dismiss notifications' })

map('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

map('n', 'n', 'nzzzv', { desc = 'Next search result (centered)' })
map('n', 'N', 'Nzzzv', { desc = 'Previous search result (centered)' })
map('n', '<C-d>', '<C-d>zz', { desc = 'Half page down (centered)' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Half page up (centered)' })

map('n', '<leader>sv', ':vsplit<CR>', { desc = 'Split window vertically' })
map('n', '<leader>sh', ':split<CR>', { desc = 'Split window horizontally' })
map('n', '<C-Up>', ':resize +2<CR>', { desc = 'Increase window height' })
map('n', '<C-Down>', ':resize -2<CR>', { desc = 'Decrease window height' })
map('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Decrease window width' })
map('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Increase window width' })

map('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' })
map('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' })
map('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
map('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

map('v', '<', '<gv', { desc = 'Indent left and reselect' })
map('v', '>', '>gv', { desc = 'Indent right and reselect' })

map('n', 'J', 'mzJ`z', { desc = 'Join lines and keep cursor position' })

map('n', '<leader>tr', function()
  require('fzf-lua').registers()
end, { desc = 'Show registers in a fzf-lua panel' })

map('n', '<leader>dt', function()
  require('fzf-lua').diagnostics_workspace()
end, { desc = 'Show diagnostics in a fzf-lua panel' })

map('n', '<leader>gr', function()
  require('fzf-lua').lsp_references()
end, { desc = 'Show lsp references in a fzf-lua panel' })

map('i', '<C-x><C-f>', function()
  require('fzf-lua').complete_file {
    cmd = 'rg --files',
    winopts = { preview = { hidden = false } },
  }
end, { silent = true, desc = 'Fuzzy complete file' })

map('n', '<leader>gb', '<CMD>Gitsigns blame<CR>', { desc = 'Toggle gitsigns blame' })

map('n', '<leader>lg', ':LazyGit<CR>', { desc = 'Toggle LazyGit' })
map('n', '<leader>ng', ':Neogit<CR>', { desc = 'Toggle Neogit' })

map('n', '<C-A>w', ':HopWord<CR>', { desc = 'Hop to word' })
map('n', '<C-A>f', ':HopChar1<CR>', { desc = 'Hop to character' })
map('n', '<C-A>c', ':HopCamelCase<CR>', { desc = 'Hop to camelcase word' })

-- Taken from nvchad

map('n', '<C-h>', '<C-w>h', { desc = 'switch window left' })
map('n', '<C-l>', '<C-w>l', { desc = 'switch window right' })
map('n', '<C-j>', '<C-w>j', { desc = 'switch window down' })
map('n', '<C-k>', '<C-w>k', { desc = 'switch window up' })

map('n', '<C-s>', ':w<CR>', { desc = 'general save file' })
map('n', '<C-c>', '<CMD>%y+<CR>', { desc = 'general copy whole file' })

map('n', '<Esc>', '<CMD>noh<CR>', { desc = 'general clear highlights' })

map('n', '<leader>ch', '<CMD>NvCheatsheet<CR>', { desc = 'toggle nvcheatsheet' })

map('n', '<leader>ds', vim.diagnostic.setloclist, { desc = 'LSP diagnostic loclist' })
map('n', '<leader>gh', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = 'Toggle LSP inlay hints' })

if require('nvconfig').ui.tabufline.enabled then
  map('n', '<leader>b', '<CMD>enew<CR>', { desc = 'buffer new' })

  map('n', '<Tab>', function()
    require('nvchad.tabufline').next()
  end, { desc = 'buffer goto next' })

  map('n', '<S-Tab>', function()
    require('nvchad.tabufline').prev()
  end, { desc = 'buffer goto prev' })

  map('n', '<leader>x', function()
    require('nvchad.tabufline').close_buffer()
  end, { desc = 'buffer close' })
end

map('n', '<C-/>', 'gcc', { desc = 'toggle comment', remap = true })
map('v', '<C-/>', 'gc', { desc = 'toggle comment', remap = true })

map('n', '<leader>fa', function()
  require('fzf-lua').global()
end, { desc = 'fzf-lua global' })

map('n', '<leader>fw', function()
  require('fzf-lua').live_grep()
end, { desc = 'fzf-lua live grep' })
map('n', '<leader>fo', function()
  require('fzf-lua').oldfiles()
end, { desc = 'fzf-lua find oldfiles' })
map('n', '<leader>fz', function()
  require('fzf-lua').grep_curbuf()
end, { desc = 'fzf-lua find in current buffer' })
map('n', '<leader>ff', function()
  require('fzf-lua').files()
end, { desc = 'fzf-lua find files' })

map({ 'n', 't' }, '<A-h>', function()
  require('nvchad.term').toggle { pos = 'sp', id = 'htoggleTerm' }
end, { desc = 'terminal toggleable horizontal term' })
