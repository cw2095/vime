if has('patch-8.1.2292') == 0 && exists('*nvim_open_win') == 0
    finish
endif

" Change border characters 1, 2 ,3
let g:quickui_border_style = 1
" change the color scheme: borland(default) ,gruvbox ,solarized ,papercol dark, papercol light
let g:quickui_color_scheme = 'gruvbox'
"  change preview window size
let g:quickui_preview_w = 100
let g:quickui_preview_h = 15
" enable to display tips in the cmdline
let g:quickui_show_tip = 1

call quickui#menu#reset()

call quickui#menu#install("F&ZF", [
            \ ["FZF M&ru\t<M-r>", 'History', 'FZF MRU'],
            \ ["FZF &Buffer Lines\t?", 'FzfBLines', '模糊搜索当前buffer'],
            \ ["FZF &File\t<M-f>", 'FWW', 'open file with FZF'],
            \ ["FZF H&ome File\t<M-F>", 'FWW $HOME', 'open home file with FZF'],
            \ ["FZF &Project Content\t<M-s>", 'GrepWithWiki', '1. 使用rg搜索当前工程下的文件内容 2. 如果正在编辑wiki目录下的笔记，那么使用rg会搜索wiki笔记目录下的内容 3.visural模式下选中内容之后会自动搜索选中的内容'],
            \ [ "--", ''  ],
            \ ["FZF &Windows\t<M-w>", 'Windows', 'FZF Windows'],
            \ ["FZF B&uffers\t<M-b>", 'Buffers', 'FZF Buffers'],
            \ [ "--", ''  ],
            \ ["FZF &Ex History\t<M-h>", 'History:', 'FZF Command History'],
            \ ["FZF &Vim Commands\t<M-c>", 'Commands', 'FZF Vim Commands'],
            \ ["FZF &Marks\t<M-m>", 'Marks', '模糊搜索Marks'],
            \ ["FZF &Yank\t<M-y>", 'CocFzfList yank', '模糊搜索Yanks'],
            \ ["FZF &Jumps\t<M-J>", 'FzfJumps', '模糊搜索Jumps'],
            \ ["FZF &Search History\t<M-/>", 'History/', 'FZF Search History'],
            \ ["FZF &Maps\t<M-M>", 'Maps', 'FZF Maps'],
            \ [ "--", ''  ],
            \ ["FZF &Quickfix", 'FzfQuickfix', '模糊搜索Quickfix'],
            \ ["FZF &LocationList", 'FzfLocationList', '模糊搜索LocationList'],
            \ [ "--", ''  ],
            \ ["FZF Buffer &Tags\t<M-t>", 'BTags', '模糊搜索buffer tags'],
            \ ["FZF Project T&ags\t<M-T>", 'Tags', '模糊搜索buffer tags'],
            \ ])

" install a 'File' menu, use [text, command] to represent an item.
" items containing tips, use [text, command, tips], tips will display in the cmdline
call quickui#menu#install("&File", [
            \ [ "O&pen Coc-explorer\t<F2>", 'CocCommand explorer', 'open file explorer'],
            \ [ "System&APP Open\t<M-x>", "call common#functions#OpenFileUsingSystemApp(expand('%:p'))", 'open file using system app'],
            \ [ "--", ''  ],
            \ [ "&Open\t:tabe ", 'call feedkeys(":tabe ")', 'open file in a new tap'],
            \ [ "&Save\t:write(\\w)", 'write', 'save current open buffer'],
            \ [ "Sa&ve All\t:wall", 'wall', 'save all open files'],
            \ [ "Sav&e and Quit\t:xall", 'xall', 'save all open filesand quit'],
            \ [ "&Quit\t:q(\\q)", 'quit', 'quit without save'],
            \ [ "Qui&t All\t:qall", 'qall', 'quit all without save'],
            \ ])

" script inside %{...} will be evaluated and expanded in the string
call quickui#menu#install("&Edit", [
            \ ['Set &Paste %{&paste? "Off":"On"}', 'set paste!'],
            \ ['--'],
            \ [ "Open &Undo Tree\t<F3>", 'MundoToggle', 'open undo tree'],
            \ ['--'],
            \ ['&Trailing Space', 'call StripTrailingWhitespace()', ''],
            \ ['Update &ModTime', 'call UpdateLastModified()', ''],
            \ ['&Paste Mode Line', 'PasteVimModeLine', ''],
            \ ['Format J&son', '%!python -m json.tool', ''],
            \ ['--'],
            \ ['&Align Table', 'Tabularize /|', ''],
            \ ['Align &Cheatsheet', 'MyCheatSheetAlign', ''],
            \ ])

call quickui#menu#install('&Symbol', [
            \ [ "&Grep Word\t(In Project)", 'call MenuHelp_GrepCode()', 'Grep keyword in current project' ],
            \ [ "--", ],
            \ [ "Find &Definition\t(GNU Global)", 'call MenuHelp_Gscope("g")', 'GNU Global search g'],
            \ [ "Find &Symbol\t(GNU Global)", 'call MenuHelp_Gscope("s")', 'GNU Gloal search s'],
            \ [ "Find &Called by\t(GNU Global)", 'call MenuHelp_Gscope("d")', 'GNU Global search d'],
            \ [ "Find C&alling\t(GNU Global)", 'call MenuHelp_Gscope("c")', 'GNU Global search c'],
            \ [ "Find &From Ctags\t(GNU Global)", 'call MenuHelp_Gscope("z")', 'GNU Global search c'],
            \ [ "--", ],
            \ [ "Goto D&efinition\t(YCM)", 'YcmCompleter GoToDefinitionElseDeclaration'],
            \ [ "Goto &References\t(YCM)", 'YcmCompleter GoToReferences'],
            \ [ "Get D&oc\t(YCM)", 'YcmCompleter GetDoc'],
            \ [ "Get &Type\t(YCM)", 'YcmCompleter GetTypeImprecise'],
            \ ])

call quickui#menu#install('&Move', [
            \ ["Quickfix &First\t:cfirst", 'cfirst', 'quickfix cursor rewind'],
            \ ["Quickfix L&ast\t:clast", 'clast', 'quickfix cursor to the end'],
            \ ["Quickfix &Next\t:cnext", 'cnext', 'cursor next'],
            \ ["Quickfix &Previous\t:cprev", 'cprev', 'quickfix cursor previous'],
            \ ])

call quickui#menu#install("&Build", [
            \ ["File &Execute\tF5", 'AsyncTask file-run'],
            \ ["File &Compile\tF9", 'AsyncTask file-build'],
            \ ["File E&make\tF7", 'AsyncTask emake'],
            \ ["File &Start\tF8", 'AsyncTask emake-exe'],
            \ ['--', ''],
            \ ["&Project Build\tShift+F9", 'AsyncTask project-build'],
            \ ["Project &Run\tShift+F5", 'AsyncTask project-run'],
            \ ["Project &Test\tShift+F6", 'AsyncTask project-test'],
            \ ["Project &Init\tShift+F7", 'AsyncTask project-init'],
            \ ['--', ''],
            \ ["T&ask List\tCtrl+F10", 'call MenuHelp_TaskList()'],
            \ ['E&dit Task', 'AsyncTask -e'],
            \ ['Edit &Global Task', 'AsyncTask -E'],
            \ ['&Stop Building', 'AsyncStop'],
            \ ])

call quickui#menu#install("&Git", [
            \ ['&View Diff', 'call svnhelp#svn_diff("%")'],
            \ ['&Show Log', 'call svnhelp#svn_log("%")'],
            \ ['File &Add', 'call svnhelp#svn_add("%")'],
            \ ])

call quickui#menu#install('&Tools', [
            \ ['Compare &History', 'call svnhelp#compare_ask_file()', ''],
            \ ['&Compare Buffer', 'call svnhelp#compare_ask_buffer()', ''],
            \ ['--',''],
            \ ['List &Buffer', 'call quickui#tools#list_buffer("FileSwitch tabe")', ],
            \ ['List &Function', 'call quickui#tools#list_function()', ],
            \ ['Display &Messages', 'call quickui#tools#display_messages()', ],
            \ ['--',''],
            \ ["&DelimitMate %{get(b:, 'delimitMate_enabled', 0)? 'Disable':'Enable'}", 'DelimitMateSwitch'],
            \ ['Read &URL', 'call menu#ReadUrl()', 'load content from url into current buffer'],
            \ ['&Spell %{&spell? "Disable":"Enable"}', 'set spell!', 'Toggle spell check %{&spell? "off" : "on"}'],
            \ ['&Profile Start', 'call MonitorInit()', ''],
            \ ['Profile S&top', 'call MonitorExit()', ''],
            \ ["Relati&ve number %{&relativenumber? 'OFF':'ON'}", 'set relativenumber!'],
            \ ["Proxy &Enable", 'call MenuHelp_Proxy(1)', 'setup http_proxy/https_proxy/all_proxy'],
            \ ["Proxy D&isable", 'call MenuHelp_Proxy(0)', 'clear http_proxy/https_proxy/all_proxy'],
            \ ])

call quickui#menu#install('&Plugin', [
            \ ["&NERDTree\t<space>tn", 'NERDTreeToggle', 'toggle nerdtree'],
            \ ['&Tagbar', '', 'toggle tagbar'],
            \ ["&Choose Window/Tab\tAlt+e", "ChooseWin", "fast switch win/tab with vim-choosewin"],
            \ ["-"],
            \ ["&Browse in github\trhubarb", "Gbrowse", "using tpope's rhubarb to open browse and view the file"],
            \ ["&Startify", "Startify", "using tpope's rhubarb to open browse and view the file"],
            \ ["&Gist", "Gist", "open gist with mattn/gist-vim"],
            \ ["&Edit Note", "Note", "edit note with vim-notes"],
            \ ["&Display Calendar", "Calendar", "display a calender"],
            \ ['Toggle &Vista', 'Vista!!', ''],
            \ ["-"],
            \ ["Plugin &List", "PlugList", "Update list"],
            \ ["Plugin &Update", "PlugUpdate", "Update plugin"],
            \ ])

" register HELP menu with weight 10000
call quickui#menu#install('Help (&?)', [
            \ ["&Index", 'tab help index', ''],
            \ ['Ti&ps', 'tab help tips', ''],
            \ ['--',''],
            \ ["&Tutorial", 'tab help tutor', ''],
            \ ['&Quick Reference', 'tab help quickref', ''],
            \ ['&Summary', 'tab help summary', ''],
            \ ['--',''],
            \ ['&Vim Script', 'tab help eval', ''],
            \ ['&Function List', 'tab help function-list', ''],
            \ ['&Dash Help', 'call asclib#utils#dash_ft(&ft, expand("<cword>"))'],
            \ ], 10000)



"----------------------------------------------------------------------
" context menu
"----------------------------------------------------------------------
let g:context_menu_k = [
            \ ["&Peek Definition\tAlt+;", 'call quickui#tools#preview_tag("")'],
            \ ["S&earch in Project\t\\cx", 'exec "silent! GrepCode! " . expand("<cword>")'],
            \ [ "--", ],
            \ [ "Find &Definition\t\\cg", 'call MenuHelp_Fscope("g")', 'GNU Global search g'],
            \ [ "Find &Symbol\t\\cs", 'call MenuHelp_Fscope("s")', 'GNU Gloal search s'],
            \ [ "Find &Called by\t\\cd", 'call MenuHelp_Fscope("d")', 'GNU Global search d'],
            \ [ "Find C&alling\t\\cc", 'call MenuHelp_Fscope("c")', 'GNU Global search c'],
            \ [ "Find &From Ctags\t\\cz", 'call MenuHelp_Fscope("z")', 'GNU Global search c'],
            \ [ "--", ],
            \ [ "Goto D&efinition\t(YCM)", 'YcmCompleter GoToDefinitionElseDeclaration'],
            \ [ "Goto &References\t(YCM)", 'YcmCompleter GoToReferences'],
            \ [ "Get D&oc\t(YCM)", 'YcmCompleter GetDoc'],
            \ [ "Get &Type\t(YCM)", 'YcmCompleter GetTypeImprecise'],
            \ [ "--", ],
            \ ['Dash &Help', 'call asclib#utils#dash_ft(&ft, expand("<cword>"))'],
            \ ['Cpp&man', 'exec "Cppman " . expand("<cword>")', '', 'c,cpp'],
            \ ['P&ython Doc', 'call quickui#tools#python_help("")', 'python'],
            \ ]


"----------------------------------------------------------------------
" hotkey
"----------------------------------------------------------------------
nnoremap <silent><space><space> :call quickui#menu#open()<cr>

nnoremap <silent>K :call quickui#tools#clever_context('k', g:context_menu_k, {})<cr>

if has('gui_running') || has('nvim')
    noremap <c-f10> :call MenuHelp_TaskList()<cr>
endif


