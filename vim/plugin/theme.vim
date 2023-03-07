" -----------------------
" Lightline
" -----------------------
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left':  [
  \              [ 'mode', 'paste' ],
  \              [ 'readonly', 'MyRelativepath', 'percent'],
  \            ],
  \   'right': [
  \              [ 'MyFiletype' ],
  \              [ 'gitbranch' ],
  \            ]
  \ },
  \ 'component_function': {
  \   'MyFiletype': 'MyFiletype',
  \   'MyRelativepath': 'MyRelativepath',
  \   'gitbranch': 'fugitive#Head',
  \ },
  \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&syntax) ? &syntax . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyRelativepath()
  let filename = expand('%:t') !=# '' ? expand('%') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

set noshowmode " Remove default status bar because we already have lightline

" -----------------------
" Set the main theme
" -----------------------
let g:gruvbox_contrast_dark = 'medium'
colorscheme gruvbox
highlight Normal guibg=none
