nnoremap <leader>e  :Ex<CR>
nnoremap <C-s>      :w<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fo :History<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fg :Rg<space>
nnoremap <Tab>      :bnext<CR>
nnoremap <S-Tab>    :bprev<CR>
nnoremap <leader>x  :bd<CR>
nnoremap <leader>X  :bd!<CR>
nnoremap <leader>q  :q<CR>
nnoremap <leader>Q  :qall!<CR>

vnoremap <          <gv
vnoremap >          >gv

nnoremap J          mzJ`z

nnoremap n          nzzzv
nnoremap N          Nzzzv
nnoremap <C-d>      <C-d>zz
nnoremap <C-u>      <C-u>zz

nnoremap <C-c>      :%y+<CR>
nnoremap <leader>rc :e ~/.config/vim/init.vim<CR>

nnoremap <Esc>      :noh<CR>
