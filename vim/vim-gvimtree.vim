set nocompatible              " be iMproved, required
filetype off                  " required
"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/etc/gvimtree/bundle')
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdtree-git-plugin'
Plugin 'file:///~/etc/gvimtree/bundle/gvimtree'
call vundle#end()            " required
filetype plugin indent on    " required
set mouse=a
