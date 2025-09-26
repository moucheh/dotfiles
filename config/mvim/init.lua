vim.cmd('hi normal guibg=none ctermbg=none')
vim.cmd('hi tablinefill guibg=none ctermbg=none')

local config_path = vim.fn.expand('~/.config/mvim')
package.path = package.path .. ";" .. config_path .. "/lua/?.lua"
package.path = package.path .. ";" .. config_path .. "/lsp/?.lua"

vim.g.netrw_banner = 0

require('statusline')
require('opts')
require('autocmds')
require('functions')
require('keybinds')
require('lsp')
