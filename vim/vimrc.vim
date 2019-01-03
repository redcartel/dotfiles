set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'redcartel/Redrc.vim'

if has("gui_running")
    Plugin 'mkarmona/materialbox'
    Plugin 'vim-lastplace'
    
    colorscheme materialbox
else
    Plugin 'Glench/Vim-Jinja2-Syntax'
    " Plugin 'vim-airline/vim-airline'
    " Plugin 'vim-airline/vim-airline-themes'
    Plugin 'farmergreg/vim-lastplace'
    Plugin 'vim-syntastic/syntastic'
    Plugin 'luochen1990/rainbow'
    
    let g:airline_powerline_fonts = 1
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 0
    let g:syntastic_check_on_wq = 0
    let g:syntastic_check_on_w = 0
    let g:syntastic_mode_map = { "mode": "passive" }
    let g:syntastic_python_checkers = ['pylint']
endif

call vundle#end()            " required
filetype plugin indent on    " required
