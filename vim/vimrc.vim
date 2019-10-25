set nocompatible              " be iMproved, Vundle requirement
filetype off                  " Vundle requirement

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'                   " plugin manager
Plugin 'tpope/vim-sensible'                     "   + tpope's sensible defaults
Plugin 'redcartel/Redrc.vim'                    "   + my own herbs and spices
Plugin 'vim-lastplace'                          " cursor stars where you left
                                                "   off
                                                " i use gvim as basically
                                                " notepad. neovim is my ide
                                                " vim
Plugin 'Glench/Vim-Jinja2-Syntax'           " flask template syntax
Plugin 'vim-syntastic/syntastic'            " syntax checker
Plugin 'luochen1990/rainbow'                " rainbow perens / braces 

call vundle#end()            " required
filetype plugin indent on    " required

if has("gui_running")
    " specific settings for gvim graphical display
    set nonumber
    " MS-DOS Wordperfect circa 1990 looking motherfucker
    colorscheme blue
    " No shortcut icons or other bullshit. Keep the menus though. 
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L

    " Hi, I'm fucking blind
    set guifont=Monaco\ 20
else
    " specific settings for plugins in curses vim
    " leader+s checks file's syntax
    nmap <Leader>S :SyntasticCheck<CR>

    " syntastic settings: does not run automatically
    let g:airline_powerline_fonts = 1
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 0
    let g:syntastic_check_on_wq = 0
    let g:syntastic_check_on_w = 1
    let g:syntastic_mode_map = { "mode": "passive", "active_filetypes": ['python']}
    let g:syntastic_python_checkers = ['pylint']
    let g:syntastic_python_pylint_args = '-E'
    let g:syntastic_javascript_checkers = ['eslint']

    " jinja template highlighting by default for .html
    au BufNewFile,BufRead *.html set filetype=htmldjango
endif
