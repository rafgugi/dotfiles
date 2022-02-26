source ~/.config/nvim/plugins/plugins.vim

syntax on

set exrc
set rnu " relative line number
set nu  " current line number
set nohlsearch
set hidden
set noerrorbells
set incsearch
set scrolloff=5      " Leave n lines of buffer when scrolling
set sidescrolloff=10 " Leave n characters of horizontal buffer when scrolling
set colorcolumn=80
set signcolumn=no " two column in the left

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set smartindent

" leader mapping
map <Space> <leader>

" Git
map <Leader>gs :Gstatus<CR>

" ctrl+p for faster file search
" use :Files if you want to include all files
nnoremap <C-p> :GFiles<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" " Panel switching
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
" " Split panel
nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s

" Easy tab navigation
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" " Map yanked to clipboard
vnoremap <C-c> "*y

" Find/replace
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left><left>

" " Toggle line numbers
nnoremap <C-g> :set nu!<cr>:set rnu!<cr>

" " Line moving
" " " Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
" " Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi
" " Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
" nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
" nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>

