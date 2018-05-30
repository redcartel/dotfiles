set nocompatible              " be iMproved, required
filetype off                  " required
"
"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.gvim/bundle')
""call vundle#begin('~/some/path/here')
"
"" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Plugin 'vim-syntastic/syntastic'
" some default behavior
Plugin 'tpope/vim-sensible'
" linting engine
" filesystem explorer
Plugin 'scrooloose/nerdtree'
" ctags support
Plugin 'universal-ctags/ctags'
" more ctags support
Plugin 'ludovicchabant/vim-gutentags'
" Plugin 'vim-scripts/ZoomWin'
Plugin 'Glench/Vim-Jinja2-Syntax'
" Language server support
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
" Async live linting
Plugin 'w0rp/ale'

call vundle#end()            " required
filetype plugin indent on    " required
