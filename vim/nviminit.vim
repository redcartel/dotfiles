if &compatible
 set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')
 call dein#add('~/.cache/dein')

 call dein#add('tpope/vim-sensible')
 " sensible defaults (?needed for nvim?, eh, don't mess with success) 

 ""call dein#add('junegunn/fzf', {'build': './install --all', 'merged': 0})
 ""call dein#add('junegunn/fzf.vim', {'depends': 'fzf'})
 " fuzzy finder
 " install silversearcher-ag in Debian to have :Ag pattern search all files
 " in project for pattern
 
 call dein#add('Shougo/deoplete.nvim')
 " autocompletion
 
 call dein#add('w0rp/ALE')                                  
 " langserver, linter, formatter etc.
 
 call dein#add('tpope/vim-fugitive')                        
 " git integration
 
 call dein#add('airblade/vim-gitgutter')                    
 " note file changes in gutter
 
 call dein#add('vim-airline/vim-airline')                   
 " cool status bar
 
 call dein#add('vim-airline/vim-airline-themes')            
 " themes for above
 
 call dein#add('ryanoasis/vim-devicons')                    
 " nerdfonts symbols
 
 "call dein#add('junkblocker/vim-indent-guides')           
 " indent level highlighting
 call dein#add('yggdroot/indentline')
 
 call dein#add('farmergreg/vim-lastplace')                  
 " start editing at last edit point
 
 ""call dein#add('othree/yajs')
 ""call dein#add('mxw/vim-jsx')
 " call dein#add('neoclide/vim-jsx-improve')
 " call dein#add('pangloss/vim-javascript')
 " javascript & jsx highlighting
 
 ""call dein#add('Glench/Vim-Jinja2-Syntax')                  
 " jinja2 templates
 
 call dein#add('sourcegraph/javascript-typescript-langserver')
 call dein#add('vscode-langservers/vscode-css-languageserver-bin')
 " TODO: jest w cragdallimore/vim-jest-cli

 call dein#add('scrooloose/nerdTree')
 call dein#add('Xuyuanp/nerdtree-git-plugin')
 
 call dein#add('Raimondi/delimitMate')
 " insert autocomplete perens etc.
 
 call dein#add('othree/html5.vim')
 call dein#add('alvan/vim-closetag')
 call dein#add('hail2u/vim-css3-syntax')
 call dein#add('othree/csscomplete.vim')
 " HTML

 call dein#add('sheerun/vim-polyglot')
 " better highlighting

 call dein#add('joshdick/onedark.vim')
 " colorscheme
 
 call dein#add('luochen1990/rainbow')                       
 " rainbow perens etc.

 call dein#add('redcartel/simplesnips.vim')
 " my simple snippits plugin

 call dein#add('redcartel/Redrc.vim')
 " my .vimrc
 
 call dein#end()
 call dein#save_state()
endif

filetype plugin indent on
syntax on
syntax enable

" ======================== NERDTree & buffer switching ======================
"
" IDE like behavior. <Leader>n opens NerdTree and sets hidden mode.
" Alt-left & right closes non-file windows and then navigates to next or
" previous buffer. <Leader>N ends hidden mode.
" <Leader>bd closes all unsaved files except current one

" a lot of this is to correct the tendency of NerdTree + ALE + hidden mode
" to have location lists popping up everywhere

" close all open windows that aren't a file and then switch buffers
command! Mp :windo if &buftype == "quickfix" || &buftype == "locationlist" 
    \              || &buftype == "help" || &buftype == "nofile"
    \| close | endif | bp

command! Mn :windo if &buftype == "quickfix" || &buftype == "locationlist" 
    \              || &buftype == "help" || &buftype == "nofile"
    \| close | endif | bn

fun CloseOpenBuffs()
    " attempt to close all buffers except the current one. Won't close unsaved
    " buffers in hidden mode
    NERDTreeClose
    let current_buff_num = bufnr('')
    bufdo if (bufnr('') != current_buff_num) | silent! bd | endif
    exec "b " . current_buff_num
endfun

nmap <Leader>n <esc>:set hidden \| NERDTreeToggle<CR>
nmap <Leader>N <esc>:set nohidden
nnoremap <M-Right> <esc>:Mn<cr>
nnoremap <M-Left> <esc>:Mp<cr>
nmap <Leader>bd <esc>:call CloseOpenBuffs()<cr>

" ============================== Deoplete ====================================
" needed for ALE intellisense / autocomplete

let deoplete#enable_at_startup=1

" ========================== ALE Settings ====================================

nnoremap <M-k> :ALEPrevious -wrap -error <CR>
nnoremap <M-j> :ALENext -wrap -error <CR>
nnoremap <Leader>ad :ALEGoToDefinition<CR>
nnoremap <Leader>af <Plug>(ale_find_references)
nnoremap <Leader>ah :ALEHover<CR>
nnoremap <Leader>aH :ALEDocumentation<CR> "apparently only for tsserver, similar to hover
nnoremap <Leader>al :ALELint<CR>
nnoremap <Leader>at :ALEToggle<CR>
nnoremap <Leader>ar :ALEReset<CR>

let g:ale_completion_enabled = 1
let g:ale_close_preview_on_insert = 1
let g:ale_open_list = 1
let g:ale_list_window_size = 6
let g:ale_lint_on_text_changed = 1
let g:ale_lint_delay = 200
let g:ale_lint_on_insert_leave = 1
let g:ale_sign_column_always = 1
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_set_balloons = 0
let g:ale_set_balloons_legacy_echo = 1
set completeopt+=noinsert
"
let g:ale_linters = {}
let g:ale_fixers = {}
"
"" Language specific settings
" checkout eslint config in dotfiles
let g:ale_linters["javascript"] = ['tsserver', 'eslint']
let g:ale_fixers["javascript"] = ["eslint"]
"
let g:ale_linters["python"] = ["pyls"]
let g:ale_fixers["python"] = ["yapf", "trim_whitespace"]
let g:ale_python_executable = "python3"

let g:ale_python_auto_pipenv = 1
"
let g:ale_linters["css"] = ["css-languageserver"]
let g:ale_fixers["css"] = ["prettier"]
"
let g:ale_linters["htmldjango"] = ["htmlhint"]
let g:ale_linters["html"] = ["htmlhint"]
let g:ale_fixers["html"] = ["prettier"]
let g:ale_fixers["htmldjango"] = ["prettier"]
"
let g:ale_fixers["json"] = ["prettier"]


" ========================== Simple Snips (my plugin!) =======================

let g:simplesnipsDir= $HOME . "/dotfiles/vim/snips/"

" ============================== Indent Guides ===============================

let g:indent_guides_enable_on_vim_startup = 1

" ============================== Rainbow Parentheses =========================

let g:rainbow_active = 1 
let g:rainbow_conf = {
	\	'guifgs': ['lightgreen', 'lightred', 'lightyellow', 'lightblue'],
	\	'ctermfgs': ['lightgreen', 'lightred', 'lightyellow', 'lightblue'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\	}
	\}

" ========================= Airline ==========================================

let g:airline_powerline_fonts = 1
let g:airline_theme="sol"
let g:airline#extensions#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" ========================== Color Scheme ====================================

let g:onedark_color_overrides = {
\ "black": {"gui": "#000000", "cterm": "0", "cterm16": "0" },
\ "purple": { "gui": "#C678DF", "cterm": "170", "cterm16": "5" },
\ "comment_grey": { "gui": "#af005f", "cterm": "125", "cterm16": "5"},
\ "gutter_fg_grey": { "gui": "#afd700", "cterm": "148", "cterm16": "11"},
\ "white": { "gui": "#ffffff", "cterm": "15", "cterm16": "15"}
\}
"colorscheme onedark 
set background=dark

" ========================== Indent Guides ===================================

let g:indentLine_color_gui = '#66AA88'
let g:indentLine_background_gui = ''
let g:indentLine_char = '┆'
"let g:indentLine_setConceal = 0

