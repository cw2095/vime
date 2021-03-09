let g:asynctasks_rtp_config = "../GitHub/vime/config/tasks/tasks.ini"

" 定位项目目录,早就采用了一套叫做 rootmark 的机制， 从当前文件所在目录一直往上递归到根目录，直到发现某一级父目录中包含下列项目标识
" 则认为该目录是当前项目的根目录，如向上搜索到根目录都没找到任何标识，则将当前文件所在目录当作项目根目录。
" 最后一个边界情况，如果你没有打开文件（未命名新文件窗口），或者当前 buffer 是一个非文件（比如工具窗口），怎么办呢？
" 此时会使用 vim 的当前文件夹（即 :pwd 返回的值）作为项目目录。
let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg']
" 告诉 asyncrun 运行时自动打开高度为 6 的 quickfix 窗口，不然你看不到任何输出，除非你自己手动用 :copen 打开它。
let g:asyncrun_open = 10

" 名称     类型      说明
" quickfix 伪终端    默认值，使用 quickfix 窗口模拟终端，输出不匹配 errorformat。
" vim      -         传统 vim 的 ! 命令运行任务，有些人就是迷恋这种方式。
" tab      内置终端  在一个新的 tab 上打开内置终端，运行程序。
" top      内置终端  在上方打开可复用内部终端。
" bottom   内置终端  在下方打开可复用内部终端。
" left     内置终端  在左边打开可复用内置终端。
" right    内置终端  在右边打开可复用内置终端。
" external 外部终端  启动一个新的操作系统的外置终端窗口，运行程序。
" gnome              run command in a new gnome-terminal window
" gnome-tab          run command in a new gnome-terminal tab
" xterm              run command in a new xterm window
" external           run command in cmd.exe / gnome-terminal / xterm if possible
" floaterm           run command in a floaterm window
" floaterm-reuse     run command in a reusable floaterm window
" tmux               run command in another tmux pane
" termhelp           run command in the terminal_help window
let g:asynctasks_term_pos = 'floaterm-reuse'
" 使设置为 top/bottom/left/right 时，可以用下面两个配置确定终端窗口大小
let g:asynctasks_term_rows = 10    " 设置纵向切割时，高度为 10
let g:asynctasks_term_cols = 80    " 设置横向切割时，宽度为 80

" tab 模式的终端也可以复用
let g:asynctasks_term_reuse = 1
" 在打开新分屏终端的时候保持你的焦点不改变
let g:asynctasks_term_focus = 0

let g:asynctasks_extra_config = [
    \ '~/GitHub/vime/config/tasks/tasks.ini'
    \ ]

" fzf
function! s:fzf_sink(what)
    let p1 = stridx(a:what, '<')
    if p1 >= 0
        let name = strpart(a:what, 0, p1)
        let name = substitute(name, '^\s*\(.\{-}\)\s*$', '\1', '')
        if name != ''
            exec "AsyncTask ". fnameescape(name)
        endif
    endif
endfunction

function! s:fzf_task()
    let rows = asynctasks#source(&columns * 48 / 100)
    let source = []
    for row in rows
        let name = row[0]
        let source += [name . '  ' . row[1] . '  : ' . row[2]]
    endfor
    let opts = { 'source': source, 'sink': function('s:fzf_sink'),
                \ 'options': '+m --nth 1 --inline-info --tac' }
    if exists('g:fzf_layout')
        for key in keys(g:fzf_layout)
            let opts[key] = deepcopy(g:fzf_layout[key])
        endfor
    endif
    call fzf#run(opts)
endfunction

command! -nargs=0 AsyncTaskFzf call s:fzf_task()

nnoremap <M-a> :AsyncTaskFzf<CR>

nnoremap <silent><F6>> :AsyncTask file-run<cr>
nnoremap <silent><F5> :AsyncTask file-build<cr>
nnoremap <silent><F8> :AsyncTask project-run<cr>
nnoremap <silent><F7> :AsyncTask project-build<cr>

"----------------------------------------------------------------------
" tasks
"----------------------------------------------------------------------
noremap <space>te :AsyncTaskEdit<cr>
noremap <space>tg :AsyncTaskEdit!<cr>
noremap <space>tfb :AsyncTask file-build<cr>
noremap <space>tfr :AsyncTask file-run<cr>
noremap <space>tfd :AsyncTask file-debug<cr>
noremap <space>tpi :AsyncTask project-init<cr>
noremap <space>tpb :AsyncTask project-build<cr>
noremap <space>tpr :AsyncTask project-run<cr>
noremap <space>tpd :AsyncTask project-debug<cr>
