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

" Code
Plug 'sheerun/vim-polyglot'

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
Plug 'stsewd/fzf-checkout.vim'

" Others
Plug 'mbbill/undotree'
Plug 'ap/vim-css-color'

"*****************************************************************************
"" Custom bundles
"*****************************************************************************

" elixir
Plug 'elixir-lang/vim-elixir'
Plug 'carlosgaldino/elixir-snippets'

" go
"" Go Lang Bundle
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}

" javascript
"" Javascript Bundle but probably not necessary yet
" Plug 'jelera/vim-javascript-syntax'

" php
"" PHP Bundle
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install --no-dev -o'}
Plug 'stephpy/vim-php-cs-fixer'
Plug 'jwalton512/vim-blade'

" ruby
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-projectionist'
Plug 'thoughtbot/vim-rspec'
Plug 'ecomba/vim-ruby-refactoring', {'tag': 'main'}
call plug#end()

" NerdTree config
source ~/.config/nvim/plugin/nerdtree.vim
source ~/.config/nvim/plugin/theme.vim

