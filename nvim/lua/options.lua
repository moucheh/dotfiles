require 'nvchad.options'

vim.wo.relativenumber = true

local o = vim.o
local opt = vim.opt
o.cursorlineopt = 'both' -- to enable cursorline!

opt.number = true                              -- Line numbers
opt.relativenumber = true                      -- Relative line numbers
opt.cursorline = true                          -- Highlight current line
opt.wrap = true                                -- Don't wrap lines
opt.scrolloff = 10                             -- Keep 10 lines above/below cursor 
opt.sidescrolloff = 8                          -- Keep 8 columns left/right of cursor

-- Indentation
opt.tabstop = 2                                -- Tab width
opt.shiftwidth = 2                             -- Indent width
opt.softtabstop = 2                            -- Soft tab stop
opt.expandtab = true                           -- Use spaces instead of tabs
opt.smartindent = true                         -- Smart auto-indenting
opt.autoindent = true                          -- Copy indent from current line

-- Search settings
opt.ignorecase = true                          -- Case insensitive search
opt.smartcase = true                           -- Case sensitive if uppercase in search
opt.hlsearch = false                           -- Don't highlight search results 
opt.incsearch = true                           -- Show matches as you type

-- Visual settings
opt.termguicolors = true                       -- Enable 24-bit colors
opt.showmatch = true                           -- Highlight matching brackets
opt.matchtime = 2                              -- How long to show matching bracket
opt.cmdheight = 0                              -- Command line height
opt.completeopt = "menuone,noinsert,noselect"  -- Completion options 
opt.showmode = false                           -- Don't show mode in command line 
opt.pumheight = 10                             -- Popup menu height 
opt.pumblend = 10                              -- Popup menu transparency 
opt.winblend = 0                               -- Floating window transparency 
opt.conceallevel = 0                           -- Don't hide markup 
opt.concealcursor = ""                         -- Don't hide cursor line markup 
opt.synmaxcol = 300                            -- Syntax highlighting limit 

-- File handling
opt.swapfile = true
opt.undofile = true                            -- Persistent undo
opt.undodir = vim.fn.expand("~/.vim/undodir")  -- Undo directory
opt.updatetime = 300                           -- Faster completion
opt.timeoutlen = 500                           -- Key timeout duration
opt.ttimeoutlen = 0                            -- Key code timeout
opt.autoread = true                            -- Auto reload files changed outside vim
opt.autowrite = false                          -- Don't auto save

-- Behavior settings
opt.hidden = true                              -- Allow hidden buffers
opt.errorbells = false                         -- No error bells
opt.backspace = "indent,eol,start"             -- Better backspace behavior
opt.autochdir = false                          -- Don't auto change directory
opt.iskeyword:append("-")                      -- Treat dash as part of word
opt.path:append("**")                          -- include subdirectories in search
opt.mouse = "a"                                -- Enable mouse support
opt.clipboard:append("unnamedplus")            -- Use system clipboard
opt.modifiable = true                          -- Allow buffer modifications
opt.encoding = "UTF-8"                         -- Set encoding

-- Split behavior
opt.splitbelow = true                          -- Horizontal splits go below
opt.splitright = true                          -- Vertical splits go right

vim.g.neovide_opacity = 0.9
o.guifont = "CaskaydiaCove Nerd Font:h12"
