local config_path = vim.fn.expand('~/.config/mvim')
package.path = package.path .. ";" .. config_path .. "/lua/?.lua"
package.path = package.path .. ";" .. config_path .. "/lsp/?.lua"

vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0

require('theme')
require('statusline')
require('bufferline')
require('opts')
require('autocmds')
require('functions')
require('keybinds')
require('lsp')
require('netrw_icons')
