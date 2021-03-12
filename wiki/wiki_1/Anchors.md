:vimwiki:
# Anchors

Every header, tag, and bold text can be used as an anchor.  To jump to it, use a wikilink of the form >
[[file#anchor]]

For example, consider the following file "Todo.wiki": >
= My tasks =
`:todo-lists:`
== Home ==
 - [ ] bathe my dog
== Work ==
 - [ ] beg for *pay rise*
== Knitting club ==
=== Knitting projects ===
 - [ ] a *funny pig*
 - [ ] a *scary dog*

Then, to jump from your index.wiki directly to your knitting projects, use: >
[[Todo#Knitting projects]]

Or, to jump to an individual project, use this link: >
[[Todo#funny pig]]

Or, to jump to a tag, use this link: >
[[Todo#todo-lists]]

If there are multiple instances of an anchor, you can use the long form which consists of the complete header hierarchy, separated by '#': >
[[Todo#My tasks#Knitting club#Knitting projects#scary dog]]

If you don't feel like typing the whole stuff, type just [[Todo# and then |i_CTRL-X_CTRL-O| to start the omni completion of anchors.

For jumping inside a single file, you can omit the file in the link: >
[[#pay rise]]
