let g:coc_fzf_preview = 'up:50%:wrap'
let g:coc_fzf_opts = []


if common#functions#HasPlug('vim-bookmarks')
    " add_list_source(name, description, command)
    call coc_fzf#common#add_list_source('bookmarks', 'display bookmarks', 'BookmarkShowAll')
endif

" delete_list_source(name)
" call coc_fzf#common#delete_list_source('fzf-buffers')

" 因为要配合coc，因此快捷键放到了coc.nvim.vim文件中了
"
" nnoremap <silent> <space>a  :<C-u>CocFzfList diagnostics<CR>
" nnoremap <silent> <space>b  :<C-u>CocFzfList diagnostics --current-buf<CR>
" nnoremap <silent> <space>c  :<C-u>CocFzfList commands<CR>
" nnoremap <silent> <space>e  :<C-u>CocFzfList extensions<CR>
" nnoremap <silent> <space>l  :<C-u>CocFzfList<CR>
" nnoremap <silent> <space>l  :<C-u>CocFzfList location<CR>
" nnoremap <silent> <space>o  :<C-u>CocFzfList outline<CR>
" nnoremap <silent> <space>O  :<C-u>CocFzfList symbols<CR>
" nnoremap <silent> <space>s  :<C-u>CocFzfList services<CR>
" nnoremap <silent> <space>p  :<C-u>CocFzfListResume<CR>
