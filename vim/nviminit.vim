"
if &compatible
 set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')
 call dein#add('~/.cache/dein')

 call dein#add('tpope/vim-sensible')
 " sensible defaults (?needed for nvim?, eh, don't mess with success) 
 
 call dein#add('Shougo/deoplete.nvim')
 " autocompletion
 
 
 call dein#add('w0rp/ALE')                                  
 " langserver, linter, formatter etc.
 
 call dein#add('tpope/vim-fugitive')                        
 " git integration
 
 call dein#add('airblade/vim-gitgutter')                    
 " note file changes in gutter
 
 "call dein#add('mkarmona/materialbox')                      
 " color scheme
 
 call dein#add('vim-airline/vim-airline')                   
 " cool status bar
 
 call dein#add('vim-airline/vim-airline-themes')            
 " themes for above
 
 call dein#add('ryanoasis/vim-devicons')                    
 " nerdfonts symbols
 
 call dein#add('nathanaelkane/vim-indent-guides')           
 " indent level highlighting
 
 call dein#add('farmergreg/vim-lastplace')                  
 " start editing at last edit point
 
 call dein#add('othree/yajs')
 call dein#add('mxw/vim-jsx')
 " call dein#add('neoclide/vim-jsx-improve')
 " call dein#add('pangloss/vim-javascript')
 " javascript & jsx highlighting
 
 call dein#add('Glench/Vim-Jinja2-Syntax')                  
 " jinja2 templates
 
 call dein#add('sourcegraph/javascript-typescript-langserver')
 call dein#add('vscode-langservers/vscode-css-languageserver-bin')
 " TODO: jest w cragdallimore/vim-jest-cli

 call dein#add('Shougo/neosnippet.vim')
 call dein#add('Shougo/neosnippet-snippets')
 " snippets
 
 call dein#add('scrooloose/nerdTree')
 call dein#add('Xuyuanp/nerdtree-git-plugin')
 " Nerdtree
 " TODO: check out Shougo/vimfiler
 
 call dein#add('Raimondi/delimitMate')
 " insert autocomplete perens etc.
 
 call dein#add('othree/html5.vim')
 call dein#add('alvan/vim-closetag')
 call dein#add('hail2u/vim-css3-syntax')
 call dein#add('othree/csscomplete.vim')
 " HTML

 " call dein#add('sheerun/vim-polyglot')
 " better highlighting

 call dein#add('joshdick/onedark.vim')
 " colorscheme
 
 call dein#add('luochen1990/rainbow')                       
 " rainbow perens etc.
 
 call dein#add('redcartel/Redrc.vim')
 " my .vimrc

 call dein#end()
 call dein#save_state()
endif

let deoplete#enable_at_startup=1
filetype plugin indent on
syntax on
syntax enable

" mouse
set mouse=a

" spellcheck 
set spell

" hi i'm blind
set termguicolors
let g:onedark_color_overrides = {
\ "black": {"gui": "#000000", "cterm": "0", "cterm16": "0" },
\ "purple": { "gui": "#C678DF", "cterm": "170", "cterm16": "5" },
\ "comment_grey": { "gui": "#af005f", "cterm": "125", "cterm16": "5"},
\ "gutter_fg_grey": { "gui": "#afd700", "cterm": "148", "cterm16": "11"},
\ "white": { "gui": "#ffffff", "cterm": "15", "cterm16": "15"}
\}
colorscheme onedark 
set background=dark

" i don't use macros or ex mode
nnoremap Q <nop>
map q <Nop>

" better block indenting
vmap < <gv
vmap > >gv

" be higher contrast
:highlight Normal ctermfg=white ctermbg=232 

nmap <M-Right> <esc>:bn<cr>
nmap <M-Left> <esc>:bp<cr>

" turn on indent guides
let g:indent_guides_enable_on_vim_startup = 1

" airline settings
let g:airline_powerline_fonts = 1
let g:airline_theme="sol"
let g:airline#extensions#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" ALE settings (asynchonous linting, langserver)
let g:ale_completion_enabled = 1
let g:ale_close_preview_on_insert = 1
let g:ale_open_list = 1
let g:ale_list_window_size = 6
let g:ale_lint_on_text_changed = 1
let g:ale_lint_delay = 250
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 1
let g:ale_sign_column_always = 1
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_set_balloons = 1
set completeopt+=noinsert

let g:ale_linters = {}
let g:ale_fixers = {}

" Language specific settings

" Language specific settings
call ale#Set('javascript_prettier_standard_options', '')
let g:ale_linters["javascript"] = ["tsserver", "eslint"]
let g:ale_fixers["javascript"] = ["prettier-standard"]

"all ale#Set('javascript_prettier_standard_options', '')
"let g:ale_linters["javascript"] = ['javascript-typescript-langserver']
"let g:ale_linters["javascript.jsx"] = ['javascript-typescript-langserver']
"[tsserver, eslint-react]
"let g:ale_fixers["javascript"] = ["prettier-standard", "eslint"]

let g:ale_linters["python"] = ["pyls"] "flake8
let g:ale_fixers["python"] = ["autopep8", "yapf"]

let g:ale_linters["css"] = ["css-languageserver"]
let g:ale_fixers["css"] = ["prettier"]
" let g:ale_fixers["scss"] = ["prettier"]
let g:ale_linters["htmldjango"] = ["htmlhint"]
let g:ale_fixers["html"] = ["prettier"]
let g:ale_fixers["htmldjango"] = ["prettier"]
let g:ale_fixers["json"] = ["prettier"]

nnoremap <M-k> <Plug>(ale_previous_wrap)
nnoremap <M-j> <Plug>(ale_next_wrap)
nnoremap <Leader>d :ALEGoToDefinition<CR>
nnoremap <Leader>f <Plug>(ale_find_references)
nmap     <Leader>H <Plug>(ale_hover)

" rainbow perens
let g:rainbow_active = 1 
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'firebrick'],
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
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}
 
" neosnippits:
imap <C-K> <Plug>(neosnippet_expand_or_jump)
smap <C-K> <Plug>(neosnippet_expand_or_jump)
xmap <C-K> <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

let g:neosnippet#snippets_directory='/home/redcartel/dotfiles/vim/snippets'

filetype plugin indent on
syntax enable

" nerdtree
nmap <Leader>n :set hidden<CR>:NERDTreeToggle<CR>

" from https://www.reddit.com/r/neovim/comments/85li8k/current_state_javascript_and_nvim/

set wildmenu
set cursorcolumn
set ruler
set scrolloff=2
set history=1000
set splitright
set autowrite
set autoread
set showcmd
set matchtime=3

map <C-Right> <C-W>l<C-W>
map <C-Left> <C-W>h<C-W>
map <C-Down> <C-W>j<C-W>
map <C-Up> <C-W>k<C-W>

"let g:jsx_ext_required=0
"let g:js_context_colors_enabled=1
"let g:js_context_colors=1
"let g:js_context_colors_insertmode=1
"let g:js_context_colors_usemaps=1
"let g:js_context_colors_colorize_comments=1
"let g:js_context_colors_comment_higroup=1
"let g:js_context_colors_debug=0
"let g:js_context_colors_highlight_function_names=1
"" let g:js_context_colors_es5=1
"let g:js_context_colors_block_scope=1
"let g:js_context_colors_block_scope_with_let=1
"let g:js_context_colors_jsx=1
"let g:js_context_colors_fold=1
"let g:js_context_colors_folding=1
"let g:js_context_colors_allow_jsx_syntax=1
