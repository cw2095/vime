:vimwiki:
# Tables

Use the  :VimwikiTable command to create a default table with 5 columns and 2 rows: >
|   |   |   |   |   |
|---|---|---|---|---|
|   |   |   |   |   |
<

Tables are auto-formattable. Let's add some text into first cell: >
| First Name  |   |   |   |   |
|---|---|---|---|---|
|   |   |   |   |   |
<

Whenever you press <TAB>, <CR> or leave Insert mode, the table is formatted: >
| First Name |   |   |   |   |
|------------|---|---|---|---|
|            |   |   |   |   |
<

You can easily create nice-looking text tables, just press <TAB> and enter new values: >
| First Name | Last Name  | Age | City     | e-mail               |
|------------|------------|-----|----------|----------------------|
| Vladislav  | Pokrishkin | 31  | Moscow   | vlad_pok@smail.com   |
| James      | Esfandiary | 27  | Istanbul | esfandiary@tmail.com |
<

To indent table indent the first row. Then format it with 'gqq'.

You can specify the type of horizontal alignment for columns in the separator using the ':' character. The default is left-align.  >
| Date       |  Item  |   Price |
|------------|:------:|--------:|
| yest       | Coffee |  $15.00 |
| 2017-02-13 |  Tea   |   $2.10 |
| 2017-03-14 |  Cake  | $143.12 |
<
