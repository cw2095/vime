" Preview the function signature circularly in the command line
" noremap <F6> :PreviewSignature!<cr>
" inoremap <F6> <c-\><c-o>:PreviewSignature!<cr>

noremap <F9> :PreviewTag<cr>
noremap <m-up> :PreviewScroll -1<cr>
noremap <m-down> :PreviewScroll +1<cr>
inoremap <m-up> <c-\><c-o>:PreviewScroll -1<cr>
inoremap <m-down> <c-\><c-o>:PreviewScroll +1<cr>
" With the keymaps above, you can use <m-u> and <m-d> directly to scroll
" preview window without switching window or leaving insert mode.

" When you are done, press CTRL+w z to close the preview window or
" :PreviewGoto to open the previewing file and location in a non-preview
" window.split
nnoremap <c-w>e :PreviewGoto edit<cr>
nnoremap <c-w>s :PreviewGoto split<cr>
nnoremap <c-w>v :PreviewGoto vsplit<cr>
nnoremap <c-w>t :PreviewGoto tabe<cr>

" This command can preview files listed in quickfix window without opening it directly
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
