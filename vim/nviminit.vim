if &compatible
 set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')

 call dein#add('~/.cache/dein')
 " call dein#add('autozimu/LanguageClient-neovim')
 " call dein#add('Shougo/deoplete.nvim')
 call dein#add('w0rp/ALE')
 call dein#add('tpope/vim-sensible')
 call dein#add('Glench/Vim-Jinja2-Syntax')
 call dein#add('vim-airline/vim-airline')
 call dein#add('vim-airline/vim-airline-themes')
 call dein#add('ryanoasis/vim-devicons')
 call dein#add('farmergreg/vim-lastplace')
 call dein#add('universal-ctags/ctags')
 call dein#add('ludovicchabant/vim-gutentags')
 call dein#add('redcartel/Redrc.vim')
 if !has('nvim')
   "call dein#add('roxma/nvim-yarp')
   "call dein#add('roxma/vim-hug-neovim-rpc')
 endif

 call dein#end()
 call dein#save_state()
endif

filetype plugin indent on
syntax enable

let g:ale_linters = {}
let g:ale_linters["python"] = ["pyls", "pylint", "flake8"]
let g:ale_linters["javascript"] = ["tsserver", "eslint"]
let g:ale_linters["markdown"] = ["write-good"]
let g:ale_linters["html"] = ["htmlhint", "jslint", "
let g:ale_fixers = {}
let g:ale_fixers["python"] = ["autopep8", "yapf"]
let g:ale_completion_enabled = 1
let g:airline#extensions#enabled = 1
let g:ale_close_preview_on_insert = 1
let g:ale_open_list = 1
let g:ale_list_window_size = 6
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 250
let g:ale_sign_column_always = 1
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_set_balloons = 1

nnoremap <C-j> :lnext
nnoremap <C-k> :lprev
nnoremap <C-g> :ALEGoToDefinition

"let g:deoplete#enable_at_startup = 1
"let g:LanguageClient_autoStart = 1
"let g:LanguageClient_serverCommands = {}
"let g:LanguageClient_serverCommands["python"] = ['/usr/local/bin/pyls']

nnoremap <F5> :call LanguageClient_contextMenu()<CR>

colorscheme PaperColor
set background=dark
set mouse=a
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
