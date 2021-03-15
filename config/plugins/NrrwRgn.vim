" Ex commands
"
" :NR  - Open the selected region in a new narrowed window
" :NW  - Open the current visual window in a new narrowed window
" :WR  - (In the narrowed window) write the changes back to the original buffer.
" :NRV - Open the narrowed window for the region that was last visually selected.
" :NUD - (In a unified diff) open the selected diff in 2 Narrowed windows
" :NRP - Mark a region for a Multi narrowed window
" :NRM - Create a new Multi narrowed window (after :NRP) - experimental!
" :NRS - Enable Syncing the buffer content back (default on)
" :NRN - Disable Syncing the buffer content back
" :NRL - Reselect the last selected region and open it again in a narrowed window

"  open the narrowed window as a vertical split buffer
let g:nrrw_rgn_vert = 0
" defines the height or the nr of columns
let g:nrrw_rgn_wdth = 30
" what kind of resize will occur. If it is set to absolute, the resizing will be done by absolute lines or columns (depending on whether a horizontal or vertical split has been done). If it is set to relative the window will be resized by a percentage.
let g:nrrw_rgn_resize_window = 'absolute'
" The percentages for increasing the window size can further be specified by seting the following variables:
" let g:nrrw_rgn_rel_min = 10
" let g:nrrw_rgn_rel_max = 80
" specify an increment value
" let g:nrrw_rgn_incr = 10
" specify the options that you want to have set for the narrowed window
" let g:nrrw_custom_options={}
" let g:nrrw_custom_options['filetype'] = 'python'

xmap <Leader>nr <Plug>NrrwrgnDo
nmap <Leader>ni <Plug>NrrwrgnWinIncr

