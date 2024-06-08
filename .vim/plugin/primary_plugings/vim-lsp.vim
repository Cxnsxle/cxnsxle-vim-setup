" vim-lsp.vim

let g:lsp_diagnostics_enabled = 0         " disable diagnostics support

" Declaration
nmap <leader>gdd <plug>(lsp-definition)
" Definition
nmap <leader>gcc <plug>(lsp-declaratin)
" Implementation
nmap <leader>gi <plug>(lsp-implementation)
" References
nmap <leader>gr <plug>(lsp-references)
" Rename
nmap <leader>R <plug>(lsp-rename)
