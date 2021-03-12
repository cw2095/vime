:vimwiki:
# Lists

While writing lists, the keys <CR>, o and O insert new bullets or numbers as you would expect it. A new bullet/number is inserted if and only if the cursor is in a list item. If you use hard line wraps within your lists then you will need to remap `<CR>` to `VimwikiReturn 3 5`, use <S-CR>, or press <CR> and <C-L><C-M>.

Note that the mapping <S-CR> is not available in all terminals.

Furthermore, <CR> and <S-CR> behave differently when the cursor is behind an empty list item. See the table below.

To customize the behavior you should use an autocmd or place the mappings in `~/.vim/after/ftplugin/vimwiki.vim`. This is necessary to avoid an error that the command `VimwikiReturn` doesn't exist when editing non Vimwiki files.: >

```vim
autocmd FileType vimwiki inoremap <silent><buffer> <CR>
    \ <C-]><Esc>:VimwikiReturn 3 5<CR>
autocmd FileType vimwiki inoremap <silent><buffer> <S-CR>
    \ <Esc>:VimwikiReturn 2 2<CR>
```

The level of a list item is determined by its indentation (default and Markdown syntax) or by the number of list symbols (MediaWiki syntax).

Use gll and glh in normal mode to increase or decrease the level of a list item. The symbols are adjusted automatically to the list items around it.

Use gLl and gLh to increase or decrease the level of a list item plus all list items of lower level below it, that is, all child items.

Use <C-T> and <C-D> to change the level of a list item in insert mode.

Use gl followed by the desired symbol to change the symbol of a list item or create one. Type gL and the symbol to change all items of the current list.

For default syntax, the following types are available: >
- hyphen
* asterisk
# hash
1. number with period
1) number with parenthesis
a) lower-case letter with parenthesis
A) upper-case letter with parenthesis
i) lower-case Roman numerals with parenthesis
I) upper-case Roman numerals with parenthesis

Markdown syntax has the following types: >
- hyphen
* asterisk
+ plus
1. number with period

MediaWiki syntax only has: >
* asterisk
# hash

In insert mode, use the keys <C-L><C-J> and <C-L><C-K> to switch between symbols. For convenience, only the commonly used symbols can be reached through these keys for default syntax.

Note that such a list: a) b) c) … only goes up to zz), to avoid confusion with normal text followed by a parenthesis.

Roman numerals go up to MMMM) and numbers up to 2147483647. or 9223372036854775807. depending if your Vim is 32 or 64 bit.

Also, note that you can, of course, mix different list symbols in one list, but if you have the strange idea of putting a list with Roman numerals right after a list using letters or vice versa, Vimwiki will get confused because it cannot distinguish which is which (at least if the types are both upper case or both lower case).

--------

**Todo lists**

You can have todo lists -- lists of items you can check/uncheck.

Consider the following example: >
* [X] Toggle list item on/off.
  * [X] Simple toggling between [ ] and [X].
  * [X] All list's subitems should be toggled on/off appropriately.
  * [X] Toggle child subitems only if current line is list item
  * [X] Parent list item should be toggled depending on its child items.
* [X] Make numbered list items toggleable too
* [X] Add highlighting to list item boxes
* [X] Add [ ] to the next list item created with o, O and <CR>.

Pressing <C-Space> on the first list item will toggle it and all of its child items: >
* [ ] Toggle list item on/off.
  * [ ] Simple toggling between [ ] and [X].
  * [ ] All of a list's subitems should be toggled on/off appropriately.
  * [ ] Toggle child subitems only if the current line is a list item.
  * [ ] Parent list item should be toggled depending on their child items.
* [X] Make numbered list items toggleable too.
* [X] Add highlighting to list item boxes.
* [X] Add [ ] to the next list item created using o, O or <CR>.

Pressing <C-Space> on the third list item will toggle it and adjust all of its parent items: >
* [.] Toggle list item on/off.
  * [ ] Simple toggling between [ ] and [X].
  * [X] All of a list's subitems should be toggled on/off appropriately.
  * [ ] Toggle child subitems only if current line is list item.
  * [ ] Parent list item should be toggled depending on its child items.
* [ ] Make numbered list items toggleable too.
* [ ] Add highlighting to list item boxes.
* [ ] Add [ ] to the next list item created using o, O or <CR>.

Parent items should change when their child items change. If not, use glr. The symbol between [ ] depends on the percentage of toggled child items: >
[ ] -- 0%
[.] -- 1-33%
[o] -- 34-66%
[O] -- 67-99%
[X] -- 100%

You can use gln and glp to change the "done" status of a checkbox without a childitem.

It is possible to toggle several list items using visual mode. But note that instead of toggling every item individually, all items get checked if the first item was unchecked and all items get unchecked if the first item was checked.

Use gl<Space> to remove a single checkbox and gL<Space> to remove all checkboxes of the list the cursor is in.

You can mark an item as rejected ("won't do") with glx. A rejected item will not influence the status of its parents.

