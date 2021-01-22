" Far {pattern} {replace-with} {file-mask} [params]
" F {pattern} {file-mask} [params] find only
set lazyredraw
set regexpengine=1

noremap <LEADER><LEADER>f :F  **/*<left><left><left><left><left>
