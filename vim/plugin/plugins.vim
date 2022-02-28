" installing plugins

call plug#begin("~/.config/nvim/plugged")
" File explorer
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin' 
Plug 'ryanoasis/vim-devicons' " need to install nerd font

" Theme
Plug 'gruvbox-community/gruvbox'
Plug 'itchyny/lightline.vim'

" Telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" File search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Others
Plug 'mbbill/undotree'
Plug 'ap/vim-css-color'
call plug#end()

" NerdTree config
source ~/.config/nvim/plugin/nerdtree.vim
source ~/.config/nvim/plugin/theme.vim

