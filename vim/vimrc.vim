set statusline=""

if has('gui_running')
    source ~/dotfiles/vim/gvim-vundle-plugins.vim
    set statusline+=%#warningmsg#
    " set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    
    set hidden
    set guioptions-=T
    source ~/.gvim/colors/bdconry.vim

    filetype plugin on
    "set omnifunc=syntaxcomplete#Complete

    " pip package
    if executable('pyls')
        au User lsp_setup call lsp#register_server({
            \ 'name': 'pyls',
            \ 'cmd' : {server_info->['pyls']},
            \ 'whitelist': ['python'],
            \ })
    endif

    " node package
    if executable('javascript-typescript-stdio')
        au User lsp_setup call lsp#register_server({
            \ 'name': 'javascript-typescript-stdio',
            \ 'cmd' : {server_info->['javascript-typescript-stdio']},
            \ 'whitelist': ['javascript', 'typescript'],
            \ })
    endif
    
    " node package
    if executable('/usr/local/lib/node_modules/vscode-html-languageserver-bin/htmlServerMain.js')
        au User lsp_setup call lsp#register_server({
            \ 'name': 'htmlServerMain',
            \ 'cmd' : {server_info->['/usr/local/lib/node_modules/vscode-html-languageserver-bin/htmlServerMain.js --stdio']},
            \ 'whitelist': ['html'],
            \ })
    endif

    set completeopt+=preview
    autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

    let g:lsp_log_verbose = 1
    let g:lsp_log_file = '/home/redcartel/tmp/vim-lsp.log'

    let g:ale_linters = {'python': ['pylint', 'flake8']}
    let g:ale_linters = {'javascript': ['eslint', 'jshint', 'prettier', 'standard']}
    let g:ale_linters_explicit = 1
    let g:ale_lint_on_save = 1
    let g:ale_open_list = 'on_save'
    let g:ale_lint_on_enter = 1
    let g:ale_sign_style_error = 'e'
    let g:ale_sign_style_warning = 'w'
    "let g:ale_type_map = {'flake8': {'ES': 'WS', 'E': 'W'}
    let g:ale_fixers = {'python': ['autopep8', 'isort', 'trim_whitespace', 'remove_trailing_lines'], 'javascript': ['standard', 'prettier', 'eslint']}

else
	source ~/dotfiles/vim/vundle-plugins.vim
endif

set ai
set statusline+=%F
set laststatus=2
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

au FileType javascript setl sw=2 sts=2 et

set number
set colorcolumn=80
set nocursorline
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline
set noswapfile
set undofile
set undodir=~/.vim/undo
