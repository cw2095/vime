" 自定义tabline

" if common#functions#HasPlug('vim-crystalline')
"     \ || common#functions#HasPlug('lightline.vim')
"     \ || common#functions#HasPlug('vim-airline')
"     finish
" set showtabline=2
" endif

if common#functions#HasPlug('vim-xtabline')
    let g:xtabline_settings = {}
    let g:xtabline_settings.enable_mappings = 0
    let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
    let g:xtabline_settings.enable_persistance = 0
    let g:xtabline_settings.last_open_first = 1

    let g:xtabline_settings.indicators = {
        \ 'modified': '[+]',
        \ 'pinned': '[🏷️ ]',
        \}

    let g:xtabline_settings.icons = {
        \'pin': '🏷️ ',
        \'star': '★',
        \'book': '📚',
        \'lock': '🔒',
        \'hammer': '🛠 ',
        \'tick': '✔',
        \'cross': '✖',
        \'warning': '⚠',
        \'menu': '☰',
        \'apple': '🍎',
        \'linux': '🐧',
        \'windows': '⌘',
        \'git': '',
        \'palette': '🎨',
        \'lens': '🔍',
        \'flag': '🏳️.',
        \}
    silent! nmap <BS> <Plug>(XT-Select-Buffer)
    " noremap to :XTabCycleMode<CR>
endif
