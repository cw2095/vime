" 基本配置
if &compatible
    " 不要兼容vi
    set nocompatible
endif

if has('syntax')
    syntax enable
    syntax on
endif

if has('autocmd')
    filetype plugin indent on
endif

if has('multi_byte')
    set encoding=utf-8
    set termencoding=utf-8
    set fileencoding=utf-8
    set fileencodings=ucs-bom,utf-8,gb18030,cp936,latin1
endif
" 文件换行符，默认使用unix换行符
set fileformats=unix,dos,mac

" TODO 需要整理，同时要区分一下gui与非gui
if &term =~ '256color' && $TMUX != ''
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

if has('termguicolors')
    " fix bug for vim
    if !has('nvim')
        " if &term =~# '^screen\|^tmux'
         let &t_8f = "\e[38;2;%lu;%lu;%lum"
         let &t_8b = "\e[48;2;%lu;%lu;%lum"
        " endif
    endif
    " enable true color
    set termguicolors
endif

set cursorline
set colorcolumn=80
if has('nvim') == 0 && has('patch-8.1.2020')
    set cursorlineopt=number
endif
set signcolumn=yes

set exrc
set secure
set number
set relativenumber
set noshowmode
set showcmd
set showmatch
set matchtime=2
set title
set display=lastline
set scrolloff=4
set wrap
" 软折行
set linebreak
set textwidth=0
" Make backspace work as you would expect.
set backspace=indent,eol,start
" Always report changed lines.
set report=0
" 终端隐藏后不结束
set hidden
set wildmenu
set splitright
set splitbelow
set viewoptions=cursor,folds,slash,unix
set sessionoptions+=globals
set formatoptions-=tc
set formatoptions+=mB
set shortmess+=c
set completeopt=longest,noinsert,menuone,noselect,preview
set visualbell
set virtualedit=block
" 历史命令
set history=500
set winaltkeys=no
set ttyfast
set lazyredraw
" 更新时间100ms 默认4000ms 写入swap的时间
set updatetime=100
" 光标
set guicursor=n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20
set noswapfile
set nobackup
set nowritebackup
" 文件在外部被修改过，重新读入
set autoread
" 自动写回
set autowrite
" 显示确认对话框
set confirm
" 允许使用鼠标, normal生效，a则是全模式生效
set mouse=n
" 与系统共用剪切板
" 在某些系统上可能会出现vim打开时间长的问题
set clipboard=unnamedplus
set notimeout
set ttimeout
" set timeoutlen=500
set ttimeoutlen=0

" set autochdir

" 搜索高亮
set incsearch
" 高亮匹配内容
set hlsearch
" 搜索高亮颜色
hi Search ctermfg=17 ctermbg=190 guifg=#000000 guibg=#ffff00

" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
" set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%{&ff}][%p%%]

set list
" 只有set list下面的才会起作用
if &list
    set listchars=tab:\|\→·,nbsp:⣿,extends:»,precedes:«
    set listchars+=eol:¬
    set listchars+=trail:·
    " set listchars+=space:␣
endif

" 设置自动缩进长度为4空格
set shiftwidth=4
" 缩进列数对齐到 shiftwidth 值的整数倍
set shiftround
" 智能缩进
set smartindent
" 自动换行缩进
set autoindent
set indentexpr=

" expand tabs to spaces
set expandtab
" 设置Tab长度为4空格
set tabstop=4
" 表示插入 Tab 时使用 shiftwidth
set smarttab
" insert mode tab and backspace use 4 spaces
set softtabstop=4

set ignorecase
set smartcase
" Adjust case in insert completion mode
set infercase

if has('folding')
    set foldenable
    " 基于缩进的折叠
    set foldmethod=indent
    " 默认打开所有缩进
    set foldlevel=99
endif

" 设置弹出框大小, 0 则有多少显示多少
set pumheight=20
if has('nvim')
    set pumblend=20 " 提示框透明
endif

" 定位到退出位置并移动到屏幕中央
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif | normal! zvzz
    " Auto change directory to current dir
    autocmd BufEnter * silent! lcd %:p:h
endif

let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert

" 以下内容来自韦大的配置
" 文件搜索和补全时忽略下面的扩展名
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class
"stuff to ignore when tab completing
set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
" MacOSX/Linux
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz
set wildignore+=*DS_Store*,*.ipch
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android

