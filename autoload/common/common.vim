function! common#common#echo() abort
    echom 'autoload#common#echo()'
endfunction

function! common#common#init() abort
    " vimrc所在根目录
    let g:vim_root_path = fnamemodify($MYVIMRC, ':h') . '/'
    " 配置所在根目录
    let g:config_root_path = g:vim_root_path . 'config/'
    " 插件配置所在目录
    let g:plugins_config_root_path = g:config_root_path . "plugins/"
    let g:other_config_root_path = g:config_root_path . "other/"

    " vim插件、缓存等数据根目录
    let g:cache_root_path = $HOME . '/.cache/vim/'
    " vim 插件安装目录
    let g:plugins_install_path = g:cache_root_path . 'plugins/'
    " session 保存目录
    " 能够恢复当前的编辑会话。
    let g:session_dir = g:cache_root_path . 'sessions/'
    " 撤销记录目录
    let g:undo_dir = g:cache_root_path . 'undo/'
    " view 保存目录
    " 能够恢复当前的窗口内容
    let g:view_dir = g:cache_root_path . 'views/'
    " log
    let g:log_dir = g:cache_root_path . 'logs/'

    let g:os = systemlist('uname -s')[0]
    let g:arch = systemlist('uname -m')[0]

    " tmux配置文件目录
    let g:tmux_config_path = $HOME . '/.tmux.conf'

    " 脚本目录
    let g:scripts_root_path = g:vim_root_path . "scripts/"

    " wiki笔记根目录
    let g:vimwiki_path = g:vim_root_path . 'wiki/'

    " 快速note文件
    let g:quicknote_file = g:vim_root_path . 'assets/quicknote.md'

    " 快速todo文件
    let g:todo_file = g:vim_root_path . 'assets/todo.md'

    " Open junk file
    let g:junk_dir = g:cache_root_path. 'junk/'

    " GTAGSLABEL 告诉 gtags 默认 C/C++/Java 等六种原生支持的代码直接使用 gtags 本地分析器，而其他语言使用 pygments 模块。
    " 实际使用 pygments 时，gtags 会启动 python 运行名为 pygments_parser.py 的脚本，
    " 通过管道和它通信，完成源代码分析，故需保证 gtags 能在 $PATH 里调用 python，且这个 python 安装了 pygments 模块。
    let $GTAGSLABEL = 'native-pygments'
    " let $GTAGSLABEL = 'native'
    let $GTAGSCONF = '/home/cw/.globalrc'
endfunction

