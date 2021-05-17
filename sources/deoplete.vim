"----------------------------------------------
" Plugin: Shougo/deoplete.nvim
"----------------------------------------------
if has('nvim')
    " Enable deoplete on startup
    let g:deoplete#enable_at_startup = 1
endif

" Disable deoplete when in multi cursor mode
"function! Multiple_cursors_before()
    "let b:deoplete_disable_auto_complete = 1
"endfunction

"function! Multiple_cursors_after()
    "let b:deoplete_disable_auto_complete = 0
"endfunction

let g:deoplete#sources#go#gocode_binary = $HOME.'/go/bin/gocode'
"let g:deoplete#sources#go#source_importer = 1
" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

 "<CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return deoplete#mappings#smart_close_popup() . "\<CR>"
"endfunction

call deoplete#custom#option({
\ 'auto_complete_delay': 0,
\ 'auto_refresh_delay': 10,
\})
