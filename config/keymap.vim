" Set <LEADER> as <space>, ; as :
nmap <space> <nop>
nmap Q <nop>
" let g:mapLEADER="<space>"

noremap ; :
nnoremap ! :!

noremap - N
noremap = n

" Save & quit
nnoremap <LEADER>w <esc>:write<cr>
xnoremap <LEADER>w <esc>:write<cr>
nnoremap <LEADER>q <esc>:close<cr>
vnoremap <LEADER>q <esc>:close<cr>

" make Y to copy till the end of the line
nnoremap Y y$
nnoremap <LEADER>vv ^vg_
nnoremap <LEADER>vb v$h

" Copy to system clipboard
vnoremap Y "+y

" Indentation
nnoremap < <<
nnoremap > >>

" 关闭搜索颜色
nnoremap <BackSpace> :nohl<cr>

" Adjacent duplicate words
" noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Space to Tab
nnoremap <LEADER>ff :%s/    /\t/g
vnoremap <LEADER>ff :s/    /\t/g
nnoremap <LEADER>ft :%s/\t/    /g
vnoremap <LEADER>ft :s/\t/    /g

" find and replace
nnoremap <LEADER>s :<C-u>%s///g<Left><Left><Left>
vnoremap <LEADER>s :s///g<Left><Left><Left>

" Folding
" noremap <silent> <LEADER>o za

" Opening a terminal window
if has('nvim')
    noremap <LEADER>tt :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>
endif

nnoremap <C-g> :tabe<cr>:-tabmove<cr>:term lazygit<cr>

" Call figlet
nnoremap <LEADER>fx :r !figlet<space><space><space><space>

nnoremap <LEADER>p :echo expand('%:p')<CR>

nnoremap [e  :<C-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<C-u>execute 'move +'. v:count1<cr>

nnoremap [<space>  :<C-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<C-u>put =repeat(nr2char(10), v:count1)<cr>

" 使用回车打开关闭折叠
" nnoremap <CR> za

augroup vime_keymap_group
    autocmd!
    " 使用esc退出终端
    if has('nvim')
        au TermOpen term://* tnoremap <buffer> <Esc> <C-\><C-n> " | startinsert
        " au BufEnter term://* startinsert
    else
        au TerminalOpen term://* tnoremap <buffer> <Esc> <C-\><C-n> " | startinsert
        " au BufEnter term://* startinsert
    endif
augroup END

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
noremap <silent> K 5k
noremap <silent> J 5j

noremap <C-U> 5<C-y>
noremap <C-E> 5<C-e>

" Insert Mode Cursor Movement
inoremap <C-e> <ESC>A
inoremap <C-a> <esc>I
inoremap <C-o> <esc>o
inoremap <C-O> <esc>O
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>
inoremap jk <esc>

" Command Mode Cursor Movement
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>

"  Window management
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Disable the default s key
" noremap s <nop>
" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
nnoremap <C-w>k :set nosplitbelow<cr>:split<cr>:set splitbelow<cr>
nnoremap <C-w>j :set splitbelow<cr>:split<cr>
nnoremap <C-w>h :set nosplitright<cr>:vsplit<cr>:set splitright<cr>
nnoremap <C-w>l :set splitright<cr>:vsplit<cr>

" Resize splits with arrow keys
nnoremap <M--> :res +5<cr>
nnoremap <M-_> :res -5<cr>
nnoremap <M-(> :vertical resize-5<cr>
nnoremap <M-)> :vertical resize+5<cr>

" Tab management
nnoremap <silent> <LEADER>tn :tabnew<cr>
nnoremap <silent> <LEADER>tc :tabclose<cr>
" nnoremap <silent> <LEADER>th :-tabnext<cr>
" nnoremap <silent> <LEADER>tl :+tabnext<cr>¬
" nnoremap <silent> tmh :-tabmove<cr>
" nnoremap <silent> tml :+tabmove<cr>¬

