" TODO: Write README, python language server

call plug#begin(stdpath('data') . '/plugged')
 
 " IDE STYLE PRESENTATION:

 " file explorer (\t toggles and turns on hidden mode)
 Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
 Plug 'Xuyuanp/nerdtree-git-plugin'

 " list open buffers on tabline ctrl-[ and ctrl-] prev/next buffer
 Plug 'ap/vim-buftabline'
 
 " git integration, see docs
 Plug 'tpope/vim-fugitive'
 Plug 'airblade/vim-gitgutter'
 
 " syntax highlighting
 "Plug 'pangloss/vim-javascript'
 Plug 'sheerun/vim-polyglot'
 Plug 'mxw/vim-jsx'

 " POWER TOOLS: langserver, integrated testing, TODO: debugger

 " langserver, see github for install packages
 " TODO: write cheatsheet, see bottom section of this file
 Plug 'neoclide/coc.nvim', {'branch': 'release'}

 " run unit tests with :TestSuite :TestFile :TestLast (\t)
 " jump to last open test file with :TestVisit
 Plug 'janko/vim-test'

 " MISC PLUGINS: 
 
 " commenting ((visual) gc, gc(motion), gcgc in normal)
 Plug 'tpope/vim-commentary'
 
 " jump to last place in file when opening
 Plug 'farmergreg/vim-lastplace'
 
 " rainbow parens
 Plug 'luochen1990/rainbow'

 " MY PLUGINS:
 
 " world's simplest snippets
 Plug 'redcartel/simplesnips.vim'

 " my standard vimrc
 Plug 'redcartel/Redrc.vim'
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

nmap <Leader>t :NERDTreeToggle<CR>:set hidden<CR>
nmap <M-Left> :bp<CR>
nmap <M-Right> :bn<CR>

" LANGSERVER COMMAND START

nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <leader>rn <Plug>(coc-rename)<CR>
nmap <leader>fm <Plug>(coc-format)<CR>
vmap <leader>fm <Plug>(coc-format-selected)<CR>

command! -nargs=0 Format :call CocAction('format')
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

nnoremap <leader>a :<C-u>CocList diagnostics<cr>

command! Vimrc :e ~/.config/nvim/init.vim
command! Svimrc :source ~/.config/nvim/init.vim

"LANGSERVER COMMAND STOP
