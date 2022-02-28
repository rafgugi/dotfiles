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
set scrolloff=5      " Leave n lines of buffer when scrolling
set sidescrolloff=10 " Leave n characters of horizontal buffer when scrolling

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
" Reload vimrc
map <leader>so :so $MYVIMRC<CR>

" Clear search highlighting
nnoremap <Esc><Esc> :noh<CR>

" " Panel switching
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
" " Split panel
nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s
" " Panel resize
nnoremap <silent> <leader>+ :resize +5<CR>
nnoremap <silent> <leader>- :resize -5<CR>
nnoremap <silent> <leader>++ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <leader>-- :exe "resize " . (winheight(0) * 2/3)<CR>

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

" Find/replace
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left><left>

" Toggle line numbers
nnoremap <silent> <C-g> :set nu! rnu!<CR>

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
nnoremap <leader>com :G commit<CR>
nnoremap <leader>dif :G diff<CR>
nnoremap <leader>pus :G push origin <C-r>=fugitive#head()<CR><CR>
nnoremap <leader>pul :G pull origin <C-r>=fugitive#head()<CR><CR>

" GitGutter
" " Jump between hunks
nmap ]c <Plug>(GitGutterNextHunk)
nmap [c <Plug>(GitGutterPrevHunk)
" " Hunk-add and hunk-revert for chunk staging
nmap <leader>ga <Plug>(GitGutterStageHunk)
nmap <leader>gu <Plug>(GitGutterUndoHunk)

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

