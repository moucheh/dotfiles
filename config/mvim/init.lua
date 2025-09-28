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

      hi CmpItemKindText        guifg=#abb2bf gui=none       ctermfg=145
      hi CmpItemKindMethod      guifg=#c678dd gui=italic     ctermfg=134
      hi CmpItemKindFunction    guifg=#61afef gui=none       ctermfg=75
      hi CmpItemKindConstructor guifg=#e5c07b gui=none       ctermfg=180
      hi CmpItemKindField       guifg=#e06c75 gui=none       ctermfg=167
      hi CmpItemKindVariable    guifg=#d19a66 gui=none       ctermfg=173
      hi CmpItemKindClass       guifg=#e5c07b gui=bold       ctermfg=180
      hi CmpItemKindInterface   guifg=#56b6c2 gui=none       ctermfg=74
      hi CmpItemKindModule      guifg=#61afef gui=none       ctermfg=75
      hi CmpItemKindProperty    guifg=#e06c75 gui=none       ctermfg=167
      hi CmpItemKindUnit        guifg=#d19a66 gui=none       ctermfg=173
      hi CmpItemKindValue       guifg=#56b6c2 gui=none       ctermfg=74
      hi CmpItemKindEnum        guifg=#56b6c2 gui=bold       ctermfg=74
      hi CmpItemKindKeyword     guifg=#c678dd gui=italic     ctermfg=134
      hi CmpItemKindSnippet     guifg=#98c379 gui=none       ctermfg=108
      hi CmpItemKindColor       guifg=#56b6c2 gui=none       ctermfg=74
      hi CmpItemKindFile        guifg=#61afef gui=none       ctermfg=75
      hi CmpItemKindReference   guifg=#abb2bf gui=none       ctermfg=145
      hi CmpItemKindFolder      guifg=#61afef gui=none       ctermfg=75
      hi CmpItemKindEnumMember  guifg=#56b6c2 gui=none       ctermfg=74
      hi CmpItemKindConstant    guifg=#d19a66 gui=none       ctermfg=173
      hi CmpItemKindStruct      guifg=#e06c75 gui=none       ctermfg=167
      hi CmpItemKindEvent       guifg=#c678dd gui=none       ctermfg=134
      hi CmpItemKindOperator    guifg=#56b6c2 gui=none       ctermfg=74
      hi CmpItemKindTypeParameter guifg=#d19a66 gui=none     ctermfg=173
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
