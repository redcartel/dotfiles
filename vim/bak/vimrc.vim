set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'

call vundle#end()            " required
filetype plugin indent on    " required

" end Vundle-specific configuration

set nocompatible

set statusline+=%F
set laststatus=2
set number

set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

set noswapfile
set undofile
set undodir=~/.vim/undo

au FileType javascript setl sw=2 sts=2 et
au FileType python set colorcolumn=80

set nocursorline
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline

au BufNewFile,BufRead *.html set filetype=htmldjango
