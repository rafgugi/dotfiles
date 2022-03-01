if has('nvim')
  source ~/.config/nvim/plugins/plugins.vim
endif

syntax on

set exrc
set rnu " relative line number, enable with ctrl+g
set nu  " current line number, enable with ctrl+g
set nohlsearch
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

" " Panel switching
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
" " Split panel
nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s

" Easy tab navigation
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>

" Map yanked to clipboard
vnoremap <C-c> "*y

" Find/replace
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left><left>

" Toggle line numbers
nnoremap <C-g> :set nu! rnu!<CR>

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
nnoremap <leader>pus :G push origin HEAD<CR>
nnoremap <leader>pul :G pull origin HEAD<CR>

" GitGutter
" " Jump between hunks
nmap <leader>gn <Plug>(GitGutterNextHunk)
nmap <leader>gp <Plug>(GitGutterPrevHunk)
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

