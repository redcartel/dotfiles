set nocompatible              " be iMproved, Vundle requirement
filetype off                  " Vundle requirement

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" plugin manager
    Plugin 'VundleVim/Vundle.vim'
" sensible defaults, is this still needed in 2020? don't mess with success
    Plugin 'tpope/vim-sensible'                   
" open file at the last place I was editing, the one plugin I always use
    Plugin 'farmergreg/vim-lastplace'           

if has("gui_running")
    " Goal is for gvim to be Notepad, basically
else
    " Goal is for vim to be a lightweight code editor. Nothing too heavy.
    " Nothing that changes the default behavior too much.

    " my own snippits plugin
    Plugin 'redcartel/simplesnips.vim'
    " adds gc command to comment lines
    Plugin 'tpope/vim-commentary'
    " improved syntax highlighting
    Plugin 'sheerun/vim-polyglot'
    " git commands in vim
    Plugin 'tpope/vim-fugitive'                        
    " indications of changed lines to the side
    Plugin 'airblade/vim-gitgutter'
    " css3
    Plugin 'hail2u/vim-css3-syntax'
    " linter. autolinting turned off in Redrc
    Plugin 'vim-syntastic/syntastic'
    " rainbow parentheses
    Plugin 'luochen1990/rainbow'
endif    

Plugin 'redcartel/Redrc.vim' " my own herbs and spices

call vundle#end()            " required
filetype plugin indent on    " required
