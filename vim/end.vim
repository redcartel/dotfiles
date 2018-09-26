"if executable('pyls')
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'pyls',
"        \ 'cmd': {server_info->['pyls']},
"        \ 'whitelist': ['python'],
"        \ 'workspace_config': {'pyls': {'plugins': {'flake8': {'enabled': v:true}}}}
"        \ })
"endif

let g:ale_completion_enabled=1
let g:airline#extensions#ale#enbled=1
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_fixers = ['autopep8', 'yapf']
let g:ale_linters = {'python': ['pylint', 'flake8', 'pyls']}
