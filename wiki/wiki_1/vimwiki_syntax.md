:vimwiki:
# vimwiki syntax

## Contents

- [vimwiki syntax](#vimwiki syntax)
    - [Typefaces](#vimwiki syntax#Typefaces)
    - [Links](#vimwiki syntax#Links)
        - [Wikilinks](#vimwiki syntax#Links#Wikilinks)
        - [Interwiki](#vimwiki syntax#Links#Interwiki)
        - [Diary](#vimwiki syntax#Links#Diary)
        - [Anchors](#vimwiki syntax#Links#Anchors)
        - [Raw URLs](#vimwiki syntax#Links#Raw URLs)
        - [External files](#vimwiki syntax#Links#External files)
        - [Transclusion (Wiki-Include) Links](#vimwiki syntax#Links#Transclusion (Wiki-Include) Links)
        - [Thumbnail links](#vimwiki syntax#Links#Thumbnail links)
        - [Markdown Links](#vimwiki syntax#Links#Markdown Links)
    - [Headers](#vimwiki syntax#Headers)
    - [Paragraphs](#vimwiki syntax#Paragraphs)
    - [Lists](#vimwiki syntax#Lists)
    - [Tables](#vimwiki syntax#Tables)
    - [Preformatted text](#vimwiki syntax#Preformatted text)
    - [Mathematical formulae](#vimwiki syntax#Mathematical formulae)
    - [Blockquotes](#vimwiki syntax#Blockquotes)
    - [Comments](#vimwiki syntax#Comments)
    - [Horizontal line](#vimwiki syntax#Horizontal line)
    - [Tags](#vimwiki syntax#Tags)

## Typefaces

There are a few typefaces that give you a bit of control over how your text is decorated:>

*bold text*
_italic text_
_*bold italic text*_
*_bold italic text _*
~~strikeout text~~
`code (no syntax) text`
super^script^
sub,,script,,

For Markdown syntax these variations are used:>

**bold text** or __bold text__
*italic text* or _italic text_
***bold_italic text*** or ___italic_bold text___

Furthermore, there are a number of words which are highlighted extra flashy:>

TODO, DONE, STARTED, FIXME, FIXED, XXX.

## Links

### Wikilinks

Plain link: >
[[This is a link]]
With description: >
[[This is a link source|Description of the link]]

Wiki files don't need to be in the root directory of your wiki, you can put them in subdirectories as well: >
[[projects/Important Project 1]]
To jump from that file back to the index file, use this link: >
[[../index]]
or: >
[[/index]]
The latter works because wiki links starting with "/" are considered to be absolute to the wiki root directory, that is, the link [[/index]] always opens the file /path/to/your/wiki/index.wiki, no matter in which subdirectory you are currently in.

Links to subdirectories inside the wiki directory are also supported. They end with a "/": >
[[a subdirectory/|Other files]]

Typing wikilinks can be simplified by using Vim's omni completion (see |compl-omni|) like so: >
[[ind<C-X><C-O>
which opens up a popup menu with all the wiki files starting with "ind".

### Interwiki

If you maintain more than one wiki, you can create interwiki links between them by adding a numbered prefix "wikiX:" in front of a link: >
[[wiki1:This is a link]]
or: >
[[wiki1:This is a link source|Description of the link]]

The number behind "wiki" is in the range 0..N-1 and identifies the destination wiki in |g:vimwiki_list|.

Named interwiki links are also supported in the format "wn.name:link" >
[[wn.My Name:This is a link]]
or: >
[[wn.MyWiki:This is a link source|Description of the link]]

### Diary

The "diary:" scheme is used to link to diary entries: >
[[diary:2012-03-05]]

### Anchors

A wikilink, interwiki link or diary link can be followed by a '#' and the name of an anchor.  When opening a link, the cursor jumps to the anchor. >
[[Todo List#Tomorrow|Tasks for tomorrow]]

To jump inside the current wiki file you can omit the file: >
[[#Tomorrow]]

### Raw URLs

Raw URLs are also supported: >
https://github.com/vimwiki/vimwiki.git
mailto:habamax@gmail.com
ftp://vim.org

### External files

The "file:" and "local:" schemes allow you to directly link to arbitrary resources using absolute or relative paths: >
[[file:/home/somebody/a/b/c/music.mp3]]
[[file:C:/Users/somebody/d/e/f/music.mp3]]
[[file:~/a/b/c/music.mp3]]
[[file:../assets/data.csv|Important Data]]
[[local:C:/Users/somebody/d/e/f/music.mp3]]
[[file:/home/user/documents/|Link to a directory]]

These links are opened with the system command, i.e. !xdg-open (Linux), !open(Mac), or !start (Windows).

In Vim, "file:" and "local:" behave the same, i.e. you can use them with both relative and absolute links. When converted to HTML, however, "file:" links will become absolute links, while "local:" links become relative to the HTML output directory. The latter can be useful if you copy your HTML files to another computer.

### Transclusion (Wiki-Include) Links

Links that use "{{" and "}}" delimiters signify content that is to be included into the HTML output, rather than referenced via hyperlink.

Wiki-include URLs may use any of the supported schemes, may be absolute or relative, and need not end with an extension.

The primary purpose for wiki-include links is to include images.

Transclude from a local URL: >
{{file:../../images/vimwiki_logo.png}}
or from a universal URL: >
{{http://vimwiki.googlecode.com/hg/images/vimwiki_logo.png}}

Transclude image with alternate text: >
{{http://vimwiki.googlecode.com/hg/images/vimwiki_logo.png|Vimwiki}}
in HTML: >
<img src="http://vimwiki.googlecode.com/hg/images/vimwiki_logo.png"
alt="Vimwiki"/>

Transclude image with alternate text and some style: >
{{http://.../vimwiki_logo.png|cool stuff|style="width:150px;height:120px;"}}
in HTML: >
<img src="http://vimwiki.googlecode.com/hg/images/vimwiki_logo.png"
alt="cool stuff" style="width:150px; height:120px"/>

Transclude image _without_ alternate text and with a CSS class: >
{{http://.../vimwiki_logo.png||class="center flow blabla"}}
in HTML: >
<img src="http://vimwiki.googlecode.com/hg/images/vimwiki_logo.png"
alt="" class="center flow blabla"/>

### Thumbnail links

Thumbnail links are constructed like this: >
[[http://someaddr.com/bigpicture.jpg|{{http://someaddr.com/thumbnail.jpg}}]]

in HTML: >
<a href="http://someaddr.com/ ... /.jpg">
<img src="http://../thumbnail.jpg /></a>

### Markdown Links

These links are only available for Markdown syntax.  See
http://daringfireball.net/projects/markdown/syntax#link.

Inline link: >
[Looks like this](URL)

Image link: >
![Looks like this](URL)

Reference-style links: >
a) [Link Name][Id]
b) [Id][], using the "implicit link name" shortcut

Reference style links must always include two consecutive pairs of [-brackets, and field entries can not use "[" or "]".

NOTE: (in Vimwiki's current implementation) Reference-style links are a hybrid of Vimwiki's default "Wikilink" and the tradition reference-style link.

If the Id is defined elsewhere in the source, as per the Markdown standard: >
[Id]: URL

then the URL is opened with the system default handler.  Otherwise, Vimwiki treats the reference-style link as a Wikilink, interpreting the Id field as a wiki page name.

Highlighting of existing links when |vimwiki-option-maxhi| is activated identifies links whose Id field is not defined, either as a reference-link or as a wiki page

To scan the page for new or changed definitions for reference-links, simply re-open the page ":e<CR>".

## Headers

= Header level 1 =
== Header level 2 ==
=== Header level 3 ===
==== Header level 4 ====
===== Header level 5 =====
====== Header level 6 ======

You can center your headers in HTML by placing spaces before the first '=':
                     = Centered Header L1 =

## Paragraphs

A paragraph is a group of lines starting in column 1 (no indentation).
Paragraphs are separated by a blank line:

This is first paragraph
with two lines.

This is a second paragraph with
two lines.

## Lists

Unordered lists: >
- Bulleted list item 1
- Bulleted list item 2
or: >
* Bulleted list item 1
* Bulleted list item 2

Ordered lists: >
1. Numbered list item 1
2. Numbered list item 2
3. Numbered list item 3
or: >
1) Numbered list item 1
2) Numbered list item 2
3) Numbered list item 3
or: >
a) Numbered list item 1
b) Numbered list item 2
c) Numbered list item 3
or: >
A) Numbered list item 1
B) Numbered list item 2
C) Numbered list item 3
or: >
i) Numbered list item 1
ii) Numbered list item 2
iii) Numbered list item 3
or: >
I) Numbered list item 1
II) Numbered list item 2
III) Numbered list item 3

Note that a space after the list item symbols (-, *, 1. etc.) is essential.

You can nest and mix the various types: >
- Bulleted list item 1
- Bulleted list item 2
    a) Numbered list sub item 1
    b) more ...
        * and more ...
        * ...
    c) Numbered list sub item 3
        1. Numbered list sub sub item 1
        2. Numbered list sub sub item 2
    d) etc.
- Bulleted list item 3

List items can span multiple lines: >
* Item 1
  Item 1 continued line.
  Item 1 next continued line.
* Item 2
  - Sub item 1
    Sub item 1 continued line.
    Sub item 1 next continued line.
  - Sub item 2
  - etc.
  Continuation of Item 2
  Next continuation of Item 2

Definition lists: >
Term 1:: Definition 1
Term 2::
:: Definition 2
:: Definition 3

## Tables

Tables are created by entering the content of each cell separated by | delimiters. You can insert other inline wiki syntax in table cells, including typeface formatting and links.

For example: >
| Year | Temperature (low) | Temperature (high) |
|------|-------------------|--------------------|
| 1900 | -10               | 25                 |
| 1910 | -15               | 30                 |
| 1920 | -10               | 32                 |
| 1930 | _N/A_             | _N/A_              |
| 1940 | -2                | 40                 |
>

In HTML the following part >
| Year | Temperature (low) | Temperature (high) |
|------|-------------------|--------------------|
>
is highlighted as a table header.

If you indent a table then it will be centered in HTML.

If you put > in a cell, the cell spans the left column.
If you put \/ in a cell, the cell spans the above row.

For example: >
| a  | b  | c | d |
| \/ | e  | > | f |
| \/ | \/ | > | g |
| h  | >  | > | > |
>

## Preformatted text

Use {{{ and }}} to define a block of preformatted text:
{{{ >
  Tyger! Tyger! burning bright
   In the forests of the night,
    What immortal hand or eye
     Could frame thy fearful symmetry?
  In what distant deeps or skies
   Burnt the fire of thine eyes?
    On what wings dare he aspire?
     What the hand dare sieze the fire?
}}}

You can add optional information after the {{{: >
{{{class="brush: python" >
 def hello(world):
     for x in range(10):
         print("Hello {0} number {1}".format(world, x))
}}}

Result of HTML export: >
 <pre class="brush: python">
 def hello(world):
     for x in range(10):
         print("Hello {0} number {1}".format(world, x))
 </pre>

This might be useful for coloring program code with external JS tools such as Google's syntax highlighter.

You can setup Vimwiki to highlight code snippets in preformatted text.

## Mathematical formulae

Mathematical formulae are highlighted, and can be rendered in HTML using the powerful open source display engine MathJax (http://www.mathjax.org/).

## Blockquotes

Text which starts with 4 or more spaces is a blockquote.

This would be a blockquote in Vimwiki. It is not highlighted in Vim but could be styled by CSS in HTML. Blockquotes are usually used to quote a long piece of text from another source.

## Comments

A line that starts with %% is a comment.

E.g.: >
%% this text would not be in HTML
<

## Horizontal line

4 or more dashes at the start of the line is a horizontal line (<hr />): >
------
<

## Tags

You can tag a wiki file, a header or an arbitrary place in a wiki file. Then, you can use Vim's built-in tag search functionality or Vimwiki's tag related commands to quickly jump to all occurrences of the tag.

A tag is a sequence of non-space characters between two colons: >
`:tag-example:`
<
It is allowed to concatenate multiple tags in one line: >
`:tag-one:tag-two:`
<
If placed in the first two lines of a file, the whole file is tagged.  If placed under a header, within the 2 lines below it, the header is then tagged with this tag, and the tag search commands will jump to this specific header. Otherwise, the tag stands of its own and the search command jumps directly to it.

Typing tags can be simplified by using Vim's omni completion like so: >
:ind<C-X><C-O>
which opens up a popup menu with all tags defined in the wiki starting with "ind".

Tags are also treated as |vimwiki-anchors| (similar to bold text).

Note that the tag search/jump/completion commands need certain metadata saved in the wiki folder.  This metadata file can be manually updated by running |:VimwikiRebuildTags|.  When the option |vimwiki-option-auto_tags| is enabled, the tags metadata will be auto-updated on each page save.

Tags-related commands and options:
   * |:VimwikiRebuildTags|
   * |:VimwikiGenerateTagLinks|
   * |:VimwikiSearchTags|
   * |vimwiki-option-auto_tags|
