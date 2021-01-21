" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
nmap Q <nop>

noremap ; :
nnoremap ! :!

noremap - N
noremap = n

" Save & quit
nnoremap S <esc>:w<cr>
nnoremap Q <esc>:close<cr>
vnoremap Q <esc>:close<cr>

" make Y to copy till the end of the line
nnoremap Y y$
nnoremap vv ^vg_
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

" nnoremap <c-n> :tabe<cr>:-tabmove<cr>:term lazygit<cr>

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
inoremap <M-h> <HOME>
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
noremap <LEADER>w <C-w>w
noremap <LEADER>k <C-w>k
noremap <LEADER>j <C-w>j
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l

" Disable the default s key
" noremap s <nop>
" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sk :set nosplitbelow<cr>:split<cr>:set splitbelow<cr>
noremap sj :set splitbelow<cr>:split<cr>
noremap sh :set nosplitright<cr>:vsplit<cr>:set splitright<cr>
noremap sl :set splitright<cr>:vsplit<cr>

" Resize splits with arrow keys
noremap s<up> :res +5<cr>
noremap s<down> :res -5<cr>
noremap s<left> :vertical resize-5<cr>
noremap s<right> :vertical resize+5<cr>

" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<cr>

" Tab management
nnoremap <silent> tn :tabnew<cr>
nnoremap <silent> tc :tabclose<cr>
nnoremap <silent> th :-tabnext<cr>
nnoremap <silent> tl :+tabnext<cr>¬
nnoremap <silent> tmh :-tabmove<cr>
nnoremap <silent> tml :+tabmove<cr>¬

" find and replace
noremap \s :%s//g<left><left>

" Opening a terminal window
noremap <LEADER>/ :set splitbelow<cr>:res +10<cr>:term<cr>

" Call figlet
noremap tx :r !figlet<space><space><space><space>

