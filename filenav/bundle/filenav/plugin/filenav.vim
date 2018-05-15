set mouse=a

function! NERDTreePath.edit()
    exec system('gvim-open ' . self.str({'format': 'Edit'}))
endfunction
