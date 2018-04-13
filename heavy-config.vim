set nocompatible
set noswapfile

set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

set number
set colorcolumn=80

" " Syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  endif

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['pyflakes', 'flake8']

set nocursorline
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline

nnoremap <silent> <C-w>w :ZoomWin<CR>
