vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function(_)
    vim.cmd [[
      hi normal guibg=none ctermbg=none

      hi TabLine     guifg=#89b4fa   guibg=#1e1e2e             ctermfg=Blue     ctermbg=none
      hi TabLineSel  guifg=#1e1e2e   guibg=#89b4fa             ctermfg=White    ctermbg=none
      hi TabLineFill guifg=#89b4fa   guibg=none                ctermfg=DarkBlue ctermbg=none

      hi Pmenu       guifg=LightCyan guibg=Black               ctermfg=cyan     ctermbg=black
      hi PmenuSel    guifg=White     guibg=Grey20   gui=bold   ctermfg=cyan     ctermbg=black
      hi PmenuSbar                   guibg=Black                                ctermbg=black
      hi PmenuThumb                  guibg=Cyan                                 ctermbg=black

      hi WildMenu    guifg=LightCyan guibg=Black    gui=bold   ctermfg=cyan     ctermbg=black

      hi! link NormalFloat Normal
      hi! link FloatBorder LineNr
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
