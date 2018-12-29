set nocompatible              " be iMproved, required
filetype off                  " required
"
"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
""call vundle#begin('~/some/path/here')
"
"" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'farmergreg/vim-lastplace'
Plugin 'vim-syntastic/syntastic'
Plugin 'redcartel/Redrc.vim'
call vundle#end()            " required
filetype plugin indent on    " required
" echom "dotfiles/vim/vimrc.vim"
