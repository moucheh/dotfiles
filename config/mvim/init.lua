vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function(_)
    vim.cmd[[
      hi normal guibg=none ctermbg=none

      hi TabLine guibg=#1e1e2e guifg=#89b4fa ctermbg=NONE ctermfg=Blue
      hi TabLineSel guibg=#89b4fa guifg=#1e1e2e ctermbg=NONE ctermfg=White
      hi TabLineFill guibg=NONE guifg=#89b4fa ctermbg=NONE ctermfg=DarkBlue

      hi Pmenu       ctermfg=14  ctermbg=0
      hi PmenuSel    ctermfg=14  ctermbg=0
      hi PmenuSbar   ctermbg=0
      hi PmenuThumb  ctermbg=0

      hi! link NormalFloat Normal
      hi! link FloatBorder LineNr
      hi WildMenu    ctermfg=14  ctermbg=0
    ]]
  end,
})

vim.cmd.colorscheme('sorbet')

local config_path = vim.fn.expand('~/.config/mvim')
package.path = package.path .. ";" .. config_path .. "/lua/?.lua"
package.path = package.path .. ";" .. config_path .. "/lsp/?.lua"

vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0

require('statusline')
require('bufferline')
require('opts')
require('autocmds')
require('functions')
require('keybinds')
require('lsp')
require('netrw_icons')
