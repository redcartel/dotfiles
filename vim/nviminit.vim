if &compatible
 set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')

 call dein#add('~/.cache/dein')
 call dein#add('tpope/vim-sensible')                        " sensible defaults (? needed for nvim?) 
 
 call dein#add('w0rp/ALE')                                  " langserver, linter, formatter etc.
 
 call dein#add('Shougo/defx.nvim')                          " file browser
 call dein#add('kristijanhusak/defx-git')                   " git icons for file browser

 call dein#add('dhruvasagar/vim-buffer-history')            " forward / back in buffer open history
 
 call dein#add('tpope/vim-fugitive')                        " git integration
 call dein#add('airblade/vim-gitgutter')                    " note file changes in gutter
 
 call dein#add('mkarmona/materialbox')                      " color scheme
 call dein#add('vim-airline/vim-airline')                   " cool status bar
 call dein#add('vim-airline/vim-airline-themes')            " themes for above
 call dein#add('ryanoasis/vim-devicons')                    " nerdfonts symbols

 call dein#add('luochen1990/rainbow')                       " rainbow perens etc.
 call dein#add('nathanaelkane/vim-indent-guides')           " indent level highlighting
 call dein#add('farmergreg/vim-lastplace')                  " start editing at last edit point

 call dein#add('Glench/Vim-Jinja2-Syntax')                  " highlight {% jinja %} shit in .html files
 " call dein#add('neoclide/vim-jsx-improve')
 " call dein#add('janko-m/vim-test')                        
 call dein#add('redcartel/Redrc.vim')                       " my .vimrc
 if !has('nvim')
   "call dein#add('roxma/nvim-yarp')
   "call dein#add('roxma/vim-hug-neovim-rpc')
 endif

 call dein#end()
 call dein#save_state()
endif

filetype plugin indent on
syntax enable

set mouse=a
let mapleader="\<SPACE>"
colorscheme materialbox

" Alt+arrows moves through buffer history
" set hidden
nmap <M-LEFT> gbp
nmap <M-RIGHT> gbn

" turn on indent guides
let g:indent_guides_enable_on_vim_startup = 1

let g:airline_powerline_fonts = 1
let g:airline_theme="zenburn"
let g:airline#extensions#enabled = 1

let g:rainbow_active = 1 

	autocmd FileType defx call s:defx_my_settings()
	function! s:defx_my_settings() abort
	  " Define mappings
	  nnoremap <silent><buffer><expr> <CR>
                  \ defx#do_action('drop')
	  nnoremap <silent><buffer><expr> c
	  \ defx#do_action('copy')
	  nnoremap <silent><buffer><expr> m
	  \ defx#do_action('move')
	  nnoremap <silent><buffer><expr> p
	  \ defx#do_action('paste')
	  nnoremap <silent><buffer><expr> l
	  \ defx#do_action('open')
	  nnoremap <silent><buffer><expr> E
	  \ defx#do_action('open', 'vsplit')
	  nnoremap <silent><buffer><expr> P
	  \ defx#do_action('open', 'pedit')
	  nnoremap <silent><buffer><expr> K
	  \ defx#do_action('new_directory')
	  nnoremap <silent><buffer><expr> N
	  \ defx#do_action('new_file')
	  nnoremap <silent><buffer><expr> M
	  \ defx#do_action('new_multiple_files')
	  nnoremap <silent><buffer><expr> d
	  \ defx#do_action('remove')
	  nnoremap <silent><buffer><expr> r
	  \ defx#do_action('rename')
	  nnoremap <silent><buffer><expr> !
	  \ defx#do_action('execute_command')
	  nnoremap <silent><buffer><expr> x
	  \ defx#do_action('execute_system')
	  nnoremap <silent><buffer><expr> yy
	  \ defx#do_action('yank_path')
	  nnoremap <silent><buffer><expr> .
	  \ defx#do_action('toggle_ignored_files')
	  nnoremap <silent><buffer><expr> ;
	  \ defx#do_action('repeat')
	  nnoremap <silent><buffer><expr> h
	  \ defx#do_action('cd', ['..'])
	  nnoremap <silent><buffer><expr> ~
	  \ defx#do_action('cd')
	  nnoremap <silent><buffer><expr> q
	  \ defx#do_action('quit')
	  nnoremap <silent><buffer><expr> <Space>
	  \ defx#do_action('toggle_select') . 'j'
	  nnoremap <silent><buffer><expr> *
	  \ defx#do_action('toggle_select_all')
	  nnoremap <silent><buffer><expr> j
	  \ line('.') == line('$') ? 'gg' : 'j'
	  nnoremap <silent><buffer><expr> k
	  \ line('.') == 1 ? 'G' : 'k'
	  nnoremap <silent><buffer><expr> <C-l>
	  \ defx#do_action('redraw')
	  nnoremap <silent><buffer><expr> <C-g>
	  \ defx#do_action('print')
	  nnoremap <silent><buffer><expr> cd
	  \ defx#do_action('change_vim_cwd')
	endfunction

au BufNewFile,BufRead netrw Defx
call ale#Set('javascript_prettier_standard_options', '')
let g:ale_linters = {}
let g:ale_linters["python"] = ["pyls"] "flake8
let g:ale_linters["javascript"] = ["eslint", "tsserver"]
let g:ale_linters["css"] = ["vscode-css-languageservice"]
let g:ale_linters["markdown"] = ["write-good"]
let g:ale_linters["html"] = ["htmlhint", "tsserver", "vscode-css-languageservice"]
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
nnoremap <Leader>K <Plug>(ale_previous_wrap)
nnoremap <Leader>J <Plug>(ale_next_wrap)
nnoremap <Leader>D :ALEGoToDefinition<CR>
nnoremap <Leader>F <Plug>(ale_find_references)
nmap <Leader>H <Plug>(ale_hover)
nmap <C-s> :windo lcl\|ccl<CR>

"testing
nmap <Leader>tp :!zsh -c "export PYTHONPATH=$(pwd); pytest"<CR>

:highlight Normal ctermfg=white ctermbg=232 

"mouse

"folds

"fast movement
nnoremap <Leader>j 20j
nnoremap <Leader>k 20k

nnoremap <Leader>a zA
nnoremap <Leader>m zm
nnoremap <Leader>r zr
nnoremap <Leader>R :set nofoldenable<CR>
nnoremap <Leader>M :set foldenable<CR>

"clear search
nnoremap <Leader>/ :nohl<CR>
set background=dark
