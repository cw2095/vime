let g:EasyMotion_do_mapping = 0
" let g:EasyMotion_do_shade = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwx-^&*()+123456ABCDEF/;\=[]GHIJKLMNOPQRST7890UVWXYZyz'


" nmap <tab>m <Plug>(easymotion-s)
" nmap <tab>n <Plug>(easymotion-overwin-w)

" 一个字符
map f <Plug>(easymotion-bd-f)
nmap f <Plug>(easymotion-overwin-f)

" 无需输入字符，即可全屏搜索单词
" 单词间移动
map  F <Plug>(easymotion-bd-w)
nmap F <Plug>(easymoton-overwin-w)

" 两个字符
nmap F <Plug>(easymotion-overwin-f2)

" 移动到行
map  gl <Plug>(easymotion-bd-jk)
nmap gl <Plug>(easymotion-overwin-line)
