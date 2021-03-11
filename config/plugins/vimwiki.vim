"----------------------------------------------------------------------
" Per-Wiki Options
"----------------------------------------------------------------------
let wiki_1 = {}
" Wiki files location
let wiki_1.path = g:vimwiki_path
" Location of HTML files converted from wiki files
let wiki_1.path_html = g:vimwiki_path . 'wiki_html'
" A name that can be used to create interwiki links
let wiki_1.name = 'wiki_1'
" Set this option to 1 to automatically generate the HTML file when the corresponding wiki page is saved
let wiki_1.auto_export = 0
" Set this option to 1 to automatically update the table of contents when the current wiki page is saved
let wiki_1.auto_toc = 1
" Name of wiki index file
let wiki_1.index = 'index'
" Extension of wiki files
let wiki_1.ext = '.md'
" Wiki syntax
let wiki_1.syntax = 'markdown'
" Set the character (or string) used to replace spaces when creating a link
let wiki_1.links_space_char = '_'
" Setup path for HTML templates
" let wiki_1.template_path = '~/public_html/templates/'
" Setup default template name (without extension).
" let wiki_1.template_default = 'def_template'
" Setup template filename extension.
" let wiki_1.template_ext = '.html'
" Setup CSS file name
" let wiki_1.css_name = style.css
" If on, wiki links to non-existent wiki files are highlighted.  However, it can be quite slow.
let wiki_1.maxhi = 1
" You can configure preformatted text to be highlighted with any syntax available for Vim.
" let wiki_1.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
" If set, the nested syntaxes are automatically derived when opening a buffer.
" let wiki_1.automatic_nested_syntaxes = 1
" The path to the diary wiki files, relative to wiki path
let wiki_1.diary_rel_path = 'diary/'
" Name of wiki-file that holds all links to dated wiki files.
let wiki_1.diary_index = 'diary'
" Name of the header in diary_index where links to dated wiki-files are located.
let wiki_1.diary_header = 'Diary'
" Sort links in a diary index page. desc, asc
let wiki_1.diary_sort = 'desc'
" Controls the presence of captions in the diary index linking to headers within the diary pages.
let wiki_1.diary_caption_level = 0
" The full path to a user-provided script that converts a wiki page to HTML.
let wiki_1.custom_wiki2html = ''
" If a custom script is called with custom_wiki2html, additional parameters can be passed using this option
let wiki_1.custom_wiki2html_args = ''
" Width of left-hand margin for lists.
let wiki_1.list_margin = 0
" Set this option to 1 to automatically update the tags metadata when the current wiki page is saved
let wiki_1.auto_tags = 1
" Set this option to 1 to automatically update the diary index when opened.
let wiki_1.auto_diary_index = 1
" Set this option to 1 to automatically update generated links when the current wiki page is saved
let wiki_1.auto_generate_links = 1
" Set this option to 1 to automatically update generated tags when the current wiki page is saved
let wiki_1.auto_generate_tags = 1
" Set this option to a list of file patterns to exclude when checking or generating links
let wiki_1.exclude_files = [ 'quicknote.md', 'todo.md' ]
" This setting is for integration with the vimwiki_markdown gem.
let wiki_1.html_filename_parameterization = 0

" let wiki_2 = {}
" let wiki_2.path = '~/project_docs/'
" let wiki_2.index = 'main'
"
" let g:vimwiki_list = [wiki_1, wiki_2]

" let g:vimwiki_list = [
"        \ {
"            \ 'path': g:vimwiki_path,
"            \ 'path_html': g:vimwiki_path . 'wiki_html',
"            \ 'syntax': 'markdown',
"            \ 'auto_toc': 1,
"            \ 'ext':'.md',
"            \ 'auto_diary_index': 1,
"        \ }
"    \ ]


"----------------------------------------------------------------------
" Registered Wiki
"----------------------------------------------------------------------
let g:vimwiki_list = [wiki_1]


"----------------------------------------------------------------------
" Global Options
"----------------------------------------------------------------------
" Highlight headers with =Reddish=, ==Greenish==, ===Blueish=== colors.
let g:vimwiki_hl_headers = 0
" Highlight checked list items with a special color
let g:vimwiki_hl_cb_checked = 2
" don't make temporary wiki
let g:vimwiki_global_ext = 0
" A many-to-one mapping between file extensions and syntaxes whose purpose is to register the extensions with Vimwiki.
let g:vimwiki_ext2syntax = {
            \ '.md': 'markdown', '.mkdn': 'markdown',
            \ '.mdwn': 'markdown', '.mdown': 'markdown',
            \ '.markdown': 'markdown', '.mw': 'media',
            \ }
" Create a menu in the menu bar of GVim, where you can open the available wikis.
let g:vimwiki_menu = 'Vimwiki'
" todo符号
let g:vimwiki_listsyms = '✗○◐●✓'
" Character that is used to show that an item of a todo list will not be done.
let g:vimwiki_listsym_rejected = '✗'
" Enable/disable Vimwiki's folding (outline) functionality.
let g:vimwiki_folding = ''
" This is HTML related. Convert newlines to <br />s in multiline list items.
let g:vimwiki_list_ignore_newline = 1
" This is HTML related. Convert newlines to <br />s in text.
let g:vimwiki_text_ignore_newline = 1
" Create new or open existing diary wiki-file for the date selected in Calendar.
let g:vimwiki_use_calendar = 1
" Create target wiki page if it does not exist.
let g:vimwiki_create_link = 1
" Append wiki file extension to links in Markdown. This is needed for compatibility with other Markdown tools.
let g:vimwiki_markdown_link_ext = 1
" VimwikiLinkHandler - A customizable link handler can be defined to override Vimwiki's behavior when opening links.
" VimwikiLinkConverter - This function can be overridden in your .vimrc to specify what a link looks like when converted to HTML.
" VimwikiWikiIncludeHandler - Vimwiki includes the content of a wiki-include URL as an image by default.
" Enable/disable table auto formatting after leaving INSERT mode.
let g:vimwiki_table_auto_fmt = 1
" If set, the last column separator will not be expanded to fill the cell.
let g:vimwiki_table_reduce_last_col = 0
" Convert directory name from current 'encoding' into 'g:vimwiki_w32_dir_enc' before it is created.
let g:vimwiki_w32_dir_enc = ''
" Use a special method to calculate the correct length of the strings with double-wide characters (to align table cells properly).
let g:vimwiki_CJK_length = 0
" This option is about what to do with links to directories, like [[directory/]], [[papers/]], etc.
let g:vimwiki_dir_link = ''
" Set this option if you want headers to be auto-numbered in HTML.
let g:vimwiki_html_header_numbering = 0
" Ending symbol for g:vimwiki_html_header_numbering
let g:vimwiki_html_header_numbering_sym = ''
" Case-insensitive comma separated list of HTML tags that can be used in Vimwiki.
let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr'
" Comma-separated list of HTML files that have no corresponding wiki files and should not be deleted after :VimwikiAll2HTML
let g:vimwiki_user_htmls = ''
" Vimwiki sets 'conceallevel' to g:vimwiki_conceallevel every time a Vimwiki buffer is entered.
let g:vimwiki_conceallevel = 0
" Control the concealment of one-character markers.
let g:vimwiki_conceal_onechar_markers = 0
" Conceal preformatted text markers.
let g:vimwiki_conceal_pre = 0
" Automatically save a modified wiki buffer when switching wiki pages.
let g:vimwiki_autowriteall = 1
" Setting the value of g:vimwiki_url_maxsave to 0 will prevent any link shortening
let g:vimwiki_url_maxsave = 0
" It is a Dictionary with the numbers of months and corresponding names. Diary uses it.
let g:vimwiki_diary_months = {
      \ 1: 'January', 2: 'February', 3: 'March',
      \ 4: 'April', 5: 'May', 6: 'June',
      \ 7: 'July', 8: 'August', 9: 'September',
      \ 10: 'October', 11: 'November', 12: 'December'
      \ }
" A string with the magic header that tells Vimwiki where the Table of Contents is located in a file.
let g:vimwiki_toc_header = 'Contents'
" The header level of the Table of Contents. Valid values are from 1 to 6.
let g:vimwiki_toc_header_level = 2
" The format of the links in the Table of Contents.
let g:vimwiki_toc_link_format = 0
" A string which specifies the prefix for all global mappings (and some local ones).Note that it must be defined before the plugin loads
" let g:vimwiki_map_prefix = '<Leader>w'
" When set to 1, enables auto-cd feature. Whenever Vimwiki page is opened, Vimwiki performs an :lcd to the root Vimwiki folder of the page's wiki.
let g:vimwiki_auto_chdir = 0
" A string with the magic header that tells Vimwiki where the generated links are located in a file.
let g:vimwiki_links_header = 'Generated Links'
" The header level of generated links. Valid values are from 1 to 6.
let g:vimwiki_links_header_level = 1
" A string with the magic header that tells Vimwiki where the generated tags are located in a file.
let g:vimwiki_tags_header = 'Generated Tags'
" The header level of generated tags. Valid values are from 1 to 5.
let g:vimwiki_tags_header_level = 1
" The number of newlines to be inserted after a header is generated. Valid values are from 0 to 2.
let g:vimwiki_markdown_header_style = 1
" Set this option to 1 to automatically generate a level 1 header when creating a new wiki page.
let g:vimwiki_auto_header = 1
" A dictionary that is used to enable/disable various key mapping groups. To disable a specific group set the value for the associated key to 0.
" To disable ALL Vimwiki key mappings use
" let g:vimwiki_key_mappings = { 'all_maps': 0, }
"
" The valid key groups and their associated mappings are shown below.
"
" `all_maps`:
"   Used to disable all Vimwiki key mappings.
" `global`:
"   |vimwiki-global-mappings| that are defined when Vim starts.
" `headers`:
"   Mappings for header navigation and manipulation:
"   |vimwiki_=|, |vimwiki_-|, |vimwiki_[[|, |vimwiki_]]|, |vimwiki_[=|
"   |vimwiki_]=|, |vimwiki_]u| , |vimwiki_[u|
" `text_objs`:
"   |vimwiki-text-objects| mappings.
" `table_format`:
"   Mappings used for table formatting.
"   |vimwiki_gqq|, |vimwiki_gww|, |vimwiki_gq1|, |vimwiki_gw1|
"   |vimwiki_<A-Left>|, |vimwiki_<A-Right>|
" `table_mappings`:
"     Table mappings for insert mode.
"     |vimwiki_<Tab>|, |vimwiki_<S-Tab>|
" `lists`:
"     Mappings for list manipulation.
"     |vimwiki_<C-Space>|, |vimwiki_gl<Space>|, |vimwiki_gL<Space>| |vimwiki_gln|, |vimwiki_glp|
"     |vimwiki_gll|, |vimwiki_gLl|, |vimwiki_glh|, |vimwiki_gLh|, |vimwiki_glr|, |vimwiki_gLr|
"     |vimwiki_glsar|, |vimwiki_gLstar|, |vimwiki_gl#|, |vimwiki_gL#|, |vimwiki_gl-|, |vimwiki_gL-|
"     |vimwiki_gl1|, |vimwiki_gL1|, |vimwiki_gla|, |vimwiki_gLa|, |vimwiki_glA|, |vimwiki_gLA|
"     |vimwiki_gli|, |vimwiki_gLi|, |vimwiki_glI|, |vimwiki_gLI|, |vimwiki_glx|
" `links`:
"     Mappings for link creation and navigation.
"     |vimwiki_<Leader>w<Leader>i|, |vimwiki_<CR>|, |vimwiki_<S-CR>|, |vimwiki_<C-CR>|
"     |vimwiki_<C-S-CR>|, |vimwiki_<D-CR>|, |vimwiki_<Backspace>|, |vimwiki_<Tab>|
"     |vimwiki_<S-Tab>|, |vimwiki_<Leader>wd|, |vimwiki_<Leader>wr|, |vimwiki_<C-Down>|
"     |vimwiki_<C-Up>|, |vimwiki_+|, |vimwiki_<Backspace>|
" `html`:
"     Mappings for HTML generation.
"     |vimwiki_<Leader>wh|, |vimwiki_<Leader>whh|
" `mouse`:
"     Mouse mappings, see |vimwiki_mouse|. This option is disabled by default.
"
" The default is to enable all key mappings except the mouse:
let g:vimwiki_key_mappings =
   \ {
   \   'all_maps': 1,
   \   'global': 1,
   \   'headers': 1,
   \   'text_objs': 1,
   \   'table_format': 1,
   \   'table_mappings': 1,
   \   'lists': 1,
   \   'links': 1,
   \   'html': 1,
   \   'mouse': 0,
   \ }
" A list of additional fileypes that should be registered to vimwiki files
let g:vimwiki_filetypes = []






" 快捷键
nmap <space>ww <esc>:<c-u>VimwikiIndex<cr>
nmap <space>wt <esc>:<c-u>VimwikiTabIndex<cr>
nmap <space>wi <esc>:<c-u>VimwikiDiaryIndex<cr>

augroup vime_vimwiki_group
    autocmd!
    autocmd FileType wiki,md,markdown setl colorcolumn=0
    autocmd FileType wiki,md,markdown setl textwidth=0

    " 避免g:vimwiki_hl_cb_checked设置为2的时候有问题
    au BufEnter *.wiki :syntax sync fromstart
augroup END


    " autocmd FileType wiki,md,markdown setl conceallevel=0
