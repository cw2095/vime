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
Plug 'mg979/vim-xtabline'
" Plug 'liuchengxu/eleline.vim'

" General Highlighter
" 显示颜色 例如: #654456
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
" automatically highlighting other uses of the current word under the cursor
Plug 'RRethy/vim-illuminate'

" visual enhancement
Plug 'luochen1990/rainbow'
Plug 'ryanoasis/vim-devicons'
Plug 'wincent/terminus'
" 对齐线
Plug 'Yggdroot/indentLine', {'on': 'IndentLinesEnable'}
" 显示清除尾部空格
Plug 'ntpeters/vim-better-whitespace'

" File navigation
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', {'do': {-> fzf#install()}}
Plug 'junegunn/fzf.vim'
" Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release/rpc' }
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
" Plug 'kevinhwang91/rnvimr'

" Git
" Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'cohama/agit.vim'
" Plug 'kdheepak/lazygit.nvim'

" IDE madness
Plug 'airblade/vim-rooter'
Plug 'pechorin/any-jump.vim'
" 自动补全括号
Plug 'jiangmiao/auto-pairs'
" Taglist
Plug 'liuchengxu/vista.vim'

