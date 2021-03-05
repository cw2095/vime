"======================================================================
"
" tools.vim - tool functions
"
" Created by skywind on 2018/02/10
" Last Modified: 2021/03/05 13:36
"
"======================================================================

" 首先需要在config/plugin_list.vim中增加插件

" 从Github源码安装软件
Plug 'junegunn/fzf', { 'dir': '~/GitHub/fzf', 'do': './install --all'  }

" $ cd ctags
" $ ./autogen.sh
" $ ./configure --prefix=/where/you/want # defaults to /usr/local
" $ make
" $ make install # may require extra privileges depending on where to install
" emerge dev-libs/jansson
" ctags --list-features
Plug 'universal-ctags/ctags', {'dir':'~/GitHub/ctags'}

" $ cmake -H. -Bbuild
" $ cmake -DENABLE_UNIT_TESTS=OFF -DENABLE_FUNC_TESTS=OFF $BEAR_SOURCE_DIR
" $ cd build
" $ make
" $ make install
Plug 'rizsotto/Bear', {'dir':'~/GitHub/bear'}

" 起始界面
Plug 'mhinz/vim-startify'

" 查看启动时间
Plug 'dstein64/vim-startuptime', {'on':'StartupTime'}

" 主题theme类插件
Plug 'ajmwagar/vim-deus'
" Plug 'rakr/vim-one'
" Plug 'arcticicestudio/nord-vim'
" Plug 'morhetz/gruvbox'
" Plug 'sainnhe/gruvbox-material'
" Plug 'sainnhe/forest-night'
" Plug 'srcery-colors/srcery-vim'
" Plug 'hardcoreplayers/oceanic-material'
" Plug 'chuling/ci_dark'
" Plug 'kristijanhusak/vim-hybrid-material'
" Plug 'mhartington/oceanic-next'
" Plug '986299679/space-vim-theme'
" Plug 'ayu-theme/ayu-vim'
" Plug 'w0ng/vim-hybrid'
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'flrnd/candid.vim'
" Plug 'jaredgorski/spacecamp'
" Plug 'bluz71/vim-moonfly-colors'
" Plug 'cormacrelf/vim-colors-github'
" Plug 'arzg/vim-colors-xcode'
" Plug 'sainnhe/sonokai'
" Plug 'sonph/onehalf'
" Plug 'ghifarit53/tokyonight-vim'
" Plug 'sainnhe/edge'
" Plug 'reedes/vim-colors-pencil'
" Plug 'ChristianChiarulli/nvcode-color-schemes.vim'

" 顶栏和底栏
" Plug 'rbong/vim-crystalline'
Plug 'itchyny/lightline.vim'
" Plug 'bagrat/vim-buffet'
" Plug 'romgrk/barbar.nvim'
Plug 'mg979/vim-xtabline'
" Plug 'liuchengxu/eleline.vim'

" UI extensions for Vim
Plug 'skywind3000/vim-quickui'

" General Highlighter
" 显示颜色 例如: #654456
if has('nvim')
    Plug 'norcalli/nvim-colorizer.lua'
else
    Plug 'RRethy/vim-hexokinase',  { 'do': 'make hexokinase' }
endif

" vim中文文档
Plug 'yianwillis/vimcdoc'

" vim 中文输入法
" Plug 'ZSaberLv0/ZFVimIM'
" Plug 'ZSaberLv0/ZFVimJob' " 可选, 用于提升词库加载性能
" Plug 'ZSaberLv0/ZFVimGitUtil' " 可选, 如果你希望定期自动清理词库 push 历史
" Plug 'cw2095/ZFVimIM_pinyin_base' " 你的词库
" Plug 'ZSaberLv0/ZFVimIM_openapi' " 可选, 百度云输入法

" automatically highlighting other uses of the current word under the cursor
Plug 'RRethy/vim-illuminate'

" Enhanced terminal integration for Vim
Plug 'wincent/terminus'

" 平滑滚动
Plug 'psliwka/vim-smoothie'
" displays interactive scrollbars
if has('nvim')
    Plug 'dstein64/nvim-scrollview'
endif

" visual enhancement
if has('nvim')
    Plug 'kyazdani42/nvim-web-devicons'
else
    Plug 'ryanoasis/vim-devicons'
endif

" 忘记sudo?使用: sudowrite或: sw
Plug 'lambdalisue/suda.vim'

" 在命令行使用linux命令新建文件文件夹重命名当前buffer等
Plug 'tpope/vim-eunuch'

" 悬浮终端
Plug 'voldikss/vim-floaterm', {'on': ['FloatermNew', 'FloatermToggle']}

" Open URI with your favorite browser from your most favorite editor
Plug 'tyru/open-browser.vim'
" Open GitHub URL of current file, etc. from Vim editor (supported GitHub Enterprise)
" Plug 'tyru/open-browser-github.vim'

" 最大化窗口，ctrl w o
Plug 'troydm/zoomwintab.vim', {'on': 'ZoomWinTabToggle'}

" Changes Vim working directory to project root.
Plug 'airblade/vim-rooter'

" Undo Tree
Plug 'simnalamburt/vim-mundo'

" 笔记插件，支持markdown
" Plug 'vimwiki/vimwiki'

" 专注阅读
" Plug 'junegunn/goyo.vim', { 'on': 'Goyo', 'for': 'markdown' }

" 替换
" Plug 'svermeulen/vim-subversive'

" 多光标
Plug 'mg979/vim-visual-multi'

" 对齐
" Plug 'junegunn/vim-easy-align', {'on': ['EasyAlign', '<Plug>(EasyAlign)']}
Plug 'godlygeek/tabular'

" Range, pattern and substitute preview for Vim
Plug 'markonm/traces.vim'

" 快速移动
Plug 'easymotion/vim-easymotion', {'on':
   \ [
   \ '<Plug>(easymotion-bd-f)', '<Plug>(easymotion-overwin-f)',
   \ '<Plug>(easymotion-overwin-f2)', '<Plug>(easymotion-bd-jk)',
   \ '<Plug>(easymotion-overwin-line)', '<Plug>(easymotion-bd-w)',
   \ '<Plug>(easymotion-overwin-w)', '<Plug>(easymotion-s)',
   \ ]}

" move lines and selections up and down
Plug 'matze/vim-move', {'on': [
    \ '<Plug>MoveBlockDown',
    \ '<Plug>MoveBlockUp',
    \ '<Plug>MoveBlockRight',
    \ '<Plug>MoveBlockLeft'
    \ ]}

" 加强版的 go to file
" Plug 'tpope/vim-apathy'

" 语法检查
Plug 'rhysd/vim-grammarous', {'for': ['markdown', 'vimwiki', 'md', 'tex']}

" switching between a single-line statement and a multi-line one.
Plug 'AndrewRadev/splitjoin.vim'

" Land on window you chose like tmux's 'display-pane'
Plug 't9md/vim-choosewin'

" Pairs of handy bracket mappings
" Plug 'tpope/vim-unimpaired'

" 功能很强的折叠插件, zc zo
" Plug 'pseewald/vim-anyfold'

" 书签
Plug 'MattesGroeger/vim-bookmarks'

Plug 'Yggdroot/indentLine'
Plug 'Yggdroot/hiPairs'
Plug 'luochen1990/rainbow'

" 自动补全括号
Plug 'jiangmiao/auto-pairs'

" 显示清除尾部空格
Plug 'ntpeters/vim-better-whitespace'

" 快速包围
Plug 'tpope/vim-surround'

" 重复上次的动作
Plug 'tpope/vim-repeat'

" 生成函数注释
Plug 'kkoomen/vim-doge', {'do': {-> doge#install()}}
" 注释插件
" Plug 'scrooloose/nerdcommenter'
Plug 'tyru/caw.vim'

" File navigation
" Plug 'kevinhwang91/rnvimr'

Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf'
" Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release/rpc' }

" Git
Plug 'airblade/vim-gitgutter'
" Plug 'tpope/vim-fugitive', {'on': ['Gwrite', 'Gcommit', 'Gread', 'Gdiff', 'Gblame']}
" Plug 'rbong/vim-flog'
" Plug 'cohama/agit.vim'
" Plug 'kdheepak/lazygit.nvim'
" if has('nvim')
"     Plug 'f-person/git-blame.nvim'
" endif

" Plug 'pechorin/any-jump.vim'

" 全局替换插件
" Plug 'brooth/far.vim'
" Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }

" if has('nvim')
"     Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"     Plug 'nvim-treesitter/nvim-treesitter-textobjects'
"     Plug 'nvim-treesitter/nvim-treesitter-refactor'
"     Plug 'romgrk/nvim-treesitter-context'
" else
"     Plug 'sheerun/vim-polyglot'
    " Plug 'octol/vim-cpp-enhanced-highlight'
    " Vim plugin for C/C++/ObjC semantic highlighting using cquery, ccls, or clangd
    Plug 'jackguo380/vim-lsp-cxx-highlight'
" endif

" Autoformat
" Plug 'google/vim-maktaba'
" Plug 'google/vim-codefmt'
" Plug 'google/vim-glaive'

" 代码段
Plug 'honza/vim-snippets'
" Plug 'SirVer/ultisnips'

" Taglist
Plug 'liuchengxu/vista.vim', {'on': ['Vista!!', 'Vista']}

" gtags
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'skywind3000/gutentags_plus'
" Plug 'skywind3000/vim-preview'

" A multi-language debugging plugin for Vim
" c debug
" Plug 'puremourning/vimspector'

" 代码补全插件
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" code build and run
" 使用 Vim 8 / NeoVim 的异步机制，让你在后台运行 shell 命令，并将结果实时显示到 Vim 的 Quickfix 窗口中
" :AsyncRun - 运行 shell 命令
" :AsyncStop - 停止正在运行的任务
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/asyncrun.extra'
" asynctasks.vim 是一个使用 asyncrun 提供任务管理的插件，帮助你管理一系列 building, testing 和 deploying 的任务，并且方便的调度他们。
Plug 'skywind3000/asynctasks.vim'

" coc插件列表，可根据需要进行删减
let g:coc_global_extensions = [
    \ 'coc-vimlsp',
    \ 'coc-clangd',
    \ 'coc-sh',
    \ 'coc-cmake',
    \ 'coc-json',
    \ 'coc-yaml',
    \ 'coc-ci',
    \ 'coc-zi',
    \ 'coc-just-complete',
    \ 'coc-explorer',
    \ 'coc-lists',
    \ 'coc-yank',
    \ 'coc-snippets',
    \ 'coc-translator',
    \ ]

    " \ 'coc-word',
    " \ 'coc-python',
    " \ 'coc-git',
    " \ 'coc-marketplace',
    " \ 'coc-tsserver',
    " \ 'coc-prettier',
    " \ 'coc-calc',
    " \ 'coc-tabnine',
    " \ 'coc-fzf-preview',
    " \ 'coc-bookmark',
    " \ 'coc-rainbow-fart',

" "languageserver": {

" clangd/ccls
"
" compile_commands.json
"
"
"" This file provides compile commands for every source file in a project. It
" is usually generated by tools. Clangd will look in the parent directories of
" the files you edit looking for it.

" CMake-based projects
" If your project builds with CMake, it can generate this file. You should
" enable it with:
"
" cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1
"
" compile_commands.json will be written to your build directory. You should
" symlink it (or simply copy it) to the root of your source tree, if they are
" different.
"
" ln -s ~/myproject/compile_commands.json ~/myproject-build/
"
" Other build systems, using Bear
" Bear is a tool to generate a compile_commands.json file by recording a
" complete build.
"
" For a make-based build, you can run
"
" make clean; bear -- make
"
" to generate the file (and run a clean build!).
"
" compile_flags.txt
"
" If all files in a project use the same build flags, you can put those flags
" one-per-line in compile_flags.txt in your source root.
"
" Clangd will assume the compile command is clang $FLAGS some_file.cc.
"
" Creating this file by hand is a reasonable place to start if your project is
" quite simple.

"     "ccls": {
"         "command": "ccls",
"         "filetypes": ["c", "cpp", "cuda", "objc", "objcpp"],
"         "rootPatterns": [".ccls-root", "compile_commands.json", "__vim_project_root", ".git"],
"         "initializationOptions": {
"             "cache": {
"                 "directory": ".ccls-cache"
"             },
"             "client": {
"                 "snippetSupport": true
"             }
"         }
"     }

" }
