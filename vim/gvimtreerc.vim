set nocompatible              " be iMproved, required
filetype off                  " required
"" set the runtime path to include Vundle and initialize
set rtp+=~/.gvimtree/bundle/Vundle.vim
call vundle#begin('~/.gvimtree/bundle')
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdtree-git-plugin'
Plugin 'ryanoasis/vim-devicons'
Plugin 'redcartel/Gvimtree.vim'

call vundle#end()            " required
filetype plugin indent on    " required
