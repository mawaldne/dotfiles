func! s:setup_ls(...) abort
    let l:servers = lsp#get_allowed_servers()

    for l:server in l:servers
        let l:cap = lsp#get_server_capabilities(l:server)

        if has_key(l:cap, 'completionProvider')
            setlocal completefunc=lsp#complete
        endif

        if has_key(l:cap, 'hoverProvider')
            setlocal keywordprg=:LspHover
        endif

        if has_key(l:cap, 'codeActionProvider')
            nmap <silent><buffer>ga <plug>(lsp-code-action)
        endif

        if has_key(l:cap, 'definitionProvider')
            nmap <silent><buffer>gd <plug>(lsp-definition)
            nmap <silent><buffer>gk <plug>(lsp-peek-definition)
        endif
    endfor
endfunc

augroup LSC
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'gopls',
                \ 'cmd': {_->['gopls']},
                \ 'allowlist': ['go']
                \})

    autocmd User lsp_server_init call <SID>setup_ls()
    autocmd BufEnter * call <SID>setup_ls()
augroup END

let g:lsp_diagnostics_enabled                = 0
let g:lsp_diagnostics_signs_enabled          = 0
let g:lsp_diagnostics_virtual_text_enabled   = 0
let g:lsp_diagnostics_highlights_enabled     = 0
let g:lsp_document_code_action_signs_enabled = 0
