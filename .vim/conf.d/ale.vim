let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_open_list = 1
let g:ale_lint_on_text_changed = 'never'

let g:ale_fixers = {}
let g:ale_fixers.javascript = [
\ 'eslint',
\]

nmap <leader>f :ALEFix<CR>
