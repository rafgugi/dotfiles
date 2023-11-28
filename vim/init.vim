syntax on
filetype plugin indent on

set exrc
set noerrorbells visualbell t_vb=
set scrolloff=7      " Leave n lines of buffer when scrolling
set sidescrolloff=10 " Leave n characters of horizontal buffer when scrolling
set splitright " Yes! default split vertical will go to the right
set splitbelow " Yes! default split horizontal will go to the bottom
set nowrap " default no wrap. toggle with <C-z>
set autoread
set title titlestring=%{getcwd()}
set switchbuf-=unlisted " prevent switching to the deleted buffer

" Do not redraw screen in the middle of a macro
set lazyredraw

"" Enable hidden buffers
set hidden

" Searching
set hlsearch " highlight all matching search
set incsearch
set ignorecase
set smartcase

" Softtabs, 2 spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab
set smartindent
set autoindent

" Fix backspace indent
set backspace=indent,eol,start

" leader mapping
map <Space> <leader>

" Trying to imitate duplicate file in sublime
nnoremap <leader>dup :saveas <C-r>=expand('%')<CR>

" Editing vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>so :so $MYVIMRC<CR>

" File Explorer
nnoremap <leader>pv :Ex<CR>

" Terminal mode
tnoremap jk <C-\><C-n>
tnoremap <C-h> <C-b>
tnoremap <C-j> <C-n>
tnoremap <C-k> <C-p>
tnoremap <C-l> <C-f>

" " Panel resize
nnoremap <silent> <leader>+ :resize +5<CR>
nnoremap <silent> <leader>- :resize -5<CR>

" Tab navigation
nnoremap <silent> <leader>T :tabs<CR>
nnoremap <silent> <C-n> :tabnew<CR>
nnoremap <silent> <C-x> :tabclose<CR>
nnoremap <silent> <leader><S-Tab> :execute "tabmove" tabpagenr() - 2<CR>
nnoremap <silent> <leader><Tab> :execute "tabmove" tabpagenr() + 1<CR>
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

" Buffer navigation
nnoremap <silent> ]b :bn<CR>
nnoremap <silent> [b :bp<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> <leader>bd :bp<bar>sp<bar>bn<bar>bd<CR>

" Map yank current path to default register
nnoremap <leader>cp :let @+ = expand("%")<cr>:echom "Yanked current path"<cr>

" Map yanked to clipboard
nnoremap <leader>y "+y
nnoremap <leader>Y "+y$
vnoremap <leader>y "+y
" Make Y yank the rest of the line, as you would expect it to
nnoremap Y y$

" ex without clobbering my unnamed register.
nnoremap <leader>c "_c
nnoremap <leader>C "_C
vnoremap <leader>c "_c
nnoremap <leader>d "_d
nnoremap <leader>D "_D
vnoremap <leader>d "_d
vnoremap <leader>p "_dP

" Instead of stumbling into ex mode, repeat the last macro used.
nnoremap Q @@

" Find/replace
vnoremap <C-r> "hy:%s/<C-R><C-R>=substitute(escape(@h, '/\.*$^~['), '\_s\+$', '', 'g')<CR>//g<left><left>
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>

" Toggle line numbers
nnoremap <silent> <C-g> :set nu! rnu!<CR>
" Toggle wrap text
nnoremap <C-z> :set wrap!<CR>
inoremap <C-z> <ESC>:set wrap!<CR>gi
vnoremap <C-z> <ESC>:set wrap!<CR>gv

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

"" Vmap for maintain Visual Mode after indenting
vmap < <gv
vmap > >gv
vmap = =gv

" Combine line preserve cursor
nnoremap J mzJ`z

" Cursor stays in the middle when searching
" nnoremap n nzzzv
" nnoremap N Nzzzv

" Easy escape
inoremap jk <ESC>
inoremap <C-c> <ESC>
cnoremap <expr> <C-c> pumvisible() ? "\<ESC>" : "\<C-e>\<C-c>"

" only use plugin if you are using nvim
if has('nvim')
  :lua require("rafgugi")
endif

" some syntax specific
augroup file_php
  autocmd FileType php setlocal ts=4 sts=4 sw=4 expandtab autoindent
augroup END

augroup file_blade_php
  autocmd BufRead,BufNewFile *.blade.php setlocal ts=2 sts=2 sw=2 filetype=blade syntax=blade expandtab
augroup END

augroup file_java_kotlin
  autocmd BufRead,BufNewFile *.java,*.kt setlocal ts=4 sts=4 sw=4 expandtab
augroup END

if has('nvim')
  augroup terminal_buffer
    autocmd!
    autocmd TermOpen * setlocal nolist nonu nornu scrolloff=0
  augroup END
endif

" other
augroup ensure_dir_exist
  autocmd!
  autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
augroup END

augroup remember_cursor_position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
