" Carter's Neovim configuration. Jan 2020
scriptencoding utf-8

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')
 call dein#add('~/.cache/dein')

 " sensible defaults (still needed for nvim?, eh, don't mess with success) 
 call dein#add('tpope/vim-sensible')
 " start editing at last edit point, the one plugin I always use
 call dein#add('farmergreg/vim-lastplace')                  
 " comment out lines & blocks of code
 " see shortcuts set in Redrc
 call dein#add('tpope/vim-commentary')
 " my simple snippits plugin
 call dein#add('redcartel/simplesnips.vim')

 "          Plugins for my IDE-like-behavior setup:
 " git integration
 call dein#add('tpope/vim-fugitive')                        
 call dein#add('airblade/vim-gitgutter')                    
 " NerdTree file browser
 call dein#add('scrooloose/nerdTree')
 call dein#add('Xuyuanp/nerdtree-git-plugin')
 " langserver, linter, formatter etc.
 call dein#add('w0rp/ALE')                                  
 call dein#add('Shougo/deoplete.nvim')

 "          Appearance and Theme (See custom Airline theme change for errs below)
 " airline & themes
 call dein#add('vim-airline/vim-airline')                   
 call dein#add('vim-airline/vim-airline-themes')            
 " more nerdfonts symbols
 call dein#add('ryanoasis/vim-devicons')                    

 "          Language Specific Plugins
 " better highlighting
 call dein#add('sheerun/vim-polyglot')
 " other javascript syntax, etc.
 call dein#add('pangloss/vim-javascript')
 " TODO: do I need both jsx plugins?
 call dein#add('mxw/vim-jsx')
 call dein#add('neoclide/vim-jsx-improve')
 call dein#add('sourcegraph/javascript-typescript-langserver')
 " HTML & css
 call dein#add('othree/html5.vim')
 call dein#add('hail2u/vim-css3-syntax')
 call dein#add('othree/csscomplete.vim')
 call dein#add('vscode-langservers/vscode-css-languageserver-bin')

 "          Rainbow perens and delmit & tag completion
 call dein#add('Raimondi/delimitMate')
 call dein#add('alvan/vim-closetag')
 call dein#add('luochen1990/rainbow')                       
 
 " my shared .vimrc
 " call dein#add('redcartel/Redrc.vim')
 " on my local setup I source this at the end of the file

 call dein#end()
 call dein#save_state()
 
endif
"
filetype plugin indent on
syntax on
syntax enable

" ======================== NERDTree & buffer switching ======================
"'
"' IDE like behavior.
" <Leader>n opens NerdTree and sets hidden mode.

"' Alt-left & right closes ALE & NT windows and then navigates to next or
"' previous buffer. Alt-up closes NerdTree and then makes the current window
"' the only window.

" Use Airline's tabline with all of this

"' <Leader>bd closes all saved buffers except current one
"' <Leader>Q first closes all saved buffs and then attempts to quit vim
"' <Leader>c closes NERDTree & ALE windows and then tries to close the current buffer
"' <Leader>o closes NERDTree & ALE windows and then makes the window the only window

nmap <Leader>n <esc>:set hidden \| NERDTreeToggle<CR>

" Close the various non-file windows.
command! NTIDECloseOther NERDTreeClose | lcl | ccl | pc
command! NTIDEClose NERDTreeClose | lcl | ccl | pc | bd
command! NTIDEOnly NERDTreeClose | lcl | ccl | pc | only
command! NTIDEBn NERDTreeClose | lcl | ccl | pc | bn 
command! NTIDEBp NERDTreeClose | lcl | ccl | pc | bp

nmap <Leader>bd :NTIDEClose<cr>
nmap <Leader>c :NTIDECloseOther 
nmap <Leader>o :NTIDEOnly
nmap <M-Right> :NTIDEBn
nmap <M-Left> :NTIDEBp

function! CloseOtherSavedBuffs()
    " attempt to close all buffers except the current one. Won't close unsaved
    " buffers in hidden mode
    NTIDEOnly
    let current_buff_num = bufnr('')
    " silently execute bd on each buffer except the current one
    bufdo if (bufnr('') != current_buff_num) | silent! bd | endif
    " switch back to current buffer
    exec 'b ' . current_buff_num
endfun

" why does \bd close OTHER buffs and not this one? I dunno, makes sense to my
" fingers
nmap <Leader>bd <esc>:call CloseOtherSavedBuffs()<cr>
nmap <Leader>Q <esc>:call CloseOtherSavedBuffs() \| qa<CR>


" =============================== ALE Linting & Langserver ===================

" needed for intellisense dropdown
let deoplete#enable_at_startup=1

" intellisense completing with docs in preview window
let g:ale_completion_enabled = 1
set completeopt+=noinsert
set completeopt+=preview

" don't auto-lint in insert mode
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 750

let g:ale_warn_about_trailing_whitespace = 0
let g:ale_sign_column_always = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_open_list = 1

let g:ale_linters = {}
let g:ale_fixers = {}

let g:ale_linters_explicit = 1
let g:ale_linters['javascript'] = ['tsserver', 'eslint']
let g:ale_linters['typescript'] = ['tsserver', 'tslint']
let g:ale_linters['python'] = ['pyls']
let g:ale_linters['htmldjango'] = ['htmlhint']
let g:ale_linters['html'] = ['htmlhint', 'eslint', 'css-languageserver']
let g:ale_linters['css'] = ['css-languageserver']
let g:ale_linters['vim'] = ['vint', 'ale_custom_linting_rules']
let g:ale_linters['json'] = ['jsonlint']

let g:ale_fixers['javascript'] = ['eslint', 'prettier']
let g:ale_fixers['typescript'] = ['tslint', 'prettier']
let g:ale_fixers['python'] = ['black']
let g:ale_fixers['css'] = ['prettier']
let g:ale_fixers['html'] = ['prettier']
let g:ale_fixers['htmldjango'] = ['prettier']
let g:ale_fixers['json'] = ['prettier']

let g:ale_python_executable = 'python3'
let g:ale_python_auto_pipenv = 1
let g:ale_python_pylint_use_global = 1

" alt+k/j jumps up and down Errors (not Warnings)
nnoremap <M-k> :ALEPrevious -wrap -error <CR>
nnoremap <M-j> :ALENext -wrap -error <CR>

nnoremap <Leader>agd :ALEGoToDefinition<CR>
nnoremap <Leader>agtd :ALEGoToDefinitionInTab<CR>
nnoremap <Leader>afr :ALEFindReferences<CR>
nnoremap <Leader>afi :ALEFix<CR>

" "\d or \h(turned off) tries both Documentation (ts-server) and Hover (most others)
nnoremap <Leader>ad :ALEDocumentation \| ALEHover<CR>
nnoremap <Leader>ah :ALEDocumentation \| ALEHover<CR>

" manual control
nnoremap <Leader>al :ALELint<CR>

nnoremap <Leader>aT :ALEToggle<CR>
nnoremap <Leader>aR :ALEReset<CR>
nnoremap <Leader>aD :ALEDisable<CR>
nnoremap <Leader>abD :ALEDisableBuffer<CR>
nnoremap <Leader>aE :ALEEnable<CR>
nnoremap <Leader>aR :ALEReset<CR>

" make the preview window a little less obnoxious 
" returning to normal mode auto-hides it. could possibly
" fuck up a plugin in the future, i don't know.
augroup clospreview
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

" ================= change airline theme based on ale error count ============"
let g:no_errs_theme = 'light'
let g:has_errs_theme = 'base16' 
" optimization, don't execute AirlineTheme if count hasn't changed
let g:lasterrcount = -2

function! BufHasErrors(buffno)
    if has_key(g:ale_buffer_info, a:buffno) && has_key(g:ale_buffer_info[a:buffno], 'count')
        if g:ale_buffer_info[a:buffno]['count']['error'] == g:lasterrcount
            return -1
        else
            let g:lasterrcount = g:ale_buffer_info[a:buffno]['count']['error']
            return g:ale_buffer_info[a:buffno]['count']['error']
        endif
    else
        return -1
    endif
endfunction

function! AirlineErrors()
    let haserrors = BufHasErrors(bufnr('%'))
    if haserrors < 0
        return
    elseif haserrors >= 1
        execute 'AirlineTheme ' . g:has_errs_theme
    else
        execute 'AirlineTheme ' . g:no_errs_theme
    endif
endfunction

command! ErrColors call AirlineErrors

augroup ErrorCheck
    autocmd CursorHold,CursorHoldI,TextChanged,TextChangedI,InsertLeave,InsertEnter,BufWrite * call AirlineErrors()
    autocmd BufEnter * let g:lasterrcount = -2
augroup END

"'' ========================= Airline ==========================================
"'
let g:airline_powerline_fonts = 1
let g:airline_theme=g:no_errs_theme
let g:airline#extensions#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

"'' ========================== Simple Snips (my plugin!) =======================
"' usage :Sn snippitname 

let g:simplesnipsDir= $HOME . '/dotfiles/vim/snips/'

"'' ============================== Rainbow Parentheses =========================
"'
let g:rainbow_active = 1 
let g:rainbow_conf = {
	\	'guifgs': ['lightgreen', 'lightred', 'lightyellow', 'lightblue'],
	\	'ctermfgs': ['lightgreen', 'lightred', 'lightyellow', 'lightblue'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\	}
	\}

let s:vimbundlepath = glob('~/.vim/bundle')
let s:redrcpath = '/Redrc.vim/plugin/Redrc.vim'

if !exists('g:redrc') && !empty(s:vimbundlepath . s:redrcpath)
    exec 'source ' . s:vimbundlepath . s:redrcpath
endif
