let mapleader=" "
call plug#begin('~/.vim/plugged')
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'deoplete-plugins/deoplete-jedi'
"Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/nerdtree'
Plug 'luochen1990/rainbow'
Plug 'psf/black'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'
call plug#end()
let g:deoplete#enable_at_startup = 1
let g:rainbow_active = 1
"Toggle Transparency
let t:is_transparent = 0
function! Toggle_transparent()
    if t:is_transparent == 0
        hi Normal guibg=NONE ctermbg=NONE
        let t:is_transparent = 1
    else
        set background=dark
        let t:is_tranparent = 0
    endif
endfunction
nnoremap <C-t> : call Toggle_transparent()<CR>

"Backup options
set swapfile
set directory ^=~/.vim/swap//
set writebackup
set nobackup
set backupcopy=auto
set backupdir^=~/.vim/backup//

"Persist the undo tree for each file
set undofile
set undodir^=~/.vim/undo//

colorscheme badwolf
set termguicolors
filetype plugin indent on
syntax on
syntax enable
set showcmd
set lazyredraw
set wildmenu
"set wildmode=list:longest,list:full
set cursorline
set encoding=utf-8
"set number
set showmatch
set relativenumber
set clipboard=unnamedplus
set spell spelllang=en_us
"set mouse=a

"Searching
set incsearch
set hlsearch

"Turn off search highlight
nnoremap <Leader>N :nohlsearch<CR>

"Tab indents
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix

" source $MYVIMRC reloads the saved $MYVIMRC
:nmap <Leader>s :source $MYVIMRC<CR>


"custom keybinds

"Key remappings
"nnoremap <Leader>b :Black<CR>
nnoremap <Leader>p :!python %<CR>
nnoremap <Leader>G :Git add .<CR>
nnoremap <Leader>d :ALEGoToDefinition<CR>
nmap     <Leader>H <Plug>(ale_hover)
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

"split resizing
noremap <C-w>k :resize +5<CR>
noremap <C-w>j :resize -5<CR>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Search configuration
set ignorecase
set smartcase

"Airline Config
"let g:airline_left_sep  = ''
"let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let g:airline_detect_spell=0
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'
let g:airline#extensions#default#layout = [
      \ [ 'a', 'c' ],
      \ [ 'z']
      \ ]

"let g:airline_mode_map = {
"      \ '__'     : '-',
"      \ 'c'      : 'C',
"      \ 'i'      : 'I',
"      \ 'ic'     : 'I',
"      \ 'ix'     : 'I',
"      \ 'n'      : 'N',
"      \ 'multi'  : 'M',
"      \ 'ni'     : 'N',
"      \ 'no'     : 'N',
"      \ 'R'      : 'R',
"      \ 'Rv'     : 'R',
"      \ 's'      : 'S',
"      \ 'S'      : 'S',
"      \ ''     : 'S',
"      \ 't'      : 'T',
"      \ 'v'      : 'V',
"      \ 'V'      : 'V',
"      \ ''     : 'V',
"     \ }
" indentLines
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

autocmd FileType python setlocal completeopt-=preview
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"let g:python3_host_prog = '/home/c/.nvim/env/bin/python3'

" ALE 
let g:ale_completion_enabled = 1
let g:ale_close_preview_on_insert = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 1
let g:ale_sign_column_always = 1
let g:ale_warn_about_trailing_whitespace = 0
"let g:ale_set_balloons = 1
let g:ale_python_pylint_use_global = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['pyls']}
"let g:ale_open_list = 1
"let g:ale_list_window_size = 5
"let g:ale_python_executable = "python3"
set completeopt+=noinsert
"let g:ale_fixers["python"] = ["black"]
"let g:ale_lint_on_text_changed = 0
"let g:ale_lint_on_enter = 0

"Nerdtree
map <C-n> :NERDTreeToggle<CR>
" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.

" All messages and errors will be ignored.
silent! helptags ALL
