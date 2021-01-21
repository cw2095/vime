" 自定义tabline

" if common#functions#HasPlug('vim-crystalline')
"     \ || common#functions#HasPlug('lightline.vim')
"     \ || common#functions#HasPlug('vim-airline')
"     finish
" set showtabline=2
" endif

let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1
" noremap to :XTabCycleMode<CR>
