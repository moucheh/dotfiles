vim.wo.relativenumber = true

local g = vim.g
local o = vim.o
local opt = vim.opt
o.cursorlineopt = 'both'

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.wrap = true
opt.scrolloff = 10
opt.sidescrolloff = 8
opt.winborder = 'rounded'

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

opt.termguicolors = true
opt.showmatch = true
opt.matchtime = 2
opt.cmdheight = 0
opt.completeopt = 'menuone,noinsert,noselect'
opt.showmode = false
opt.pumheight = 10
opt.pumblend = 10
opt.winblend = 0
opt.conceallevel = 0
opt.concealcursor = ''
opt.synmaxcol = 300

opt.swapfile = false
opt.undofile = true
opt.undodir = vim.fn.expand '~/.vim/undodir'
opt.updatetime = 300
opt.timeoutlen = 500
opt.autoread = true
opt.autowrite = false

opt.hidden = true
opt.errorbells = false
opt.backspace = 'indent,eol,start'
opt.autochdir = false
opt.iskeyword:append '-'
opt.path:append '**'
opt.mouse = 'a'
opt.clipboard:append 'unnamedplus'
opt.encoding = 'UTF-8'

opt.splitbelow = true
opt.splitright = true

vim.g.neovide_opacity = 0.9
o.guifont = 'CaskaydiaCove Nerd Font:h12'

o.laststatus = 3
o.splitkeep = 'screen'

opt.fillchars = { eob = ' ' }

o.ruler = false

opt.shortmess:append 'sI'

o.signcolumn = 'yes'

opt.whichwrap:append '<>[]hl'

g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

local is_windows = vim.fn.has 'win32' ~= 0
local sep = is_windows and '\\' or '/'
local delim = is_windows and ';' or ':'
vim.env.PATH = table.concat({ vim.fn.stdpath 'data', 'mason', 'bin' }, sep) .. delim .. vim.env.PATH
