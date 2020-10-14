" let g:go_fmt_command =

au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

let g:go_auto_type_info = 1
let g:go_version_warning = 0

"au FileType go nmap <leader>gt :GoDeclsDir<cr>

let g:go_auto_sameids = 0

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

