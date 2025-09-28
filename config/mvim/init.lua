vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function(_)
    vim.cmd [[
      hi normal guibg=none ctermbg=none

      hi TabLine     guifg=Gray      guibg=none     gui=none   ctermfg=Gray     ctermbg=none   cterm=none
      hi TabLineSel  guifg=White     guibg=none     gui=bold   ctermfg=White    ctermbg=none   cterm=bold
      hi TabLineFill guifg=Gray      guibg=none     gui=none   ctermfg=Gray     ctermbg=none   cterm=none

      hi Pmenu       guifg=Gray      guibg=Black    gui=none   ctermfg=DarkGray ctermbg=Black  cterm=none
      hi PmenuSel    guifg=White     guibg=Black    gui=bold   ctermfg=White    ctermbg=Black  cterm=bold
      hi PmenuSbar                   guibg=Black    gui=none                    ctermbg=Black  cterm=none
      hi PmenuThumb                  guibg=White    gui=none                    ctermbg=White  cterm=none

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
