" 首先需要在config/plugin_list.vim中增加插件

" 起始界面
Plug 'mhinz/vim-startify'

" 查看启动时间
Plug 'dstein64/vim-startuptime', {'on':'StartupTime'}

" 主题theme类插件
Plug 'ajmwagar/vim-deus'
Plug 'rakr/vim-one'
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/forest-night'
Plug 'srcery-colors/srcery-vim'
Plug 'hardcoreplayers/oceanic-material'
Plug 'chuling/ci_dark'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'mhartington/oceanic-next'
Plug '986299679/space-vim-theme'
Plug 'ayu-theme/ayu-vim'
Plug 'w0ng/vim-hybrid'
Plug 'NLKNguyen/papercolor-theme'
Plug 'flrnd/candid.vim'
Plug 'jaredgorski/spacecamp'
Plug 'bluz71/vim-moonfly-colors'
Plug 'cormacrelf/vim-colors-github'
Plug 'arzg/vim-colors-xcode'
Plug 'sainnhe/sonokai'
Plug 'sonph/onehalf'
Plug 'ghifarit53/tokyonight-vim'
Plug 'sainnhe/edge'
Plug 'reedes/vim-colors-pencil'
Plug 'ChristianChiarulli/nvcode-color-schemes.vim'

" 顶栏和底栏
" Plug 'rbong/vim-crystalline'
Plug 'itchyny/lightline.vim'
" Plug 'bagrat/vim-buffet'
" Plug 'romgrk/barbar.nvim'
Plug 'mg979/vim-xtabline'
" Plug 'liuchengxu/eleline.vim'

" General Highlighter
" 显示颜色 例如: #654456
if has('nvim')
    Plug 'norcalli/nvim-colorizer.lua'
else
    Plug 'RRethy/vim-hexokinase',  { 'do': 'make hexokinase' }
endif

" visual enhancement
Plug 'wincent/terminus'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

" File navigation
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', {'do': {-> fzf#install()}}
Plug 'junegunn/fzf.vim'
" Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release/rpc' }
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
" Plug 'kevinhwang91/rnvimr'

" 忘记sudo?使用: sudowrite或: sw
Plug 'lambdalisue/suda.vim'

" Plug 'tyru/open-browser.vim'

" 悬浮终端
Plug 'voldikss/vim-floaterm', {'on': ['FloatermNew', 'FloatermToggle']}

" 关闭buffer而不关闭窗口
" Plug 'rbgrouleff/bclose.vim', {'on': 'Bclose'}

" 平滑滚动
Plug 'psliwka/vim-smoothie'

" 最大化窗口，ctrl w o
Plug 'troydm/zoomwintab.vim', {'on': 'ZoomWinTabToggle'}

if has('nvim')
    Plug 'dstein64/nvim-scrollview'
endif

" Undo Tree
" Plug 'simnalamburt/vim-mundo'

" 笔记插件，支持markdown
" Plug 'vimwiki/vimwiki'

" 专注阅读
" Plug 'junegunn/goyo.vim', { 'on': 'Goyo', 'for': 'markdown' }

" markdown

" 语法检查
" Plug 'rhysd/vim-grammarous', {'for': ['markdown', 'vimwiki', 'md', 'tex']}

" Git
" Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'cohama/agit.vim'
" Plug 'kdheepak/lazygit.nvim'

" Changes Vim working directory to project root.
Plug 'airblade/vim-rooter'

" Plug 'pechorin/any-jump.vim'

" automatically highlighting other uses of the current word under the cursor
Plug 'RRethy/vim-illuminate'

Plug 'Yggdroot/indentLine'
Plug 'Yggdroot/hiPairs'
Plug 'luochen1990/rainbow'

" 自动补全括号
Plug 'jiangmiao/auto-pairs'

" 显示清除尾部空格
Plug 'ntpeters/vim-better-whitespace'

" 快速包围
Plug 'tpope/vim-surround'

" 注释插件
Plug 'scrooloose/nerdcommenter'

" 生成注释文档
" Plug 'kkoomen/vim-doge', {'do': {-> doge#install()}}

" 多光标
Plug 'mg979/vim-visual-multi'

" 对齐
" Plug 'junegunn/vim-easy-align', {'on': ['EasyAlign', '<Plug>(EasyAlign)']}
Plug 'godlygeek/tabular'

" 功能很强的折叠插件, zc zo
Plug 'pseewald/vim-anyfold'

" 加强版的 go to file
" Plug 'tpope/vim-apathy'

" 快速移动
Plug 'easymotion/vim-easymotion', {'on':
   \ [
   \ '<Plug>(easymotion-bd-f)', '<Plug>(easymotion-overwin-f)',
   \ '<Plug>(easymotion-overwin-f2)', '<Plug>(easymotion-bd-jk)',
   \ '<Plug>(easymotion-overwin-line)', '<Plug>(easymotion-bd-w)',
   \ '<Plug>(easymotion-overwin-w)', '<Plug>(easymotion-s)',
   \ ]}

" 替换
Plug 'svermeulen/vim-subversive'

" switching between a single-line statement and a multi-line one.
" gS to split a one-liner into multiple lines
" gJ (with the cursor on the first line of a block) to join a block into a single-line statement.
Plug 'AndrewRadev/splitjoin.vim'

" 全局替换插件
" Plug 'brooth/far.vim'
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }

" Taglist
" Plug 'liuchengxu/vista.vim'

" if has('nvim')
    " Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    " Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    " Plug 'nvim-treesitter/nvim-treesitter-refactor'
    " Plug 'romgrk/nvim-treesitter-context'
" else
    " Plug 'sheerun/vim-polyglot'
    " Plug 'octol/vim-cpp-enhanced-highlight'
" endif

" Autoformat
" Plug 'google/vim-maktaba'
" Plug 'google/vim-codefmt'
" Plug 'google/vim-glaive'

" A multi-language debugging plugin for Vim
" c debug
" Plug 'puremourning/vimspector'

" 代码段
" Plug 'honza/vim-snippets'
" Plug 'SirVer/ultisnips'

" 代码补全插件
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" coc插件列表，可根据需要进行删减
let g:coc_global_extensions = [
    \ 'coc-explorer',
    \ 'coc-json',
    \ ]

    " \ 'coc-vimlsp',
    " \ 'coc-xml',
    " \ 'coc-yank',
    " \ 'coc-sh',
    " \ 'coc-yaml',
    " \ 'coc-cmake',
    " \ 'coc-snippets',
    " \ 'coc-clangd',
    " \ 'coc-lists',
    " \ 'coc-word',
    " \ 'coc-python',
    " \ 'coc-ci',
    " \ 'coc-git',
    " \ 'coc-marketplace',
    " \ 'coc-tsserver',
    " \ 'coc-prettier',
    " \ 'coc-calc',
    " \ 'coc-tabnine',
    " \ 'coc-fzf-preview',
    " \ 'coc-bookmark',
    " \ 'coc-rainbow-fart',
    " \ 'coc-lists',
