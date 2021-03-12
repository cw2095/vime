:vimwiki:
# vimwiki syntax

## Contents

- [vimwiki syntax](#vimwiki syntax)
    - [Typefaces](#vimwiki syntax#Typefaces)
    - [Todo lists](#vimwiki syntax#Todo lists)

## Typefaces

*bold text*
_italic text_
_*bold italic text*_
*_bold italic text _*
~~strikeout text~~
`code (no syntax) text`
super^script^
sub,,script,,

## Todo lists

You can have todo lists -- lists of items you can check/uncheck.

Consider the following example: >

**Toggleable list of todo items**

-  Toggle list item on/off.
     -  Simple toggling between  and .
     -  All of a list's subitems should be toggled on/off appropriately.
     -  Toggle child subitems only if the current line is a list item.
     -  Parent list item should be toggled depending on their child items.
   -  Make numbered list items toggleable too.
   -  Add highlighting to list item boxes.
   -  Add to the next list item created using o, O or <CR>.

