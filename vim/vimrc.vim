set nocompatible
set ai
set statusline+=%F
set laststatus=2
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

set number
set colorcolumn=80
set nocursorline
set noswapfile
set undofile
set undodir=~/.vim/undo

au FileType javascript setl sw=2 sts=2 et

autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline
au BufNewFile,BufRead *.html set filetype=htmldjango
