" gvim plugins, I keep separate plugins for gvim and for vim so gvim is
" IDE-like and vim is minimal

" Vundle boilerplate
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.gvim/bundle/Vundle.vim
call vundle#begin('~/.gvim/bundle')
Plugin 'VundleVim/Vundle.vim'

" some default behavior
Plugin 'tpope/vim-sensible'

"filesystem explorer
Plugin 'scrooloose/nerdtree'

"ctags support - right now seeing how well I get by with just langserver
"plugin
Plugin 'universal-ctags/ctags'
Plugin 'ludovicchabant/vim-gutentags'

" I do a lot with jinja2 templates
Plugin 'Glench/Vim-Jinja2-Syntax'

"Language server support - disabled, using Ale.
"Plugin 'prabirshrestha/async.vim'
"Plugin 'prabirshrestha/vim-lsp'
"Plugin 'ryanolsonx/vim-lsp-python'
"Plugin 'prabirshrestha/asyncomplete.vim'
"Plugin 'prabirshrestha/asyncomplete-lsp.vim'

" Async live linting - also does langserver stuff.
Plugin 'w0rp/ale'

" Fancy statusline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" My local color scheme, always a work in progress
Plugin 'file:///home/redcartel/etc/tomorrow-night-bright'

" Filetype icons and glyphs etc. from powerline
Plugin 'ryanoasis/vim-devicons'

" Remember cursor position
Plugin 'farmergreg/vim-lastplace'

" Finally my own vimrc, packaged as a bundle
Plugin 'redcartel/Redrc.vim'

" Color scheme options
Plugin 'rafi/awesome-vim-colorschemes'

" Vundle boilerplate
call vundle#end()            " required
filetype plugin indent on    " required

let g:ale_lint_on_save=1
let g:ale_lint_on_enter=1
let g:ale_lint_on_text_changed=0
let g:ale_completion_enabled=1
let g:airline#extensions#ale#enbled=1
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_fixers = { 'python': ['autopep8', 'yapf'], 'javascript': ['prettier'] }
let g:ale_linters = { 'python': ['pylint', 'flake8', 'pyls'], 'javascript': ['eslint', 'javascript-typescript-langserver'] }
set completeopt+=noinsert

