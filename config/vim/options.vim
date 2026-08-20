let &t_EI = "\e[2 q"
let &t_SI = "\e[6 q"
let &t_SR = "\e[4 q"
let mapleader = " "

let g:netrw_banner = 0

set number
set relativenumber
set noswapfile
set smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set scrolloff=10
set sidescrolloff=8
set noshowmode
set cursorline
syntax on

filetype plugin indent on
autocmd VimResume * silent !echo -ne "\e[2 q"

function! ClipboardCopy(reg, type, lines) abort
  call system('wl-copy', join(a:lines, "\n"))
endfunction

function! ClipboardPaste(reg) abort
  return ['', systemlist('wl-paste --no-newline')]
endfunction

let v:clipproviders['wl_clipboard'] = {
      \ 'copy': {
      \   '+': function('ClipboardCopy'),
      \   '*': function('ClipboardCopy')
      \ },
      \ 'paste': {
      \   '+': function('ClipboardPaste'),
      \   '*': function('ClipboardPaste')
      \ }
      \ }

set clipmethod=wl_clipboard
set clipboard+=unnamedplus
