local opt = vim.opt
local o = vim.o

opt.path:append(vim.fn.expand('~/.local/share/nvim/mason/bin'))

o.cursorlineopt = 'both'
o.cursorline = true

o.number = true
o.relativenumber = true
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.signcolumn = 'yes'
o.softtabstop = 2
o.smartindent = true
o.autoindent = true

opt.winborder = 'rounded'
o.showtabline = 2
o.wrap = true
o.scrolloff = 10
o.sidescrolloff = 8
o.cmdheight = 0

opt.clipboard:append 'unnamedplus'
o.swapfile = false
o.autoread = true
o.autowrite = false
o.hidden = true
o.undofile = true
o.undodir = vim.fn.expand '~/.vim/undodir'

o.errorbells = false
o.backspace = 'indent,eol,start'
o.autochdir = false
opt.iskeyword:append '-'
opt.path:append '**'
o.mouse = 'a'
o.modifiable = true
o.encoding = 'UTF-8'

o.ignorecase = true
o.smartcase = true
o.hlsearch = false
o.incsearch = true

o.wildmenu = true
o.wildmode = "longest:full,full"
opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })
