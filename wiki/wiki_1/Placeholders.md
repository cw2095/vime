:vimwiki:
# Placeholders

%title Title of the page

When you htmlize your wiki page, the default title is the filename of the page. Place >
%title My books
into your wiki page if you want another title.

--------

%nohtml

If you do not want a wiki page to be converted to HTML, place:
%nohtml
into it.

-------

%template

To apply a concrete HTML template to a wiki page, place:
%template name
into it.

---------

%date

The date of the wiki page. The value can be used in the HTML template.
%date 2017-07-08
%date
If you omit the date after the placeholder, the date of the HTML conversion is used.

