syntax on

set exrc
set noerrorbells visualbell t_vb=
set scrolloff=7      " Leave n lines of buffer when scrolling
set sidescrolloff=10 " Leave n characters of horizontal buffer when scrolling
set splitright " Yes! default split vertical will go to the right
set splitbelow " Yes! default split horizontal will go to the bottom
set nowrap " default no wrap. toggle with <C-z>
set autoread

" Do not redraw screen in the middle of a macro
set lazyredraw

"" Enable hidden buffers
set hidden

" Searching
set hlsearch " highlight all matching search
set incsearch
set smartcase

" Softtabs, 2 spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab
set smartindent

" Fix backspace indent
set backspace=indent,eol,start

" leader mapping
map <Space> <leader>

" Trying to imitate duplicate file in sublime
nnoremap <leader>dup :saveas <C-r>=expand('%:p')<CR>

" Editing vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>so :so $MYVIMRC<CR>
nnoremap <leader>pv :Ex<CR>

" Terminal mode
tnoremap jk <C-\><C-n>
tnoremap <C-h> <C-b>
tnoremap <C-j> <C-n>
tnoremap <C-k> <C-p>
tnoremap <C-l> <C-f>

" " Panel switching
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
" " Panel resize
nnoremap <silent> <leader>+ :resize +5<CR>
nnoremap <silent> <leader>- :resize -5<CR>

" Remap arrow keys to buffer switching
nnoremap <leader>[ gT
nnoremap <leader>] gt
nnoremap <leader>{ :execute "tabmove" tabpagenr() - 2<CR>
nnoremap <leader>} :execute "tabmove" tabpagenr() + 1<CR>
" Remap shift + arrow keys to open new tabs
nnoremap <S-Left> :0tabnew<CR>
nnoremap <S-Right> :$tabnew<CR>
" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

" Map yank current path to default register
nnoremap <leader>cp :let @+ = expand("%")<cr>:echom "Yanked current path"<cr>

" Map yanked to clipboard
vnoremap <C-c> "*y
" Make Y yank the rest of the line, as you would expect it to
nnoremap Y y$

" ex without clobbering my unnamed register.
nnoremap <leader>d "_d
vnoremap <leader>d "_d
vnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" Instead of stumbling into ex mode, repeat the last macro used.
nnoremap Q @@

" Find/replace
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>
nnoremap <C-r> :%s/\<<C-r><C-w>\>//g<left><left>

" Toggle line numbers
nnoremap <silent> <C-g> :set nu! rnu!<CR>
" Toggle wrap text
nnoremap <C-z> :set wrap!<CR>
imap <C-z> <ESC><C-z>gi
vmap <C-z> <ESC><C-z>gv

" Line moving
" " Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
" " Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi
" " Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Combine line preserve cursor
nnoremap J mzJ`z

" Easy escape
inoremap jk <ESC>
inoremap <C-c> <ESC>

" Press <leader>bg in order to toggle light/dark background
map <leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" only use plugin if you are using nvim
if has('nvim')
  :lua require("rafgugi")
endif
