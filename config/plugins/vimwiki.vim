" TODO 判断vimwiki_path是否存在

" Registered Wiki
"
" let wiki_1 = {}
" let wiki_1.path = '~/my_docs/'
" let wiki_1.html_template = '~/public_html/template.tpl'
" let wiki_1.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
"
" let wiki_2 = {}
" let wiki_2.path = '~/project_docs/'
" let wiki_2.index = 'main'
"
" let g:vimwiki_list = [wiki_1, wiki_2]

let g:vimwiki_list = [
        \ {
            \ 'path': g:vimwiki_path,
            \ 'path_html': g:vimwiki_path . 'wiki_html',
            \ 'syntax': 'markdown',
            \ 'auto_toc': 1,
            \ 'ext':'.md',
            \ 'auto_diary_index': 1,
        \ }
    \ ]

" don't make temporary wiki
let g:vimwiki_global_ext = 0

" 高亮checkbox
let g:vimwiki_hl_cb_checked = 2

" todo符号
let g:vimwiki_listsyms = '✗○◐●✓'

" 目录标题的等级
let g:vimwiki_toc_header_level = 2

" 快捷键
nmap <space>ww <esc>:<c-u>VimwikiIndex<cr>
nmap <space>wt <esc>:<c-u>VimwikiTabIndex<cr>
nmap <space>wi <esc>:<c-u>VimwikiDiaryIndex<cr>

augroup vime_vimwiki_group
    autocmd!
    autocmd FileType wiki,md,markdown setl colorcolumn=0
    autocmd FileType wiki,md,markdown setl conceallevel=0
    autocmd FileType wiki,md,markdown setl textwidth=0

    " 避免g:vimwiki_hl_cb_checked设置为2的时候有问题
    au BufEnter *.wiki :syntax sync fromstart
augroup END
