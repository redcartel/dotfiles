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
" some default behavior
Plugin 'tpope/vim-sensible'
" linting engine
" Plugin 'vim-syntastic/syntastic'
" filesystem explorer
" Plugin 'scrooloose/nerdtree'
" ctags support
" Plugin 'universal-ctags/ctags'
" more ctags support
" Plugin 'ludovicchabant/vim-gutentags'
" C-w w toggle window to fullscreen
" Plugin 'vim-scripts/ZoomWin'
Plugin 'Glench/Vim-Jinja2-Syntax'

"
"" The following are examples of different formats supported.
"" Keep Plugin commands between vundle#begin/end.
"" plugin on GitHub repo
""Plugin 'tpope/vim-fugitive'
"" plugin from http://vim-scripts.org/vim/scripts.html
"" Plugin 'L9'
"" Git plugin not hosted on GitHub
""Plugin 'git://git.wincent.com/command-t.git'
"" git repos on your local machine (i.e. when working on your own plugin)
""Plugin 'file:///home/gmarik/path/to/plugin'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
""Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"" Install L9 and avoid a Naming conflict if you've already installed a
"" different version somewhere else.
"" Plugin 'ascenator/L9', {'name': 'newL9'}
"
"" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
