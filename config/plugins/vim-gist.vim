" Setup
" $ git config --global github.user Username
"
" USAGE
" :Gist - Post current buffer to gist, using default privacy option.
" :'<,'>Gist - Post selected text to gist, using default privacy option.
" :Gist -p  - Create a private gist.
" :Gist --private
" :Gist -P - Create a public gist.
" :Gist --public
" :Gist -a - Create a gist anonymously.
" :Gist --anonymous
" :Gist -m - Create a gist with all open buffers.
" :Gist --multibuffer
" :Gist -e -  Edit the gist (you need to have opened the gist buffer first). You can update the gist with the {:w} command within the gist buffer.
" :Gist --edit
" :Gist -e foo.js -  Edit the gist with name 'foo.js' (you need to have opened the gist buffer first).
" :Gist -s something - Post/Edit with the description " (you need to have opened the gist buffer first).
" :Gist --description something
" :Gist -e -s something
" :Gist -d - Delete the gist (you need to have opened the gist buffer first). Password authentication is needed.
" :Gist --delete
" :Gist -f - Fork the gist (you need to have opened the gist buffer first). Password authentication is needed.
" :Gist --fork
" :Gist +1 - Star the gist (you need to have opened the gist buffer first). Password authentication is needed.
" :Gist -1 - Unstar the gist (you need to have opened the gist buffer first). Password authentication is needed.
" :Gist XXXXX - Get gist XXXXX.
" :Gist -c XXXXX - Get gist XXXXX and add to clipboard.
" :Gist -l - List your public gists.
" :Gist --list
" :Gist -l mattn - List gists from user 'mattn'.
" :Gist -la - List everyone's gists.
" :Gist --listall
" :Gist -ls - List gists from your starred gists.
" :Gist --liststar
" :Gist -b - Open the gist on browser after you post or update it.
" :Gist --browser
" :Gist! - Post as new gist after editing on the buffer.
"
" - While the gist list is visible, the following mappings apply:
"   - 'o' or 'Enter' will open the selected gist file in a new buffer and close the vim-gist listing split.
"   - 'b' will open the selected gist file in a browser. If you are in GUI vim you can also achieve this by pressing 'Shift-Enter'.
"   - 'y' will copy the contents of the selected gist to the clipboard, and close the vim-gist listing split.
"   - 'p' will (copy and) paste the contents of the selected gist to the buffer from which vim-gist was called, and close the vim-gist listing split.
"   - 'Esc' will close the vim-gist listing split without performing any further action.

" copy the gist code with option "-c".
let g:gist_clip_command = 'xclip -selection clipboard'
" detect filetype from the filename
let g:gist_detect_filetype = 1
" open the browser after the post
let g:gist_open_browser_after_post = 1
" change the browser
" let g:gist_browser_command = 'w3m %URL%'
" show your private gists with ':Gist -l'
let g:gist_show_privates = 1
" want your gist to be private by default:
let g:gist_post_private = 0
" want your gist to be anonymous by default:
let g:gist_post_anonymous = 0
" want to edit all files for gists containing more than one:
let g:gist_get_multiplefile = 1
" use on GitHub Enterprise:
" let g:gist_api_url = 'http://your-github-enterprise-domain/api/v3'
" open gist with current editing buffers:
" let g:gist_edit_with_buffers = 1
" open gist list/buffer as vertical split:
" let g:gist_list_vsplit = 1
" modify filetype for the file on github, or add mapping of filetype/file-extension:
" let g:gist_extmap = { '.swift': 'swift' }

" If you want to update a gist, embed >
"   GistID: xxxxx
" >
" in your local file, then call >
"   :Gist

" :w and :w! update a gist.
" let g:gist_update_on_write = 1
" Only :w! updates a gist.
let g:gist_update_on_write = 2

" let g:gist_use_password_in_gitconfig = 1
