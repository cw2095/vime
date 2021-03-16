" Tab or shift+TAB to cycle keywords, <c-e> to cancel.

" Commands
" :ApcEnable - Enable plugin for the current buffer manually. Useful when you didn't set g:apc_enable_ft.
" :ApcDisable - Disable plugin for the current buffer.

" If you are using YouCompleteMe, disable it for certain filetypes:
" let g:ycm_filetype_blacklist = {'text':1, 'markdown':1, 'php':1}
" enable this plugin for filetypes, '*' for all files.
let g:apc_enable_ft = {'text':1, 'markdown':1, 'php':1}
