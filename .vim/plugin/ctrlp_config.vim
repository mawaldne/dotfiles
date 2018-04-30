"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Ctrl P
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" The Silver Searcher
"if executable('ag')
"" Use ag over grep
"  set grepprg=ag\ --nogroup\ --nocolor

"  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

"  " ag is fast enough that CtrlP doesn't need to cache
"  let g:ctrlp_use_caching = 0
"endif

"" bind \ (backward slash) to grep shortcut
"command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

"nnoremap \ :Ag<SPACE>

"" Search open buffers for file
"nnoremap <c-u> :CtrlPBuffer<cr>

"" Show hidden files
"let g:ctrlp_show_hidden = 1

