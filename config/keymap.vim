" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
nmap Q <nop>

noremap ; :
nnoremap ! :!

noremap - N
noremap = n

" Save & quit
nnoremap <LEADER><LEADER> <esc>:write<cr>
xnoremap <LEADER><LEADER> <esc>:write<cr>
nnoremap <LEADER>q <esc>:close<cr>
vnoremap <LEADER>q <esc>:close<cr>

" make Y to copy till the end of the line
nnoremap Y y$
nnoremap \vv ^vg_
nnoremap \v v$h

" Copy to system clipboard
vnoremap Y "+y

" Indentation
nnoremap < <<
nnoremap > >>

" 关闭搜索颜色
nnoremap <BackSpace> :nohl<cr>

" Adjacent duplicate words
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Space to Tab
nnoremap <LEADER>ff :%s/    /\t/g
vnoremap <LEADER>ff :s/    /\t/g
nnoremap <LEADER>ft :%s/\t/    /g
vnoremap <LEADER>ft :s/\t/    /g

" Folding
noremap <silent> <LEADER>o za

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
noremap <silent> K 5k
noremap <silent> J 5j

noremap <C-U> 5<C-y>
noremap <C-E> 5<C-e>

" Insert Mode Cursor Movement
inoremap <C-a> <ESC>A
inoremap <M-o> <esc>o
inoremap <M-O> <esc>O
" inoremap <M-h> <HOME>
inoremap <M-h> <esc>^i
inoremap <M-l> <END>
inoremap <c-h> <left>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>
inoremap jk <esc>

" Command Mode Cursor Movement
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-w> <S-Right>

"  Window management
noremap <m-h> <C-w>h
noremap <m-j> <C-w>j
noremap <m-k> <C-w>k
noremap <m-l> <C-w>l
tnoremap <m-h> <c-\><c-n><c-w>h
tnoremap <m-j> <c-\><c-n><c-w>j
tnoremap <m-k> <c-\><c-n><c-w>k
tnoremap <m-l> <c-\><c-n><c-w>l

" Disable the default s key
" noremap s <nop>
" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap <m-w>k :set nosplitbelow<cr>:split<cr>:set splitbelow<cr>
noremap <m-w>j :set splitbelow<cr>:split<cr>
noremap <m-w>h :set nosplitright<cr>:vsplit<cr>:set splitright<cr>
noremap <m-w>l :set splitright<cr>:vsplit<cr>

" Resize splits with arrow keys
noremap <m-w><up> :res +5<cr>
noremap <m-w><down> :res -5<cr>
noremap <m-w><left> :vertical resize-5<cr>
noremap <m-w><right> :vertical resize+5<cr>

" Tab management
nnoremap <silent> tn :tabnew<cr>
nnoremap <silent> tc :tabclose<cr>
nnoremap <silent> th :-tabnext<cr>
nnoremap <silent> tl :+tabnext<cr>¬
nnoremap <silent> tmh :-tabmove<cr>
nnoremap <silent> tml :+tabmove<cr>¬

" find and replace
nnoremap \s :<C-u>%s///g<Left><Left><Left>
vnoremap \s :s///g<Left><Left><Left>

" Opening a terminal window
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>

nnoremap <c-g> :tabe<cr>:-tabmove<cr>:term lazygit<cr>

" Call figlet
nnoremap fx :r !figlet<space><space><space><space>

nnoremap <LEADER>p :echo expand('%:p')<CR>

nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

augroup vime_keymap_group
    autocmd!
    " 使用esc退出终端
    if has('nvim')
        au TermOpen term://* tnoremap <buffer> <Esc> <c-\><c-n> " | startinsert
        " au BufEnter term://* startinsert
    else
        au TerminalOpen term://* tnoremap <buffer> <Esc> <C-\><C-n> " | startinsert
        " au BufEnter term://* startinsert
    endif
augroup END
