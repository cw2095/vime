function! ProfileInit(filename)
    exec 'profile start ' . fnameescape(a:filename)
    profile func *
    profile file *
endfunc


function! ProfileStop()
    silent! profdel func *
    silent! profdel file *
endfunc


function! MonitorInit()
    let ts = strftime("pf-%Y%m%d%H%M%S.txt")
    let name = expand('~/.cache/vim/profile/' . ts)
    silent! call mkdir(expand('~/.cache/vim/profile'), "p", 0755)
    silent! call ProfileStop()
    call ProfileInit(name)
endfunc


function! MonitorExit()
    call ProfileStop()
endfunc
