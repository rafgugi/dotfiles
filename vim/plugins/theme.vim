colorscheme gruvbox
highlight Normal guibg=none
" Lightline
let g:lightline = {
  \ 'colorscheme': 'powerlineish',
  \ 'active': {
  \   'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \   'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \ }
  \}

