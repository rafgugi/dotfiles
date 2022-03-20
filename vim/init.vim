" only use plugin if you are using nvim
if has('nvim')
  source ~/.config/nvim/plugin/plugins.vim
endif

syntax on

set exrc
set rnu " relative line number, enable with ctrl+g
set nu  " current line number, enable with ctrl+g
set hlsearch " highlight all matching search
set hidden
set noerrorbells
set incsearch
set scrolloff=7      " Leave n lines of buffer when scrolling
set sidescrolloff=10 " Leave n characters of horizontal buffer when scrolling
set splitright " Yes! default split vertical will go to the right
set splitbelow " Yes! default split horizontal will go to the bottom

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set smartindent

" leader mapping
map <Space> <leader>

" Write to file
nnoremap <leader>w <Esc>:w<CR>

" Trying to imitate duplicate file in sublime
" TODO: handle file that has no extension
nnoremap <leader>dup :saveas <C-r>=expand('%:h/ .%:e')<CR><S-left><backspace>

" Reload vimrc
map <leader>so :so $MYVIMRC<CR>

" Clear search highlighting
nnoremap <Esc><Esc> :noh<CR>

" " Panel switching
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
" " New panel
nnoremap <leader>nv :vnew<CR>
nnoremap <leader>ns :new<CR>
" " Split panel
nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s
" " Panel resize
nnoremap <silent> <leader>+ :resize +5<CR>
nnoremap <silent> <leader>- :resize -5<CR>
" nnoremap <silent> <leader>++ :exe "resize " . (winheight(0) * 3/2)<CR>
" nnoremap <silent> <leader>-- :exe "resize " . (winheight(0) * 2/3)<CR>

" Remap arrow keys to buffer switching
nnoremap <leader>[ :tabprevious<CR>
nnoremap <leader>] :tabnext<CR>
" Remap shift + arrow keys to open new tabs
nnoremap <S-Left> :0tabnew<CR>
nnoremap <S-Right> :$tabnew<CR>

" Press <leader>bg in order to toggle light/dark background
map <leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Map yanked to clipboard
vnoremap <C-c> "*y
" Make Y yank the rest of the line, as you would expect it to
nnoremap Y y$

" greatest remap ever
vnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Find/replace
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left><left>

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

" Git
nnoremap <leader>com :G commit --verbose<bar> :resize <C-r>=(winheight(0) * 1/3)<CR><CR>
nnoremap <leader>dif :G diff<CR>
" " Stage or unstage current file
nnoremap <leader>add :Gw<CR>
nnoremap <leader>res :G reset <C-r>%<CR>
" " Push and pull current branch
nnoremap <leader>pus :G push origin <C-r>=fugitive#head()<CR><CR>
nnoremap <leader>pul :G pull origin <C-r>=fugitive#head()<CR><CR>
" " Checkout
nnoremap <leader>gco :GBranches<CR>

" GitGutter
" " Jump between hunks
nmap ]c <Plug>(GitGutterNextHunk)
nmap [c <Plug>(GitGutterPrevHunk)
" " Hunk-add and hunk-revert for chunk staging
nmap <leader>ga <Plug>(GitGutterStageHunk)
nmap <leader>gu <Plug>(GitGutterUndoHunk)
" " Change preview hunk from hp to gp
nmap <leader>gp <Plug>(GitGutterPreviewHunk)
silent! unmap <buffer> <leader>hp

" ctrl+p for faster file search
" use :Files if you want to include all files
" nnoremap <C-p> :GFiles<CR>
" nnoremap <leader>ff :Files<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" Telescope
nnoremap <C-p> <cmd>Telescope git_files<CR>
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>pf :lua require('telescope.builtin').find_files()<CR>

nnoremap <leader>u :UndotreeToggle<CR>

" PHP file config
autocmd FileType php setlocal ts=4 expandtab

" Yaml file config
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
