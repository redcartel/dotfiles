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
 "call dein#add('autozimu/LanguageClient-neovim')
 " langserver
 call dein#add('dhruvasagar/vim-buffer-history')            
 " forward / back in buffer open history 
 call dein#add('tpope/vim-fugitive')                        
 " git integration
 call dein#add('airblade/vim-gitgutter')                    
 " note file changes in gutter
 call dein#add('mkarmona/materialbox')                      
 " color scheme
 call dein#add('vim-airline/vim-airline')                   
 " cool status bar
 call dein#add('vim-airline/vim-airline-themes')            
 " themes for above
 call dein#add('ryanoasis/vim-devicons')                    
 " nerdfonts symbols
 call dein#add('luochen1990/rainbow')                       
 " rainbow perens etc.
 call dein#add('nathanaelkane/vim-indent-guides')           
 " indent level highlighting
 call dein#add('farmergreg/vim-lastplace')                  
 " start editing at last edit point
 call dein#add('othree/yajs')
 call dein#add('neoclide/vim-jsx-improve')
 " javascript & jsx highlighting
 call dein#add('Glench/Vim-Jinja2-Syntax')                  
 " highlight {% jinja %} shit in .html files
 "call dein#add('janko-m/vim-test')                        
 " unit testing automation
 call dein#add('redcartel/Redrc.vim')                        " my .vimrc

 call dein#end()
 call dein#save_state()
endif

" let deoplete#enable_at_startup=1

filetype plugin indent on
syntax enable

" mouse
set mouse=a

" hi i'm blind
colorscheme materialbox
set background=dark

" i don't use macros or ex mode
nnoremap Q <nop>
map q <Nop>

" better block indenting
vmap < <gv
vmap > >gv

" be higher contrast
:highlight Normal ctermfg=white ctermbg=232 

" Alt+arrows moves through buffer history
" set hidden
nmap <M-LEFT> gbp
nmap <M-RIGHT> gbn

" turn on indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:airline_powerline_fonts = 1
let g:airline_theme="zenburn"
let g:airline#extensions#enabled = 1

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
" call ale#Set('javascript_prettier_standard_options', '')
let g:ale_linters["javascript"] = ["tsserver", "eslint-react"]
let g:ale_fixers["javascript"] = ["prettier-standard", "eslint"]

let g:ale_linters["python"] = ["pyls"] "flake8
let g:ale_fixers["python"] = ["autopep8", "yapf"]

let g:ale_linters["css"] = ["css-languageserver"]
let g:ale_fixers["css"] = ["prettier"]
" let g:ale_fixers["scss"] = ["prettier"]
let g:ale_linters["htmldjango"] = ["htmlhint"]
let g:ale_fixers["html"] = ["prettier"]
let g:ale_fixers["htmldjango"] = ["prettier"]
let g:ale_fixers["json"] = ["prettier"]

nnoremap <Leader>K <Plug>(ale_previous_wrap)
nnoremap <Leader>J <Plug>(ale_next_wrap)
nnoremap <Leader>D :ALEGoToDefinition<CR>
nnoremap <Leader>F <Plug>(ale_find_references)
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
 
" autocmd FileType defx call s:defx_my_settings()
" function! s:defx_my_settings() abort
"    " Defx keys. TODO: fuck with this some
"     nnoremap <silent><buffer><expr> <CR>
"           \ defx#do_action('drop')
"     nnoremap <silent><buffer><expr> c
"    \ defx#do_action('copy')
"    nnoremap <silent><buffer><expr> m
 "     \ defx#do_action('move')
 "     nnoremap <silent><buffer><expr> p
 "     \ defx#do_action('paste')
 "     nnoremap <silent><buffer><expr> l
 "     \ defx#do_action('open')
 "     nnoremap <silent><buffer><expr> E
 "     \ defx#do_action('open', 'vsplit')
 "     nnoremap <silent><buffer><expr> P
 "     \ defx#do_action('open', 'pedit')
 "     nnoremap <silent><buffer><expr> K
 "     \ defx#do_action('new_directory')
 "     nnoremap <silent><buffer><expr> N
 "     \ defx#do_action('new_file')
 "     nnoremap <silent><buffer><expr> M
 "     \ defx#do_action('new_multiple_files')
 "     nnoremap <silent><buffer><expr> d
 "     \ defx#do_action('remove')
 "     nnoremap <silent><buffer><expr> r
 "     \ defx#do_action('rename')
 "     nnoremap <silent><buffer><expr> !
 "     \ defx#do_action('execute_command')
 "     nnoremap <silent><buffer><expr> x
 "     \ defx#do_action('execute_system')
 "     nnoremap <silent><buffer><expr> yy
 "     \ defx#do_action('yank_path')
 "     nnoremap <silent><buffer><expr> .
 "     \ defx#do_action('toggle_ignored_files')
 "     nnoremap <silent><buffer><expr> ;
 "     \ defx#do_action('repeat')
 "     nnoremap <silent><buffer><expr> h
 "     \ defx#do_action('cd', ['..'])
 "     nnoremap <silent><buffer><expr> ~
 "     \ defx#do_action('cd')
 "     nnoremap <silent><buffer><expr> q
 "     \ defx#do_action('quit')
 "     nnoremap <silent><buffer><expr> <Space>
 "     \ defx#do_action('toggle_select') . 'j'
 "     nnoremap <silent><buffer><expr> *
 "     \ defx#do_action('toggle_select_all')
 "     nnoremap <silent><buffer><expr> j
 "     \ line('.') == line('$') ? 'gg' : 'j'
 "     nnoremap <silent><buffer><expr> k
 "     \ line('.') == 1 ? 'G' : 'k'
 "     nnoremap <silent><buffer><expr> <C-l>
 "     \ defx#do_action('redraw')
 "     nnoremap <silent><buffer><expr> <C-g>
 "     \ defx#do_action('print')
 "     nnoremap <silent><buffer><expr> cd
 "     \ defx#do_action('change_vim_cwd')
 " endfunction
 " au BufNewFile,BufRead netrw set filetype=defx


" let g:ale_linters["markdown"] = ["write-good"]
" let g:ale_fixers["markdown"] = ["prettier"]

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" let g:syntastic_check_on_w = 0
" let g:syntastic_mode_map = { "mode": "passive" }
" let g:syntastic_python_checkers = ['pylint']

