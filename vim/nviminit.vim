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
 call dein#add('Shougo/unite.vim')
 call dein#add('luochen1990/rainbow')
 call dein#add('tpope/vim-fugitive')                                         " GIT stuff
 call dein#add('airblade/vim-gitgutter')                                     " Show GIT diffs in left column
 call dein#add('neoclide/vim-jsx-improve')
 call dein#add('Shougo/vimfiler.vim')
 call dein#add('tpope/vim-sensible')
 call dein#add('Glench/Vim-Jinja2-Syntax')
 call dein#add('vim-airline/vim-airline')
 call dein#add('vim-airline/vim-airline-themes')
 call dein#add('ryanoasis/vim-devicons')
 call dein#add('farmergreg/vim-lastplace')
 " call dein#add('universal-ctags/ctags')
 " call dein#add('ludovicchabant/vim-gutentags')
 call dein#add('nathanaelkane/vim-indent-guides')
 call dein#add('janko-m/vim-test')
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

" turn on indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:airline_powerline_fonts = 1
let g:airline_theme="zenburn"

let g:rainbow_active = 1

call ale#Set('javascript_prettier_standard_options', '')
let g:ale_linters = {}
let g:ale_linters["python"] = ["pyls"] "flake8
let g:ale_linters["javascript"] = ["eslint", "tsserver"]
let g:ale_linters["css"] = ["vscode-css-languageservice"]
let g:ale_linters["markdown"] = ["write-good"]
let g:ale_linters["html"] = ["htmlhint", "tsserver"]
let g:ale_fixers = {}
let g:ale_fixers["python"] = ["autopep8", "yapf"]
let g:ale_fixers["javascript"] = ["prettier-standard"]
let g:ale_fixers["html"] = ["prettier"]
let g:ale_fixers["htmldjango"] = ["prettier"]
let g:ale_fixers["json"] = ["prettier"]
let g:ale_fixers["css"] = ["prettier"]
let g:ale_fixers["scss"] = ["prettier"]
let g:ale_fixers["markdown"] = ["prettier"]
let g:ale_fixers["angular"] = ["prettier"]
let g:ale_completion_enabled = 1
let g:airline#extensions#enabled = 1
let g:ale_close_preview_on_insert = 1
let g:ale_open_list = 1
let g:ale_list_window_size = 6
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 1
let g:ale_sign_column_always = 1
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_set_balloons = 1
set completeopt+=noinsert


"ALE shortcuts
nnoremap <C-j> <Plug>(ale_previous_wrap)
nnoremap <C-k> <Plug>(ale_next_wrap)
nnoremap <C-g> :ALEGoToDefinition<CR>
nnoremap <C-r> <Plug>(ale_find_references)
nmap <C-h> <Plug>(ale_hover)
nmap <C-c> :windo lcl\|ccl<CR>

"testing
nmap <M-t> :!zsh -c "export PYTHONPATH=$(pwd); pytest"<CR>

"colorscheme
colorscheme materialbox
set background=dark
:highlight Normal ctermfg=white ctermbg=232 

"mouse
set mouse=a

"folds
set foldenable
set foldmethod=indent
nnoremap <M-a> zA
nnoremap <M-o> zo
nnoremap <M-c> zc

