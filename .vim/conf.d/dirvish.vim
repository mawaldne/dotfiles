" Dirvish
let loaded_netrwPlugin = 1
command! Explore :Dirvish %:p:h
autocmd FileType dirvish nnoremap <buffer><silent> <c-p> :GFiles<cr>

