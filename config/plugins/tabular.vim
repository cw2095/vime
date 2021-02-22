" If you were in normal or visual mode, you could type \a= to align equals signs.
" In visual mode, the alignment would apply to the selected lines,
" but in normal mode tabular would attempt to guess the range.
 " if exists(":Tabularize")
    " nnoremap <Leader>a= :Tabularize /=<CR>
    " vnoremap <Leader>a= :Tabularize /=<CR>
    " nnoremap <Leader>a: :Tabularize /:\zs<CR>
    " vnoremap <Leader>a: :Tabularize /:\zs<CR>
" endif

vnoremap <Leader>a :Tabularize /
