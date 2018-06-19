""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Reload files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Save whenever switching windows or leaving vim. This is useful when running
" the tests inside vim without having to save all files first.
au FocusLost,WinLeave * :silent! wa

" Trigger autoread when changing buffers or coming back to vim.
au FocusGained,BufEnter * :silent! !

" When switching panes in tmux, an escape sequence is printed. Redrawing gets
" rid of it. See https://gist.github.com/mislav/5189704#comment-951447
au FocusLost * :redraw!

