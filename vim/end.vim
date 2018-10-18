"if executable('pyls')
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'pyls',
"        \ 'cmd': {server_info->['pyls']},
"        \ 'whitelist': ['python'],
"        \ 'workspace_config': {'pyls': {'plugins': {'flake8': {'enabled': v:true}}}}
"        \ })
"endif

