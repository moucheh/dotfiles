vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0

vim.g.netrw_banner = 0
vim.g.netrw_fastbrowse = 0

vim.g.netrw_hide = 1
vim.g.netrw_list_hide = [[\v^\./|^\.\./]]

local ghregex=[[\(^\|\s\s\)\zs\.\S\+]]

vim.g.netrw_list_hide = vim.g.netrw_list_hide .. ',' .. ghregex
