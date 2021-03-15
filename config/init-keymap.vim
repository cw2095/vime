"======================================================================
"
" keymap.vim -
"
" Created by cw on 2021/03/05
" Last Modified: 2021/03/05 16:27:39
"
"======================================================================
" 有六种映射存在
" - 用于普通模式: 输入命令时。
" - 用于可视模式: 可视区域高亮并输入命令时。
" - 用于选择模式: 类似于可视模式，但键入的字符对选择区进行替换。
" - 用于操作符等待模式: 操作符等待中 ("d"，"y"，"c" 等等之后)。
" - 用于插入模式: 也用于替换模式。
" - 用于命令行模式: 输入 ":" 或 "/" 命令时。
"
" 关于每个映射命令对应的工作模式的概况。详情见下。
"
" 命 令                          模 式
" :map  :noremap  :unmap         普通、可视、选择、操作符等待
" :nmap :nnoremap :nunmap        普通
" :vmap :vnoremap :vunmap        可视与选择
" :smap :snoremap :sunmap        选择
" :xmap :xnoremap :xunmap        可视
" :omap :onoremap :ounmap        操作符等待
" :map! :noremap! :unmap!        插入与命令行
" :imap :inoremap :iunmap        插入
" :lmap :lnoremap :lunmap        插入、命令行、Lang-Arg
" :cmap :cnoremap :cunmap        命令行
" :tmap :tnoremap :tunmap        终端作业

nmap <space> <nop>
noremap <silent><tab> <nop>

" quit all
noremap <silent>Q :confirm qall<cr>

" let g:mapLEADER="<space>"

noremap ; :
nnoremap ! :!

" noremap - N
" noremap = n

" Save & quit
nnoremap <LEADER>] <ESC>:write<cr>
onoremap <LEADER>] <ESC>:write<cr>
nnoremap <LEADER>[ <ESC>:close<cr>
vnoremap <LEADER>[ <ESC>:close<cr>


" Copy to system clipboard
vnoremap Y "+y

" Indentation
nnoremap < <<
nnoremap > >>

" 关闭搜索颜色
nnoremap <BackSpace> :nohl<cr>:redraw!<cr>

" Adjacent duplicate words
" noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Space to Tab
nnoremap <LEADER>ff :%s/    /\t/g
vnoremap <LEADER>ff :s/    /\t/g
nnoremap <LEADER>ft :%s/\t/    /g
vnoremap <LEADER>ft :s/\t/    /g

" find and replace
nnoremap <LEADER>fr :<C-u>%s///g<Left><Left><Left>
vnoremap <LEADER>fr :s///g<Left><Left><Left>

" Call figlet
nnoremap <LEADER>fx :r !figlet<space><space><space><space>

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

nmap <leader>ew :e <C-R>=expand('%:h').'/'<cr>
nmap <leader>es :sp <C-R>=expand('%:h').'/'<cr>
nmap <leader>ev :vsp <C-R>=expand('%:h').'/'<cr>
nmap <leader>et :tabe <C-R>=expand('%:h').'/'<cr>

" Swap two words
" nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`''`

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Underline the current line with '='
nmap <silent> <leader>ul :t.<CR>Vr=

" Folding
" noremap <silent> <LEADER>o za

" Opening a terminal window
if has('nvim')
    noremap <LEADER>tt :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>
endif

nnoremap <C-g> :tabe<cr>:-tabmove<cr>:term lazygit<cr>


nnoremap <LEADER>p :echo expand('%:p')<CR>

" 使用回车打开关闭折叠
" nnoremap <CR> za

"----------------------------------------------------------------------
" text-objects
"----------------------------------------------------------------------
onoremap e :<c-u>normal! ggVG<cr>
vnoremap e ogg0oG$
onoremap il :<c-u>normal! v$o^oh<cr>
vnoremap il $o^oh
" make Y to copy till the end of the line
nnoremap Y y$
nnoremap <LEADER>vv ^vg_
nnoremap <LEADER>ve v$h
nnoremap <LEADER>va ggVG
" replace
noremap <space>v viw"0p
noremap <space>y yiw

" 使用系统应用打开当前buffer文件
noremap <silent> <M-x> :call common#functions#OpenFileUsingSystemApp(expand('%:p'))<cr>

augroup vime_keymap_group
    autocmd!
    " 使用esc退出终端
    if has('nvim')
        au TermOpen term://* tnoremap <buffer> <ESC> <C-\><C-n> " | startinsert
        " au BufEnter term://* startinsert
    else
        au TerminalOpen term://* tnoremap <buffer> <ESC> <C-\><C-n> " | startinsert
        " au BufEnter term://* startinsert
    endif
augroup END

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
map <Down> gj
map <Up> gk
" noremap <silent> K 5k
" noremap <silent> J 5j

noremap <C-U> 5<C-y>
noremap <C-D> 5<C-e>

inoremap jk <ESC>

"----------------------------------------------------------------------
" map CTRL_HJKL to move cursor in all mode
" config terminal bind <backspace> to ASCII code 127
"----------------------------------------------------------------------
noremap <C-h> <left>
noremap <C-j> <down>
noremap <C-k> <up>
noremap <C-l> <right>
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>

" Insert Mode Cursor Movement
inoremap <C-e> <ESC>A
inoremap <C-a> <ESC>I
inoremap <C-o> <ESC>o
inoremap <C-O> <ESC>O
cnoremap <C-d> <del>

" Command Mode Cursor Movement
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <del>
" After whitespace, insert the current directory into a command-line path
cnoremap <expr> <C-P> getcmdline()[getcmdpos()-2] ==# ' ' ? expand('%:p:h') : "\<C-P>"

"----------------------------------------------------------------------
" buffer keymap
"----------------------------------------------------------------------
noremap <silent>\bn :bn<cr>
noremap <silent>\bp :bp<cr>
noremap <silent>\bm :bm<cr>
noremap <silent>\bv :vs<cr>
noremap <silent>\bs :sp<cr>
noremap <silent>\bd :bdelete<cr>
noremap <silent>\bl :ls<cr>
noremap <silent>\bb :ls<cr>:b
noremap <silent>\bc :BufferClose<cr>

"----------------------------------------------------------------------
" window keymaps
"----------------------------------------------------------------------
noremap <silent>\ww <c-w>w
noremap <silent>\wv <c-w>v
noremap <silent>\ws <c-w>s
noremap <silent>\wh <c-w>h
noremap <silent>\wj <c-w>j
noremap <silent>\wk <c-w>k
noremap <silent>\wl <c-w>l
noremap <silent>\wc <c-w>c
noremap <silent>\wo <c-w>o
noremap <silent>\w1 :1wincmd w<cr>
noremap <silent>\w2 :2wincmd w<cr>
noremap <silent>\w3 :3wincmd w<cr>
noremap <silent>\w4 :4wincmd w<cr>
noremap <silent>\w5 :5wincmd w<cr>
noremap <silent>\w6 :6wincmd w<cr>
noremap <silent>\w7 :7wincmd w<cr>
noremap <silent>\w8 :8wincmd w<cr>
noremap <silent>\w9 :9wincmd w<cr>

" Resize splits with arrow keys
nnoremap <silent>\w= :res +5<cr>
nnoremap <silent>\w- :res -5<cr>
nnoremap <silent>\w[ :vertical resize-5<cr>
nnoremap <silent>\w] :vertical resize+5<cr>

" window management
noremap <tab>h <c-w>h
noremap <tab>j <c-w>j
noremap <tab>k <c-w>k
noremap <tab>l <c-w>l
noremap <tab>s <c-w>s
noremap <tab>v <c-w>v
noremap <tab>w <c-w>w
noremap <tab>c <c-w>c
noremap <tab>o <c-w>o
noremap <tab>+ <c-w>+
noremap <tab>- <c-w>-
noremap <tab>, <c-w><
noremap <tab>. <c-w>>
noremap <tab>= <c-w>=

"----------------------------------------------------------------------
" tab keymap
"----------------------------------------------------------------------
noremap <silent>\tc :tabnew<cr>
noremap <silent>\tq :tabclose<cr>
noremap <silent>\tn :tabnext<cr>
noremap <silent>\tp :tabprev<cr>
noremap <silent>\to :tabonly<cr>
" noremap <silent>\th :-tabmove<cr>
" noremap <silent>\tl :+tabmove<cr>
noremap <silent><leader>th :call Tab_MoveLeft()<cr>
noremap <silent><leader>tl :call Tab_MoveRight()<cr>
noremap <silent>\ta g<tab>
noremap <silent>\1 :tabn 1<cr>
noremap <silent>\2 :tabn 2<cr>
noremap <silent>\3 :tabn 3<cr>
noremap <silent>\4 :tabn 4<cr>
noremap <silent>\5 :tabn 5<cr>
noremap <silent>\6 :tabn 6<cr>
noremap <silent>\7 :tabn 7<cr>
noremap <silent>\8 :tabn 8<cr>
noremap <silent>\9 :tabn 9<cr>
noremap <silent>\0 :tabn 10<cr>
noremap <silent><s-tab> :tabnext<CR>
inoremap <silent><s-tab> <ESC>:tabnext<CR>

" tab enhancement
noremap <silent><tab>f <c-i>
noremap <silent><tab>b <c-o>

"----------------------------------------------------------------------
" tab keymap in gvim
"----------------------------------------------------------------------
" GVIM/MacVim 下设置 ALT-0-9 来切换TAB（GVim/MacVim可以直接映射ALT）
if has('gui_running')
    noremap <silent><c-tab> :tabprev<CR>
    inoremap <silent><c-tab> <ESC>:tabprev<CR>
    noremap <silent><m-1> :tabn 1<cr>
    noremap <silent><m-2> :tabn 2<cr>
    noremap <silent><m-3> :tabn 3<cr>
    noremap <silent><m-4> :tabn 4<cr>
    noremap <silent><m-5> :tabn 5<cr>
    noremap <silent><m-6> :tabn 6<cr>
    noremap <silent><m-7> :tabn 7<cr>
    noremap <silent><m-8> :tabn 8<cr>
    noremap <silent><m-9> :tabn 9<cr>
    noremap <silent><m-0> :tabn 10<cr>
    inoremap <silent><m-1> <ESC>:tabn 1<cr>
    inoremap <silent><m-2> <ESC>:tabn 2<cr>
    inoremap <silent><m-3> <ESC>:tabn 3<cr>
    inoremap <silent><m-4> <ESC>:tabn 4<cr>
    inoremap <silent><m-5> <ESC>:tabn 5<cr>
    inoremap <silent><m-6> <ESC>:tabn 6<cr>
    inoremap <silent><m-7> <ESC>:tabn 7<cr>
    inoremap <silent><m-8> <ESC>:tabn 8<cr>
    inoremap <silent><m-9> <ESC>:tabn 9<cr>
    inoremap <silent><m-0> <ESC>:tabn 10<cr>
    noremap <silent><m-up> :tabprev<cr>
    noremap <silent><m-down> :tabnext<cr>
    inoremap <silent><m-up> <ESC>:tabprev<cr>
    inoremap <silent><m-down> <ESC>:tabnext<cr>
endif

"----------------------------------------------------------------------
" tab keymap in macvim
"----------------------------------------------------------------------
" 在 MacVim 下还可以用 CMD_0-9 快速切换
if has("gui_macvim")
    set macmeta
    noremap <silent><c-tab> :tabprev<CR>
    inoremap <silent><c-tab> <ESC>:tabprev<CR>
    noremap <silent><d-1> :tabn 1<cr>
    noremap <silent><d-2> :tabn 2<cr>
    noremap <silent><d-3> :tabn 3<cr>
    noremap <silent><d-4> :tabn 4<cr>
    noremap <silent><d-5> :tabn 5<cr>
    noremap <silent><d-6> :tabn 6<cr>
    noremap <silent><d-7> :tabn 7<cr>
    noremap <silent><d-8> :tabn 8<cr>
    noremap <silent><d-9> :tabn 9<cr>
    noremap <silent><d-0> :tabn 10<cr>
    inoremap <silent><d-1> <ESC>:tabn 1<cr>
    inoremap <silent><d-2> <ESC>:tabn 2<cr>
    inoremap <silent><d-3> <ESC>:tabn 3<cr>
    inoremap <silent><d-4> <ESC>:tabn 4<cr>
    inoremap <silent><d-5> <ESC>:tabn 5<cr>
    inoremap <silent><d-6> <ESC>:tabn 6<cr>
    inoremap <silent><d-7> <ESC>:tabn 7<cr>
    inoremap <silent><d-8> <ESC>:tabn 8<cr>
    inoremap <silent><d-9> <ESC>:tabn 9<cr>
    inoremap <silent><d-0> <ESC>:tabn 10<cr>
    noremap <silent><d-o> :browse tabnew<cr>
    inoremap <silent><d-o> <ESC>:browse tabnew<cr>
endif


"----------------------------------------------------------------------
" gvim keymaps
"----------------------------------------------------------------------
if has('gui_running')
    noremap <silent><m-t> :tabnew<cr>
    inoremap <silent><m-t> <ESC>:tabnew<cr>
    noremap <silent><m-w> :tabclose<cr>
    inoremap <silent><m-w> <ESC>:tabclose<cr>
    noremap <silent><m-v> :close<cr>
    inoremap <silent><m-v> <ESC>:close<cr>
    noremap <m-s> :w<cr>
    inoremap <m-s> <esc>:w<cr>
endif

"----------------------------------------------------------------------
" fast window switching: ALT+SHIFT+HJKL
"----------------------------------------------------------------------
noremap <m-H> <c-w>h
noremap <m-L> <c-w>l
noremap <m-J> <c-w>j
noremap <m-K> <c-w>k
inoremap <m-H> <esc><c-w>h
inoremap <m-L> <esc><c-w>l
inoremap <m-J> <esc><c-w>j
inoremap <m-K> <esc><c-w>k

if has('terminal') && exists(':terminal') == 2 && has('patch-8.1.1')
    set termwinkey=<c-_>
    tnoremap <m-H> <c-_>h
    tnoremap <m-L> <c-_>l
    tnoremap <m-J> <c-_>j
    tnoremap <m-K> <c-_>k
    tnoremap <m-q> <c-\><c-n>
    tnoremap <m-1> <c-_>1gt
    tnoremap <m-2> <c-_>2gt
    tnoremap <m-3> <c-_>3gt
    tnoremap <m-4> <c-_>4gt
    tnoremap <m-5> <c-_>5gt
    tnoremap <m-6> <c-_>6gt
    tnoremap <m-7> <c-_>7gt
    tnoremap <m-8> <c-_>8gt
    tnoremap <m-9> <c-_>9gt
    tnoremap <m-0> <c-_>10gt
elseif has('nvim')
    tnoremap <m-H> <c-\><c-n><c-w>h
    tnoremap <m-L> <c-\><c-n><c-w>l
    tnoremap <m-J> <c-\><c-n><c-w>j
    tnoremap <m-K> <c-\><c-n><c-w>k
    tnoremap <m-q> <c-\><c-n>
    tnoremap <m-1> <c-\><c-n>1gt
    tnoremap <m-2> <c-\><c-n>2gt
    tnoremap <m-3> <c-\><c-n>3gt
    tnoremap <m-4> <c-\><c-n>4gt
    tnoremap <m-5> <c-\><c-n>5gt
    tnoremap <m-6> <c-\><c-n>6gt
    tnoremap <m-7> <c-\><c-n>7gt
    tnoremap <m-8> <c-\><c-n>8gt
    tnoremap <m-9> <c-\><c-n>9gt
    tnoremap <m-0> <c-\><c-n>10gt
endif

" Window management
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l
" tnoremap <C-h> <C-\><C-n><C-w>h
" tnoremap <C-j> <C-\><C-n><C-w>j
" tnoremap <C-k> <C-\><C-n><C-w>k
" tnoremap <C-l> <C-\><C-n><C-w>l

" Disable the default s key
" noremap s <nop>
" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
" nnoremap <C-w>k :set nosplitbelow<cr>:split<cr>:set splitbelow<cr>
" nnoremap <C-w>j :set splitbelow<cr>:split<cr>
" nnoremap <C-w>h :set nosplitright<cr>:vsplit<cr>:set splitright<cr>
" nnoremap <C-w>l :set splitright<cr>:vsplit<cr>


" Tab management
" nnoremap <silent> <LEADER>tn :tabnew<cr>
" nnoremap <silent> <LEADER>tc :tabclose<cr>
" nnoremap <silent> <LEADER>th :-tabnext<cr>
" nnoremap <silent> <LEADER>tl :+tabnext<cr>¬
" nnoremap <silent> tmh :-tabmove<cr>
" nnoremap <silent> tml :+tabmove<cr>¬


"----------------------------------------------------------------------
" unimpaired
"----------------------------------------------------------------------
nnoremap <silent>[a :previous<cr>
nnoremap <silent>]a :next<cr>
nnoremap <silent>[A :first<cr>
nnoremap <silent>]A :last<cr>
nnoremap <silent>[b :bprevious<cr>
nnoremap <silent>]b :bnext<cr>
nnoremap <silent>[w :tabprevious<cr>
nnoremap <silent>]w :tabnext<cr>
nnoremap <silent>[W :tabfirst<cr>
nnoremap <silent>]W :tablast<cr>
nnoremap <silent>[q :cprevious<cr>
nnoremap <silent>]q :cnext<cr>
nnoremap <silent>[Q :cfirst<cr>
nnoremap <silent>]Q :clast<cr>
nnoremap <silent>[l :lprevious<cr>
nnoremap <silent>]l :lnext<cr>
nnoremap <silent>[L :lfirst<cr>
nnoremap <silent>]L :llast<cr>
nnoremap <silent>[t :tprevious<cr>
nnoremap <silent>]t :tnext<cr>
nnoremap <silent>[T :tfirst<cr>
nnoremap <silent>]T :tlast<cr>

" unimpaired options
nnoremap <silent>[oc :setl cursorline<cr>
nnoremap <silent>]oc :setl nocursorline<cr>
nnoremap <silent>[os :setl spell<cr>
nnoremap <silent>]os :setl nospell<cr>
nnoremap <silent>[op :setl paste<cr>
nnoremap <silent>]op :setl nopaste<cr>
nnoremap <silent>[ow :setl wrap<cr>
nnoremap <silent>]ow :setl nowrap<cr>

nnoremap [e  :<C-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<C-u>execute 'move +'. v:count1<cr>

nnoremap [<space>  :<C-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<C-u>put =repeat(nr2char(10), v:count1)<cr>


"----------------------------------------------------------------------
" GUI/Terminal
"----------------------------------------------------------------------
noremap <silent><M-[> :call Tools_QuickfixCursor(2)<cr>
noremap <silent><M-]> :call Tools_QuickfixCursor(3)<cr>
noremap <silent><M-{> :call Tools_QuickfixCursor(4)<cr>
noremap <silent><M-}> :call Tools_QuickfixCursor(5)<cr>
noremap <silent><M-u> :call Tools_PreviousCursor(6)<cr>
noremap <silent><M-d> :call Tools_PreviousCursor(7)<cr>

inoremap <silent><M-[> <c-\><c-o>:call Tools_QuickfixCursor(2)<cr>
inoremap <silent><M-]> <c-\><c-o>:call Tools_QuickfixCursor(3)<cr>
inoremap <silent><M-{> <c-\><c-o>:call Tools_QuickfixCursor(4)<cr>
inoremap <silent><M-}> <c-\><c-o>:call Tools_QuickfixCursor(5)<cr>
inoremap <silent><M-u> <c-\><c-o>:call Tools_PreviousCursor(6)<cr>
inoremap <silent><M-d> <c-\><c-o>:call Tools_PreviousCursor(7)<cr>


"----------------------------------------------------------------------
" space + h : fast open files
"----------------------------------------------------------------------
noremap <space>hf <c-w>gf

let s:filename = expand(g:config_root_path)
let s:plugin_list = fnamemodify(s:filename, ':h'). '/plugin_list.vim'
exec 'nnoremap <space>hp :FileSwitch tabe '.fnameescape(s:plugin_list).'<cr>'
let s:keymap = fnamemodify(s:filename, ':h'). '/init-keymap.vim'
exec 'nnoremap <space>hk :FileSwitch tabe '.fnameescape(s:keymap).'<cr>'
let s:coc_nvim = fnamemodify(s:filename, ':h'). '/plugins/coc.nvim.vim'
exec 'nnoremap <space>hc :FileSwitch tabe '.fnameescape(s:coc_nvim).'<cr>'

let s:nvimrc = expand("~/.config/nvim/init.vim")
exec 'nnoremap <space>hn :FileSwitch tabe '.fnameescape(s:nvimrc).'<cr>'

exec 'nnoremap <space>hq :FileSwitch tabe '.fnameescape(g:quicknote_file).'<cr>'
exec 'nnoremap <space>ht :FileSwitch tabe '.fnameescape(g:todo_file).'<cr>'

let s:logname = g:log_dir . "record.log"
exec 'nnoremap <space>hl :FileSwitch tabe '.fnameescape(s:logname).'<cr>'

exec 'nnoremap <space>hh :FileSwitch tabe '.'/etc/hosts'.'<cr>'

"----------------------------------------------------------------------
" space + e : fast insert something
"----------------------------------------------------------------------
noremap <space>e- :call Tools_snip_comment_block('-')<cr>
noremap <space>e= :call Tools_snip_comment_block('=')<cr>
noremap <space>e* :call Tools_snip_comment_block('*')<cr>
noremap <space>ec :call Tools_snip_copyright('cw')<cr>
noremap <space>el :call Tools_snip_modeline()<cr>
noremap <space>et "=strftime("%Y/%m/%d %H:%M:%S")<CR>gp
