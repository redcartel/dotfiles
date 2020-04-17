     " TODO: Write README, python language server

     " CHEATSHEET
     " \ = <leader>
     " \t              : Toggle NERDTree and set hidden
     " M-left, M-right : next / prev buffer
     " :Cb             : close windows and saved buffers except the current one
     " :Sn <tab complete> : insert simplesnip
     " gc              : comment / uncoment

     " g[, g]          : go to next / prev langserver linting error
     " gd              : go to definition
     " gy              : go to type definition
     " gi              : go to implementation
     " gr              : go to references 
     " K               : show documentation
     " \rn             : rename TODO 
     " \fm             : format file or vis selection
     " \a              : diagnostics (see errors)
" \ = <leader>
" :Sn <tab complete> : insert simplesnip
" gc              : comment / uncoment

" g[, g],		  	: go to next / prev langserver linting error	 
" M-down, M-up 	  	: go to next / prev langserver linting error
" gd              	: go to definition
" gy              	: go to type definition
" gi              	: go to implementation
" gr              	: go to references 
" gh              	: show documentation
" ge              	: diagnostics (list errors)
" gn          		: rename  
" gf        	   	: format file or vis selection
" :TestSuite :TestFile :TestLast :TestVisit - running unit tests
" TODO: actually start using fugitive

" ctrl+arrows 	  	: jump windows
" ctrl+o			: close non editor windows, make editor the only win
" tn				: open NERDTree, t to open file in new tab
" to				: open new tab
" tc				: close tab
" M-left M-right	: navigate tabs
" t1 t2	...			: jump to numbered tab (1-9)
" t0				: jump to last tab

" \ff 				: unfold all
" \fa				: fold / unfold here (zA)
" \f0 \f1 ... 		: set foldlevel=

" TOC
" part 1: normal vimrc
" part 2: custom functions & commands
" part 3: packages
" part 4: plugin settings
" part 5: plugin dependant custom functions and commands
" colorscheme at end of file

" TODO: test vimrc on vim w/ minimal compile options (& no Vundle)

" ===== part 1: normal vimrc =====

" be improved
set nocompatible 
" poor man's vcs / file behavior
set noswapfile " swapfiles suck
set undofile
set undodir=~/.vim/undo
set history=10000
set autoread

" if available, mouse is on
if has("mouse") | set mouse=a | endif
"" If compiled with clipboard support, use system clipboard for yank & pull
if has("clipboard") | set clipboard=unnamedplus | endif
" use tabs for indents, default display is 4 characters
set ts=4
set sw=4
set noexpandtab
set autoindent
if has("smartindent") | set smartindent | endif
" display tabs as two characters for some filetypes
augroup specialindents
    au FileType javascript setlocal sw=2 ts=2
    au FileType json setlocal sw=2 ts=2
    au FileType html setlocal ts=2 sw=2
    au FileType jsx setlocal ts=2 sw=2
    au FileType css setlocal ts=2 sw=2
augroup END
" misc appearance and behavior
set title
set number
set signcolumn=yes
set laststatus=1
if has("statusline") | set statusline+=%{coc#status()} | endif
set ruler
set colorcolumn=80
set showcmd
set showmatch
set matchtime=3
if has("wildmenu") | set wildmenu | endif
set shortmess+=c
set updatetime=300
set scrolloff=2
if has("termguicolors") | set termguicolors | endif
" spellcheck off by default
set nospell

" ===== part 2: custom functions & commands =====

" Vimrc edits .vimrc Svimrc sources it
command! Vimrc edit ~/.vimrc
command! Svimrc source ~/.vimrc

"" no ex mode or macros
nnoremap Q <nop>
map q <nop>

" ctrl S/Q work like normal, must have this in bashrc (what I put up top):

" #! /bin/bash
" #PATH=			# might want to set PATH here so all shells get it
" case $- in 		# exit bashrc for non-interactive shell
"    *i*) ;;
"      *) return;;
" esac
" stty -ixon 		# turn off unwanted Ctrl-command behavior
" # ... rest of the bashrc

"" Ctrl-S saves all
map <C-S> <esc>:wa<cr>
"" Ctrl-Q tries to quit
map <C-Q> <esc>:qa<cr>

"" don't deselect in visual mode when using indent / deindent
vmap < <gv
vmap > >gv
"" window jumps with C+arrows
map <C-right> <C-W>l
map <C-left> <C-W>h
map <C-down> <C-W>j
map <C-up> <C-W>k
"" switch tabs with M+left or right
map <silent> <M-left> <esc>:tabprevious<cr>
map <silent> <M-right> <esc>:tabnext<cr>
"" to opens new tab
nmap to <esc>:tabnew<cr>
nmap tc <esc>:tabclose<cr>
"" navigate tabs with t+numbers
nmap t1 1gt
nmap t2 2gt
nmap t3 3gt
nmap t4 4gt
nmap t5 5gt
nmap t6 6gt
nmap t7 7gt
nmap t8 8gt
nmap t9 9gt
nmap t0 :tablast<cr>

" folds on but unfolded at start
set foldenable
set foldmethod=indent
set foldlevel=999
command! -nargs=1 F :set foldlevel=<args>
" \f does fold commands
nnoremap <Leader>ff :set foldlevel=99<CR>
nnoremap <Leader>fa zA
nnoremap <Leader>f0 :set foldlevel=0<CR>
nnoremap <Leader>f1 :set foldlevel=1<CR>
nnoremap <Leader>f2 :set foldlevel=2<CR>
nnoremap <Leader>f3 :set foldlevel=3<CR>
nnoremap <Leader>f4 :set foldlevel=4<CR>
nnoremap <Leader>f5 :set foldlevel=5<CR>
nnoremap <Leader>f6 :set foldlevel=6<CR>
nnoremap <Leader>f7 :set foldlevel=7<CR>
nnoremap <Leader>f8 :set foldlevel=8<CR>
nnoremap <Leader>f9 :set foldlevel=9<CR>



call plug#begin(stdpath('data') . '/plugged')
 
 " IDE STYLE PRESENTATION:

 " file explorer (\t toggles and turns on hidden mode)
 Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
 " git integration, see docs
 Plug 'tpope/vim-fugitive'
 Plug 'airblade/vim-gitgutter'
 Plug 'Xuyuanp/nerdtree-git-plugin'
 " show buffers on tabline 
 Plug 'ap/vim-buftabline' 
 " syntax highlighting
 Plug 'rafi/awesome-vim-colorschemes'
 Plug 'neoclide/vim-jsx-improve'
 " commenting ((visual) gc, gc(motion), gcgc in normal)
 Plug 'tpope/vim-commentary'
 " jump to last place in file when opening
 Plug 'farmergreg/vim-lastplace'

 " POWER TOOLS: langserver, integrated testing, TODO: debugger
 " langserver, see github for install packages
 " TODO: write cheatsheet, see bottom section of this file
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 " run unit tests with :TestSuite :TestFile :TestLast (\t)
 " jump to last open test file with :TestVisit
 Plug 'janko/vim-test'

 " MY PLUGINS:
 Plug 'redcartel/simplesnips.vim'

call plug#end()

set mouse=a
set updatetime=300
set shortmess+=c
set signcolumn=yes

let g:simplesnipsDir= $HOME . '/etc/simplesnips'

" :Cb closes all saved buffs other than current one
function! CloseOtherSavedBuffs()
    " close non-editor windows & buffs
    NERDTreeClose | lcl | ccl | pc | only
    " get current buff number
    let l:current_buff_num = bufnr('')
    " silently execute bd on each buffer except the current one
    bufdo if (bufnr('') != current_buff_num) | silent! bd | endif
    " switch back to current buffer
    exec 'b ' . l:current_buff_num
endfun

command! Cb call CloseOtherSavedBuffs()

nmap <M-Up>:NERDTreeClose \| lcl \| ccl \| pc \| only
nmap <Leader>t :NERDTreeToggle<CR>:set hidden<CR>
nmap <M-Left> :bp<CR>
nmap <M-Right> :bn<CR>

"i LANGSERVER COMMAND START
    nmap <silent> g[ <Plug>(coc-diagnostic-prev)
    nmap <silent> g] <Plug>(coc-diagnostic-next)
	nmap <silent> <M-Up> <Plug>(coc-diagnostic-prev)
    nmap <silent> <M-Down> <Plug>(coc-diagnostic-next)
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
	" from the readme, but I didn't do the thing that changes the tab key
    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
        endif
    endfunction
    "nnoremap <silent> K :call <SID>show_documentation()<CR>
	nmap <silent> K :call <SID>show_documentation()<CR>  
    nmap <silent> ge :<C-u>CocList diagnostics<cr>
    
	" I've set coc actions that change the code to start with leader
	nmap <silent> gn <Plug>(coc-rename)<CR>
    nmap <silent> gf <Plug>(coc-format)<CR>
    vmap <silent> gf <Plug>(coc-format-selected)<CR>


	" ===== part 5 : plugin dependant custom commands =====
    
	command! -nargs=0 Format :call CocAction('format')

" nmap <silent> g[ <Plug>(coc-diagnostic-prev)
" nmap <silent> g] <Plug>(coc-diagnostic-next)

" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" function! s:show_documentation()
"     if (index(['vim','help'], &filetype) >= 0)
"         execute 'h '.expand('<cword>')
"     else
"         call CocAction('doHover')
"     endif
" endfunction

" nnoremap <silent> K :call <SID>show_documentation()<CR>
" nmap <leader>rn <Plug>(coc-rename)<CR>
" nmap <leader>fm <Plug>(coc-format)<CR>
" vmap <leader>fm <Plug>(coc-format-selected)<CR>

" command! -nargs=0 Format :call CocAction('format')
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" inoremap <leader>a :<C-u>CocList diagnostics<cr>

augroup cocAu
    autocmd CursorHold * silent call CocActionAsync('highlight')
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

command! Vimrc :e ~/.config/nvim/init.vim
command! Svimrc :source ~/.config/nvim/init.vim

"LANGSERVER COMMAND STOP
