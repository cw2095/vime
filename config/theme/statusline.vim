" 自定义状态栏和tab栏
if common#functions#HasPlug('vim-crystalline')
    \ || common#functions#HasPlug('lightline.vim')
    \ || common#functions#HasPlug('vim-airline')
    \ || common#functions#HasPlug('eleline.vim')
    finish
endif

" 状态栏
" set statusline=2

"----------------------------------------------------------------------
" simple status line
"----------------------------------------------------------------------
let g:status_padding_left = ""
let g:status_padding_right = ""

set statusline=                                 " clear status line
set statusline+=%{''.g:status_padding_left}     " left padding
set statusline+=\ %F                            " filename
set statusline+=\ [%1*%M%*%n%R%H]               " buffer number and status
set statusline+=%{''.g:status_padding_right}    " left padding
" set statusline+=\ %{''.toupper(mode())}         " INSERT/NORMAL/VISUAL
set statusline+=%=                              " right align remainder
set statusline+=\ %y                            " file type
set statusline+=\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %v:%l/%L%)

" 黑名单
let s:disable_statusline =
    \ ['defx', 'denite', 'vista', 'tagbar', 'undotree', 'diff', 'peekaboo', 'sidemenu', 'qf', 'coc-explorer', 'startify', 'vim-plug']
    " \ 'defx\|denite\|vista\|tagbar\|undotree\|diff\|peekaboo\|sidemenu\|qf\|coc-explorer\|startify\|vim-plug'

let s:stl = ""
let s:stl .= "%#ToolbarButton# %{common#functions#ModeLabel()} "
let s:stl .= "%#Substitute# %n %f%h%w%r "
let s:stl .= "%#IncSearch#%{common#functions#ReadOnly()}"
let s:stl .= "%#StatusLine# %{common#functions#GitBranch()} %{common#functions#GitCount()}"
let s:stl .= "%{common#functions#CocStatus()} "

let s:stl .= "%="
let s:stl .= "%<"

if common#functions#HasPlug('vim-scrollstatus')
    let s:stl .= '%{ScrollStatus()}'
endif
let s:stl .= "%#StatusLine# [%{&fileformat}] %{&fileencoding?&fileencoding:&encoding} "
let s:stl .= "%#Substitute# %{common#functions#BufLineAndColInfo()} "
let s:stl .= "%#ToolbarButton# %{common#functions#FileType()} "
" let s:stl .= "%#IncSearch#%{common#functions#CocError()}"

let s:stl_nc = ""
let s:stl_nc .= "%#PmenuThumb# %n %f%h%w%r"

function s:active() abort
    if index(s:disable_statusline, &ft) > 0
        return
    endif
    " if &ft =~? s:disable_statusline
        " return
    " endif
    let &l:statusline = s:stl
endfunction

function s:inactive() abort
    let &l:statusline = s:stl_nc
endfunction

augroup vime_theme_statusline_group
    autocmd!

    autocmd VimEnter,ColorScheme,FileType,WinEnter,BufWinEnter * call s:active()
    autocmd WinLeave * call s:inactive()

    autocmd FileChangedShellPost,BufFilePost,BufNewFile,BufWritePost * redrawstatus
augroup END
