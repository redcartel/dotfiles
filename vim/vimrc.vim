set nocompatible              " be iMproved, Vundle requirement
filetype off                  " Vundle requirement

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'                   " plugin manager
Plugin 'tpope/vim-sensible'                     "   + tpope's sensible defaults
Plugin 'vim-lastplace'                          " cursor stars where you left
if has("gui_running")
    "gvim plugins
else
    "curses vim plugins
    Plugin 'Glench/Vim-Jinja2-Syntax'           " flask template syntax
    Plugin 'vim-syntastic/syntastic'            " syntax checker
    Plugin 'luochen1990/rainbow'                " rainbow perens / braces 
endif    
Plugin 'redcartel/Redrc.vim'                    "   + my own herbs and spices

call vundle#end()            " required
filetype plugin indent on    " required

if has("gui_running")
    " gvim appearance
    colorscheme blue
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guifont=Monaco\ 20
else
    " specific settings for plugins in curses vim
    " leader+s checks file's syntax
    nmap <Leader>st :SyntasticToggleMode<CR>

    " syntastic settings: does not run automatically
    let g:airline_powerline_fonts = 1
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 0
    let g:syntastic_check_on_wq = 0
    let g:syntastic_check_on_w = 1
    let g:syntastic_mode_map = { "mode": "passive" }
    let g:syntastic_python_checkers = ['pylint']
    let g:syntastic_python_pylint_args = '-E'
    let g:syntastic_javascript_checkers = ['eslint']

    " jinja template highlighting by default for .html
    au BufNewFile,BufRead *.html set filetype=htmldjango
endif
