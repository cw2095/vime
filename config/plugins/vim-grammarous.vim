"----------------------------------------------------------------------
" A powerful grammar checker for Vim using LanguageTool.
"----------------------------------------------------------------------

" :[range]GrammarousCheck [--lang={lang}] [--(no-)preview] [--(no-)comments-only]
" :GrammarousCheck --help
" :GrammarousReset

" Local mappings in the information window

" You can use some mappings in the information window, which is opened to show the detail of an error when the cursor moves to the error.
" Mappings    Description
" q           Quit the info window
" <CR>        Move to the location of the error
" f           Fix the error automatically
" r           Remove the error without fix
" R           Disable the grammar rule in the checked buffer
" n           Move to the next error's location
" p           Move to the previous error's location
" ?           Show help of the mapping in info window

" <Plug> mappings to execute actions anywhere

" Mappings                                   Description
" <Plug>(grammarous-move-to-info-window)     Move the cursor to the info window
" <Plug>(grammarous-open-info-window)        Open the info window for the error under the cursor
" <Plug>(grammarous-reset)                   Reset the current check
" <Plug>(grammarous-fixit)                   Fix the error under the cursor automatically
" <Plug>(grammarous-fixall)                  Fix all the errors in a current buffer automatically
" <Plug>(grammarous-close-info-window)       Close the information window from checked buffer
" <Plug>(grammarous-remove-error)            Remove the error under the cursor
" <Plug>(grammarous-disable-rule)            Disable the grammar rule under the cursor
" <Plug>(grammarous-move-to-next-error)      Move cursor to the next error
" <Plug>(grammarous-move-to-previous-error)  Move cursor to the previous error

noremap <space>rg :GrammarousCheck --lang=en-US --no-move-to-first-error --no-preview<cr>
map <space>rr <Plug>(grammarous-open-info-window)
map <space>rv <Plug>(grammarous-move-to-info-window)
map <space>rs <Plug>(grammarous-reset)
map <space>rx <Plug>(grammarous-close-info-window)
map <space>rm <Plug>(grammarous-remove-error)
map <space>rd <Plug>(grammarous-disable-rule)
map <space>rn <Plug>(grammarous-move-to-next-error)
map <space>rp <Plug>(grammarous-move-to-previous-error)
