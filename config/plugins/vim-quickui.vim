"======================================================================
"
" vim-quickui.vim - The missing UI extensions for Vim.
"
" Created by cw on 2021/03/09
" Last Modified: 2021/03/10 09:18
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 et :

"----------------------------------------------------------------------
" Navigate with the usual Vim keys like h/j/k/l, confirm with ENTER/SPACE and cancel with ESC/Ctrl+[.
"
" Tip for each entry can display in the cmdline when you are moving the cursor around.
"----------------------------------------------------------------------
if has('patch-8.1.2292') == 0 && exists('*nvim_open_win') == 0
    finish
endif


"----------------------------------------------------------------------
" Customize
"----------------------------------------------------------------------
" Change border characters 1, 2 ,3
let g:quickui_border_style = 1
" change the color scheme: borland(default) ,gruvbox ,solarized ,papercol dark, papercol light
let g:quickui_color_scheme = 'gruvbox'
"  change preview window size
let g:quickui_preview_w = 100
let g:quickui_preview_h = 15
" enable to display tips in the cmdline
let g:quickui_show_tip = 1


"----------------------------------------------------------------------
" menu_help.vim - menu functions
"----------------------------------------------------------------------
let g:listbox_fzf_content = [
                \ ["FZF M&ru\t<M-r>", 'History'],
                \ ["FZF &Buffer Lines\t?", 'FzfBLines'],
                \ ["FZF &File\t<M-f>", 'FWW'],
                \ ["FZF H&ome File\t<M-F>", 'FWW $HOME'],
                \ ["FZF &Project Content\t<M-s>", 'GrepWithWiki'],
                \ [ "--", ''  ],
                \ ["FZF &Windows\t<M-w>", 'Windows'],
                \ ["FZF B&uffers\t<M-b>", 'Buffers'],
                \ [ "--", ''  ],
                \ ["FZF &Ex History\t<M-h>", 'History:'],
                \ ["FZF &Vim Commands\t<M-c>", 'Commands'],
                \ ["FZF &Marks\t<M-m>", 'Marks'],
                \ ["FZF &Yank\t<M-y>", 'CocFzfList yank'],
                \ ["FZF &Jumps\t<M-J>", 'FzfJumps'],
                \ ["FZF Search &History\t<M-/>", 'History/'],
                \ ["FZF Ma&ps\t<M-M>", 'Maps'],
                \ [ "--", ''  ],
                \ ["FZF &Quickfix", 'FzfQuickfix'],
                \ ["FZF &LocationList", 'FzfLocationList'],
                \ [ "--", ''  ],
                \ ["FZF Buffer &Tags\t<M-t>", 'BTags'],
                \ ["FZF Project T&ags\t<M-T>", 'Tags'],
                \ ]

let g:listbox_fzf_opts = {
                \ 'title' : '| fzf |'
                \ }


let g:quickui_terminal_tools = get(g:, 'quickui_terminal_tools', {})

let g:quickui_terminal_tools.lazygit = {
            \ 'title': '| LazyGit |',
            \ 'cmd': 'lazygit',
            \ 'cwd': '<root>',
            \ 'w': 0.8,
            \ 'h': 0.8,
            \ }

let g:quickui_terminal_tools.cloc = {
            \ 'title': '| CLOC |',
            \ 'cmd': 'cloc .',
            \ 'cwd': '<root>',
            \ 'w': 90,
            \ 'h': 30,
            \ 'pause': 1,
            \ }


function! MenuHelp_EasyMotion(what)
    if !common#functions#HasPlug('vim-easymotion')
        return
    endif
    if a:what != ''
        stopinsert
        call feedkeys("\<Plug>(easymotion-" . a:what . ")", '')
    endif
endfunc

function! MenuHelp_SplitLine()
    echohl Type
    call inputsave()
    let t = input('Enter maximum line width: ')
    call inputrestore()
    redraw | echo "" | redraw
    if t == ''
        return 0
    endif
    let width = str2nr(t)
    if width <= 0
        echohl ErrorMsg
        echo "Invalid number: " . t
        echohl None
        redraw
        return 0
    endif
    exec 'LineBreaker ' . width
endfunc

function! MenuHelp_TaskList()
    let keymaps = '123456789abcdefimopqrstuvwxyz'
    let items = asynctasks#list('')
    let rows = []
    let size = strlen(keymaps)
    let index = 0
    for item in items
        if item.name =~ '^\.'
            continue
        endif
        let cmd = strpart(item.command, 0, (&columns * 60) / 100)
        let key = (index >= size)? ' ' : strpart(keymaps, index, 1)
        let text = "[" . ((key != ' ')? ('&' . key) : ' ') . "]\t"
        let text .= item.name . "\t[" . item.scope . "]\t" . cmd
        let rows += [[text, 'AsyncTask ' . fnameescape(item.name)]]
        let index += 1
    endfor
    let opts = {}
    let opts.title = 'Task List'
    " let opts.bordercolor = 'QuickTitle'
    call quickui#tools#clever_listbox('tasks', rows, opts)
endfunc

function! MenuHelp_ReadUrl()
    let t = expand('<cword>')
    echohl Type
    call inputsave()
    let t = input('Read URL from: ')
    call inputrestore()
    echohl None
    redraw | echo "" | redraw
    if t == ''
        return 0
    endif
    if executable('curl')
        exec '.-1r !curl -sL '.shellescape(t)
    elseif executable('wget')
        exec '.-1r !wget --no-check-certificate -qO- '.shellescape(t)
    else
        echo "require wget or curl"
    endif
endfunc

function! MenuHelp_Gscope(what)
    if !common#functions#HasPlug('vim-gutentags') || !common#functions#HasPlug('gutentags_plus')
        return
    endif
    let p = asyncrun#get_root('%')
    let t = ''
    let m = {}
    let m["s"] = "string symbol"
    let m['g'] = 'definition'
    let m['d'] = 'functions called by this'
    let m['c'] = 'functions calling this'
    let m['t'] = 'string'
    let m['e'] = 'egrep pattern'
    let m['f'] = 'file'
    let m['i'] = 'files #including this file'
    let m['a'] = 'places where this symbol is assigned'
    let m['z'] = 'ctags database'
    if a:what == 'f' || a:what == 'i'
        " let t = expand('<cfile>')
    endif
    echohl Type
    call inputsave()
    let t = input('Find '.m[a:what].' in (' . p . '): ', t)
    call inputrestore()
    echohl None
    redraw | echo "" | redraw
    if t == ''
        return 0
    endif
    exec 'GscopeFind '. a:what. ' ' . fnameescape(t)
endfunc

"----------------------------------------------------------------------
" Available Widgets
"
" Menu -  Display a dropdown menubar at top of the screen
"   Usage:
"       h / CTRL+h / LEFT  : move left.
"       l / CTRL+l / RIGHT : move right.
"       j / CTRL+j / DOWN  : move down.
"       k / CTRL+k / UP    : move up.
"       SPACE / ENTER      : confirm.
"       ESC / CTRL+[       : cancel.
"       H                  : move to the left-most menu.
"       L                  : move to the right-most menu.
"       J                  : move to the last item.
"       K                  : move to the first item.]
"
"----------------------------------------------------------------------

call quickui#menu#reset()


" call quickui#menu#install("&Fzf", [
"            \ ["FZF M&ru\t<M-r>", 'History', 'FZF MRU'],
"            \ ["FZF &Buffer Lines\t?", 'FzfBLines', '模糊搜索当前buffer'],
"            \ ["FZF &File\t<M-f>", 'FWW', 'open file with FZF'],
"            \ ["FZF H&ome File\t<M-F>", 'FWW $HOME', 'open home file with FZF'],
"            \ ["FZF &Project Content\t<M-s>", 'GrepWithWiki', '1. 使用rg搜索当前工程下的文件内容 2. 如果正在编辑wiki目录下的笔记，那么使用rg会搜索wiki笔记目录下的内容 3.visural模式下选中内容之后会自动搜索选中的内容'],
"            \ [ "--", ''  ],
"            \ ["FZF &Windows\t<M-w>", 'Windows', 'FZF Windows'],
"            \ ["FZF B&uffers\t<M-b>", 'Buffers', 'FZF Buffers'],
"            \ [ "--", ''  ],
"            \ ["FZF &Ex History\t<M-h>", 'History:', 'FZF Command History'],
"            \ ["FZF &Vim Commands\t<M-c>", 'Commands', 'FZF Vim Commands'],
"            \ ["FZF &Marks\t<M-m>", 'Marks', '模糊搜索Marks'],
"            \ ["FZF &Yank\t<M-y>", 'CocFzfList yank', '模糊搜索Yanks'],
"            \ ["FZF &Jumps\t<M-J>", 'FzfJumps', '模糊搜索Jumps'],
"            \ ["FZF Search &History\t<M-/>", 'History/', 'FZF Search History'],
"            \ ["FZF Ma&ps\t<M-M>", 'Maps', 'FZF Maps'],
"            \ [ "--", ''  ],
"            \ ["FZF &Quickfix", 'FzfQuickfix', '模糊搜索Quickfix'],
"            \ ["FZF &LocationList", 'FzfLocationList', '模糊搜索LocationList'],
"            \ [ "--", ''  ],
"            \ ["FZF Buffer &Tags\t<M-t>", 'BTags', '模糊搜索buffer tags'],
"            \ ["FZF Project T&ags\t<M-T>", 'Tags', '模糊搜索buffer tags'],
"            \ ])

" install a 'File' menu, use [text, command] to represent an item.
" items containing tips, use [text, command, tips], tips will display in the cmdline
call quickui#menu#install("&File", [
            \ [ "&Open\t:tabe ", 'call feedkeys(":tabe ")', 'open file in a new tap'],
            \ [ "Sa&ve\t:write(\\w)", 'write', 'save current open buffer'],
            \ [ "Qui&t\t:q(\\q)", 'quit', 'quit without save'],
            \ [ "Save A&ll\t:wall", 'wall', 'save all open files'],
            \ [ "&Save and Quit\t:xall", 'xall', 'save all open filesand quit'],
            \ [ "&Quit All\t:qall", 'qall', 'quit all without save'],
            \ [ "--", ''  ],
            \ [ "O&pen Coc-explorer\t<F2>", 'CocCommand explorer', 'open file explorer'],
            \ [ "System&APP Open\t<M-x>", "call common#functions#OpenFileUsingSystemApp(expand('%:p'))", 'open file using system app'],
            \ [ "F&ZF listbox", 'call quickui#tools#clever_listbox("FZF", g:listbox_fzf_content, g:listbox_fzf_opts)', 'open fzf listbox'],
            \ [ "--", ''  ],
            \ [ "J&unk File", 'JunkFile', ''],
            \ [ "Junk &List", 'JunkList', ''],
            \ [ "--", ''  ],
            \ [ "Ter&minal Tab", 'OpenTerminal tab', 'Open internal terminal in a new tab'],
            \ [ "Terminal Spl&it", 'OpenTerminal right', 'Open internal terminal in a split'],
            \ [ "Open &URL", 'OpenURL', 'Open URL under cursor'],
            \ [ "Search &Word", "call openbrowser#_keymap_smart_search('n')", 'Browse word in www'],
            \ ])

            "\ [ "F&ZF listbox", 'call quickui#listbox#open(g:listbox_fzf_content, g:listbox_fzf_opts)', 'open fzf listbox'],


call quickui#menu#install("&Wiki", [
            \ [ "&Open Wiki Index\t<space>ww", 'VimwikiIndex' ],
            \ [ "O&pen Wiki Index in Tap\t<space>wt", 'VimwikiTabIndex' ],
            \ [ "&Select Wiki Index\t<space>ws", 'VimwikiUISelect' ],
            \ [ "Open &Diary Index\t<space>wi", 'VimwikiDiaryIndex' ],
            \ ['--'],
            \ [ "Open Wiki &Today Diary\t<space>w<space>w", 'VimwikiMakeDiaryNote' ],
            \ [ "Open Wiki To&day Diary in Tap\t<space>w<space>t", 'VimwikiTabMakeDiaryNote' ],
            \ [ "Open Wiki &Yesterday Diary\t<space>w<space>w", 'VimwikiMakeYesterdayDiaryNote' ],
            \ [ "Open Wiki &Tomorrow Diary\t<space>w<space>w", 'VimwikiMakeTomorrowDiaryNote' ],
            \ ])


" script inside %{...} will be evaluated and expanded in the string
call quickui#menu#install("&Edit", [
            \ [ "Open &Undo Tree\t<F3>", 'MundoToggle', 'open undo tree'],
            \ ['--'],
            \ ["Copyright &Header\t<space>ec", 'call feedkeys("\<esc> ec")', 'Insert copyright information at the beginning'],
            \ ['Update &ModTime', 'call UpdateLastModified()', ''],
            \ ['&Trailing Space', 'call StripTrailingWhitespace()', ''],
            \ ["&Paste Mode Line\t<space>el", 'PasteVimModeLine', ''],
            \ ['--'],
            \ ['&Align Table', 'Tabularize /|', ''],
            \ ['Align &Cheatsheet', 'MyCheatSheetAlign', ''],
            \ ['&Break long line', 'call MenuHelp_SplitLine()', ''],
            \ ])

call quickui#menu#install('&Symbol', [
            \ [ "&Grep Word\t(In Project)", 'AsyncTask grep-word', 'Grep keyword in current project' ],
            \ [ "Taglist\t<F4>", 'Vista!!', 'open vista(Viewer & Finder for LSP symbols and tags)'  ],
            \ [ "--", ],
            \ [ "GNU Global", ],
            \ [ "Find &Definition\t(GNU Global)", 'call MenuHelp_Gscope("g")', 'GNU Global search g' ],
            \ [ "Find &Symbol\t(GNU Global)", 'call MenuHelp_Gscope("s")', 'GNU Gloal search s' ],
            \ [ "Find &Called by\t(GNU Global)", 'call MenuHelp_Gscope("d")', 'GNU Global search d' ],
            \ [ "Find C&alling\t(GNU Global)", 'call MenuHelp_Gscope("c")', 'GNU Global search c' ],
            \ [ "Find &From Ctags\t(GNU Global)", 'call MenuHelp_Gscope("z")', 'GNU Global search z' ],
            \ [ "--", ],
            \ [ "COC", ],
            \ [ "Goto D&efinition\tgd", 'call feedkeys("\<Plug>(coc-definition)")'],
            \ [ "Goto &References\tgr", 'call feedkeys("\<Plug>(coc-references)")'],
            \ [ "Get &Type\tgy", 'call feedkeys("\<Plug>(coc-type-definition")'],
            \ [ "Get &Implementation\tgy", 'call feedkeys("\<Plug>(coc-implementation")'],
            \ [ "Get &Dot\tK", 'K' ],
            \ [ "Auto &Fix\t<space>f", 'call feedkeys("\<Plug>(coc-fix-current)")' ],
            \ [ "For&mat Code", 'Format', 'use LSP format code' ],
            \ ])


call quickui#menu#install('&Move', [
            \ ["EasyMotion &Search\tf", 'call MenuHelp_EasyMotion("s")', 'easymotion-s'],
            \ ["EasyMotion &Word\tF", 'call MenuHelp_EasyMotion("overwin-w")', 'easymotion-overwin-w'],
            \ ["EasyMotion &Line\tgl", 'call MenuHelp_EasyMotion("overwin-line")', 'easymotion-overwin-line'],
            \ ['--', ''],
            \ ["Quickfix &First\t:cfirst", 'cfirst', 'quickfix cursor rewind'],
            \ ["Quickfix L&ast\t:clast", 'clast', 'quickfix cursor to the end'],
            \ ["Quickfix &Next\t:cnext", 'cnext', 'cursor next'],
            \ ["Quickfix &Previous\t:cprev", 'cprev', 'quickfix cursor previous'],
            \ ])

call quickui#menu#install("&Build", [
            \ ["File &Compile\tF5", 'AsyncTask file-build'],
            \ ["File &Execute\tF6", 'AsyncTask file-run'],
            \ ["Project &Make\tF7", 'AsyncTask project-build'],
            \ ["Project &Run\tF8", 'AsyncTask project-run'],
            \ ['--', ''],
            \ ["T&ask List\t<M-a>", 'AsyncTaskFzf'],
            \ ["E&dit Task\t<space>te", 'AsyncTask -e'],
            \ ["Edit &Global Task\t<space>tg", 'AsyncTask -E'],
            \ ["&Stop Building", 'AsyncStop'],
            \ ])

call quickui#menu#install("&C/C++", [
           \ ["&Switch Header/Source\t<spc>fw", "call Open_HeaderFile(-1)"],
           \ ["Split &Header/Source\t<spc>fw", "call Open_HeaderFile(1)"],
           \ ])

call quickui#menu#install('&Tools', [
            \ ['Set &Paste %{&paste? "Off":"On"}', 'set paste!'],
            \ ['Set &Wrap %{&wrap? "Off":"On"}', 'set wrap!'],
            \ ['&Spell %{&spell? "Disable":"Enable"}', 'set spell!', 'Toggle spell check %{&spell? "off" : "on"}'],
            \ ["Relati&ve number %{&relativenumber? 'OFF':'ON'}", 'set relativenumber!'],
            \ ['--',''],
            \ [ "Lazy&git", "call quickui#tools#terminal('lazygit')" ],
            \ ['--',''],
            \ ['List &Buffer', 'call quickui#tools#list_buffer("FileSwitch tabe")', ],
            \ ['List &Function', 'call quickui#tools#list_function()', ],
            \ ['Display &Messages', 'call quickui#tools#display_messages()', ],
            \ ['--',''],
            \ ["T&ask List", 'call MenuHelp_TaskList()'],
            \ ['Read &URL', 'call MenuHelp_ReadUrl()', 'load content from url into current buffer'],
            \ ['&Profile Start', 'call MonitorInit()', ''],
            \ ['Profile S&top', 'call MonitorExit()', ''],
            \ ])

call quickui#menu#install('&Plugin', [
            \ ["&Choose Window/Tab\t-", "ChooseWin", "fast switch win/tab with vim-choosewin"],
            \ ["-"],
            \ ["&Startify", "Startify", "using tpope's rhubarb to open browse and view the file"],
            \ ["&Display Calendar", "Calendar", "display a calender"],
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
            \ ], 10000)


"----------------------------------------------------------------------
" Listbox - When you have hundres of items to deal with, menu is not enough to hold them. Then you will need a listbox.
"   Usage:
"       j / CTRL+j / UP       : move up.
"       k / CTRL+k / DOWN     : move down.
"       J / CTRL+d            : half page down.
"       K / CTRL+d            : half page up.
"       H / CTRL+b / PageUp   : page up.
"       L / CTRL+f / PageDown : page down.
"       SPACE / ENTER         : confirm.
"       ESC / CTRL+[          : cancel.
"       g                     : go to the first item.
"       G                     : go to the last item.
"       /                     : search forwards.
"       ?                     : search backwards.
"       :                     : go to line number.
"       n / CTRL+n            : next match.
"       N / CTRL+p            : previous match.]
"
" Open the listbox: quickui#listbox#open(content, opts)
"
" Parameter content is a list of [text, command] items.
" opts is a dictionary of options, available options are:
"   title    : title of the listbox.
"   index    : initial cursor position, starts from 0.
"   w        : listbox width.
"   h        : listbox height.
"   col      : screen position in columns, starts from 1.
"   line     : screen position in lines, starts from 1.
"   color    : background color, default to QuickBG.
"   syntax   : the filetype apply to the listbox.
"   callback : a function ("fn(code)" form) which will be called after listbox closed (press Enter or ESC).
"
" All options are not compulsorily required and can be omitted. The callback
" function will be invoked with a parameter code which represent the selected
" item index. If you quit (ESC/CTRL+[) without making your selection, code
" will be -1.
"
" There is an internal variable g:quickui#listbox#cursor which stores the last
" cursor position (index) in the listbox. It can be used to restore previous
" location.
"
" Sample code:
"
" let content = [
"            \ [ 'echo 1', 'echo 100' ],
"            \ [ 'echo 2', 'echo 200' ],
"            \ [ 'echo 3', 'echo 300' ],
"            \ [ 'echo 4' ],
"            \ [ 'echo 5', 'echo 500' ],
"            \]
" let opts = {'title': 'select one'}
" call quickui#listbox#open(content, opts)

" It can also work like inputlist() function by using quickui#listbox#inputlist, it will return the index you select immediatedly instead of executing a vim command:
"
" let linelist = [
"            \ "line &1",
"            \ "line &2",
"            \ "line &3",
"            \ ]
" " restore last position in previous listbox
" let opts = {'index':g:quickui#listbox#cursor, 'title': 'select'}
" echo quickui#listbox#inputlist(linelist, opts)
"
" The key difference between open and inputlist is open will return immediately to vim's event loop while inputlist won't return until you select an item or press ESC.
"----------------------------------------------------------------------



"----------------------------------------------------------------------
" Context menu - imitates Windows context menu (triggered by your mouse right button), which will display around the cursor.
"               It is usually used to present some commands that will do something with source code in the current line.
"
" open the context menu: quickui#context#open(content, opts)
"
" Parameter content is a list of [text, command] items.
" opts is a dictionary of options, has similar options in listbox but an additional option:
"
" ignore_case: ignore case of the keyword, default 1.
"
" Sample code:
"
" let content = [
"            \ ["&Help Keyword\t\\ch", 'echo 100' ],
"            \ ["&Signature\t\\cs", 'echo 101'],
"            \ ['-'],
"            \ ["Find in &File\t\\cx", 'echo 200' ],
"            \ ["Find in &Project\t\\cp", 'echo 300' ],
"            \ ["Find in &Defintion\t\\cd", 'echo 400' ],
"            \ ["Search &References\t\\cr", 'echo 500'],
"            \ ['-'],
"            \ ["&Documentation\t\\cm", 'echo 600'],
"            \ ]
" set cursor to the last position
" let opts = {'index':g:quickui#context#cursor}
" call quickui#context#open(content, opts)
"
" You can define your own context menu and map it to K (override the original keywordprg command). And you will get a much more powerful K command then before.
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
" Textbox - used to display arbitrary text in a popup window.
"
" HJKL to scroll up/down, ESC to quit
" Support syntax highlighting
"
" open textbox: quickui#textbox#open(textlist, opts)
"
" Run a shell command and display the output in the textbox: quickui#textbox#command(command, opts)
"
" Sample code:
"
" display vim messages in the textbox
" function! DisplayMessages()
"     let x = ''
"     redir => x
"     silent! messages
"     redir END
"     let x = substitute(x, '[\n\r]\+\%$', '', 'g')
"     let content = filter(split(x, "\n"), 'v:key != ""')
"     let opts = {"close":"button", "title":"Vim Messages"}
"     call quickui#textbox#open(content, opts)
" endfunc
"
" This function can display vim error messages (:messages) in the text window:
"----------------------------------------------------------------------



"----------------------------------------------------------------------
" Preview window - used to replace traditional pedit command and can be used to display certain file in a small popup window around your cursor.
"
" open the preview window: quickui#preview#open(filename, opts)
"
" It will not interfere your work, and will immediately close if you move your cursor around. The second parameter opts is a dictionary with options
"
" scroll the content in the preview window: quickui#preview#scroll(offset)
"
" Parameter offset is an integer, above zero to scroll down and below zero to scroll up.
"----------------------------------------------------------------------



"----------------------------------------------------------------------
" Terminal - open a terminal in the popup window
"
" quickui#terminal#open(cmd, opts)
"
" Parameter cmd can be a string or a list, and opts is a dictionary of options, available options are:
"
"Option    Type               Default    Description
" w        Number             80         terminal window width
" h        Number             24         terminal window height
" col      Number             unset      window horizontal position
" line     Number             unset      window vertical position
" border   Number             1         use 0 for no border
" title    String             unset     window title
" callback String/Function    unset     a function with one argument to receive exit code when terminal exit
"
" Sample code:
"
" function! TermExit(code)
"     echom "terminal exit code: ". a:code
" endfunc
"
" let opts = {'w':60, 'h':8, 'callback':'TermExit'}
" let opts.title = 'Terminal Popup'
" call quickui#terminal#open('python', opts)
"
" When you run it, it will run python in a popup window.
"
" it enables you to run various tui programs in a dialog window.
" ----------------------------------------------------------------------



"----------------------------------------------------------------------
" Tools - build upon basic widgets.
"
" Buffer switcher - call quickui#tools#list_buffer('e') or call quickui#tools#list_buffer('tabedit')
"
" Function list - call quickui#tools#list_function()
"   This feature requires ctags in you $PATH.
"
" Help viewer - call quickui#tools#display_help('index')
"   Use textbox to display vim help in a popup window
"   The only one argument in display_help is the help tag name. With this tool, you can read the help text anytime, without creating a new split window.
"
" Preview tag - nnoremap <F3> :call quickui#tools#preview_tag('')<cr>
"   When you move the cursor around and press <F3>, the definition of current <cword> under cursor will display in the preview window.
"   If there are multiple definitions, press <F3> again will circularly display the next one, and in the command line, you will see the details about how many definitions and source file name.
"   Don't forget to use quickui#preview#scroll to scroll the content in the preview window if you want to see more.
"   This feature requires ctags databases are loaded correctly in vim. A plugin gutentags can do it for you nicely in the background.
"
" Preview quickfix - If you have many items in the quickfix window, instead of open them one by one,
"                     you are able to press p in the quickfix window and preview them in the popup:
"
"                     augroup MyQuickfixPreview
"                         au!
"                         au FileType qf noremap <silent><buffer> p :call quickui#tools#preview_quickfix()<cr>
"                     augroup END
"
"                   This piece of code setup a p keymap in your quickfix window to preview items, and press p again to close the preview window.
"----------------------------------------------------------------------



"----------------------------------------------------------------------
" hotkey
"----------------------------------------------------------------------
augroup MyQuickfixPreview
    au!
    au FileType qf noremap <silent><buffer> p :call quickui#tools#preview_quickfix()<cr>
augroup END

nnoremap <silent><space><space> :call quickui#menu#open()<cr>

" nnoremap <silent>K :call quickui#tools#clever_context('k', g:context_menu_k, {})<cr>

if has('gui_running') || has('nvim')
    noremap <c-f10> :call MenuHelp_TaskList()<cr>
endif


